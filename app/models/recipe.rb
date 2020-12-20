require 'open-uri'

class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_tags, dependent: :destroy
  has_many :tags, through: :recipe_tags

  validates :user_id, presence: true
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  def self.scrape_recipe(url)
    parsed_recipe = Nokogiri::HTML(
      URI.open(url)
    )
    schemas = parsed_recipe.css("script[type='application/ld+json']")
    parsed_schemas = schemas.map { |schema| JSON.parse(schema.text) }
    recipe_schema = parsed_schemas.find do |parsed_schema|
      parsed_schema['@type'] == 'Recipe'
    end
  end

  def self.transform_recipe(recipe, url) 
    if recipe["image"].class == Array
      image = recipe["image"][0]
    elsif recipe["image"].class == String
      image = recipe["image"]
    end
    {
      name: recipe["name"],
      source: recipe["author"]["name"], #update this to grab name of site not person
      recipe_url: url,
      servings: recipe["recipeYield"],
      # total_prep_time: ,
      intro: recipe["description"],
      ingredients: recipe["recipeIngredient"].join("\n"),
      instructions: recipe["recipeInstructions"].map{ |instruction| instruction["text"] }.join("\n"),
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
