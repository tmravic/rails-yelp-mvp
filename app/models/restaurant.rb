class Restaurant < ApplicationRecord
  # validations
  CATEGORIES = %w[chinese italian japanese french belgian].freeze
  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: CATEGORIES }
  has_one_attached :photo, dependent: :destroy
  validates :photo, content_type: [:png, :jpg, :jpeg]

  # associations
  has_many :reviews, dependent: :destroy
end
