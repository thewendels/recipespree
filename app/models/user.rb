class User < ApplicationRecord
  has_secure_password

  has_many :recipe_tags
  has_many :recipes, through: :recipe_tags
  has_many :tags, through: :recipe_tags

  validates :username, presence: true, uniqueness: true, length: {in: 3..20}
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {in: 8..20}, confirmation: true
end
