class Review < ApplicationRecord
  # associations
  belongs_to :restaurant

  # validations
  validates :content, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5, message: "must be 5 or less" }
end

# A review must have content and a rating.
# A review’s rating must be a number between 0 and 5.
