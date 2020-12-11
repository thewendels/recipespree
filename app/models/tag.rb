class Tag < ApplicationRecord
  belongs_to :user
  has_many :recipe_tags
  has_many :recipes, through: :recipe_tags

  validates :user_id, presence: true
  validates :name, presence: true
end
