class Food < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods
  belongs_to :user
end
