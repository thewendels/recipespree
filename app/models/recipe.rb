require 'open-uri'

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags

  validates :user_id, presence: true
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  def self.get_nokogiri_object(url)
    parsed_object = Nokogiri::HTML(
      URI.open(url)
    )
  end

  def self.find_recipe_schema(parsed_object)
    unparsed_jsons = parsed_object.css("script[type='application/ld+json']")
    parsed_jsons = unparsed_jsons.map { |json| JSON.parse(json.text) }
    # Handle different possibilities for what lives in the parsed_jsons
    recipe_schema = ""
    parsed_jsons.each do |parsed_json|
      if parsed_json['@type'] == 'Recipe'
        recipe_schema = parsed_json
      elsif parsed_json['@graph'].class == Array
        parsed_json['@graph'].each do |graph_element|
          if graph_element['@type'] == 'Recipe'
            recipe_schema = graph_element
          end
        end
      #deal with arrays with no graph 
      end
    end
    return recipe_schema
  end

  def self.find_site_name(parsed_object)
    site_name = parsed_object.css('meta[property="og:site_name"]').first['content']
  end

  def self.transform_prep_time_to_min(pttime)
    if pttime == nil
      0
    else
      pttime.delete!("PT")
      hours = ""
      minutes = ""
      mode = ""
      i = pttime.length - 1
      while i >= 0
        if pttime[i] == "M"
          mode = "min"
        elsif pttime[i] == "H"
          mode = "hr"
        else  
          if mode == "min"
            minutes = pttime[i] + minutes
          elsif mode == "hr"
            hours = pttime[i] + hours
          end
        end
        i -= 1
      end
      minutes.to_i + (hours.to_i * 60)
    end
  end

  def self.transform_recipe(recipe_schema, site_name, url) 
    # Sanitize intro (remove HTML)
    if url.include?("barefootcontessa.com")
      intro = ""
    else
      intro = ActionView::Base.full_sanitizer.sanitize(recipe_schema["description"])
    end
    # Handle array vs single string ingredients
    if recipe_schema["recipeIngredient"].class == Array
      ingredients = recipe_schema["recipeIngredient"].join("\n")
    elsif recipe_schema["recipeIngredient"].class == String
      ingredients = recipe_schema["recipeIngredient"]
    end
    # Handle array vs single string instructions
    if recipe_schema["recipeInstructions"].class == Array
      instructions = recipe_schema["recipeInstructions"].map do |instruction| 
        ActionView::Base.full_sanitizer.sanitize(instruction["text"].gsub("\n", "")) 
      end.join("\n")
    elsif recipe_schema["recipeInstructions"].class == String
      instructions = ActionView::Base.full_sanitizer.sanitize(recipe_schema["recipeInstructions"])
    end
    # Handle array vs single image
    if recipe_schema["image"].class == Array
      image = recipe_schema["image"][0]
    elsif recipe_schema["image"].class == String
      image = recipe_schema["image"]
    elsif recipe_schema["image"].class == Hash
      image = recipe_schema["image"]["url"]
    end
    # Build the recipe object
    {
      name: recipe_schema["name"],
      source: site_name,
      recipe_url: url,
      servings: recipe_schema["recipeYield"],
      total_prep_time: transform_prep_time_to_min(recipe_schema["totalTime"]),
      intro: intro,
      ingredients: ingredients,
      instructions: instructions,
      image_url: image
    }
  end

  def friendly_prep_time
    if total_prep_time != nil
      hours = total_prep_time / 60
      minutes = total_prep_time % 60
      result = ""
      result += "#{hours} hour" if hours == 1
      result += "#{hours} hours" if hours > 1
      result += " #{minutes} minute" if minutes == 1
      result += " #{minutes} minutes" if minutes > 1
    end 
    result
  end

  def stepped_ingredients
      ingredients.split("\n").map { |ingredient|  ingredient.strip }
  end

  def stepped_instructions
    instructions.split("\n").map { |instruction|  instruction.strip }.reject { |instruction| instruction.empty? }
end

end
