class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :recipes
  has_many :foods
end
