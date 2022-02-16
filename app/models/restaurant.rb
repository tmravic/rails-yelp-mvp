class Restaurant < ApplicationRecord
  # validations
  CATEGORIES = %w[chinese italian japanese french belgian].freeze
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  # associations
  has_many :reviews, dependent: :destroy
end
