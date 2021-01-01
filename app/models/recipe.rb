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
    schemas = parsed_object.css("script[type='application/ld+json']")
    parsed_schemas = schemas.map { |schema| JSON.parse(schema.text) }
    recipe_schema = parsed_schemas.find do |parsed_schema|
      parsed_schema['@type'] == 'Recipe'
    end
  end

  def self.find_site_name(parsed_object)
    site_name = parsed_object.css('meta[property="og:site_name"]').first['content']
  end

  def self.transform_recipe(recipe_schema, site_name, url) 
    if recipe_schema["image"].class == Array
      image = recipe_schema["image"][0]
    elsif recipe_schema["image"].class == String
      image = recipe_schema["image"]
    end
    {
      name: recipe_schema["name"],
      source: site_name,
      recipe_url: url,
      servings: recipe_schema["recipeYield"],
      # total_prep_time: ,
      intro: recipe_schema["description"],
      ingredients: recipe_schema["recipeIngredient"].join("\n"),
      instructions: recipe_schema["recipeInstructions"].map{ |instruction| instruction["text"].gsub("\n", "") }.join("\n"),
      # notes: ,
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
