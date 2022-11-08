class Recipe < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :recipe_foods
  belongs_to :user
end
