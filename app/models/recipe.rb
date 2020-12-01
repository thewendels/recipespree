class Recipe < ApplicationRecord
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  validates :name, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true
end
