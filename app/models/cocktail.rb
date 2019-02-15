class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  belongs_to :glass, optional: true

  validates :name, uniqueness: true, presence: true
end
