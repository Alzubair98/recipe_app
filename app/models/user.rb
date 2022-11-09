class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy
end
