class Recipe < ApplicationRecord
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags

  validates :name, presence: true
  validates :ingredients, presence: true
  validates :instructions, presence: true

  def friendly_prep_time
    if total_prep_time != nil
      hours = total_prep_time / 60
      minutes = total_prep_time % 60
      result = ""
      result += "#{hours} hours" if hours > 0
      result += "#{minutes} minutes" if minutes > 0
    end 
    result
  end
end
