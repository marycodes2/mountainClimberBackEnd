class Review < ApplicationRecord
  belongs_to :route

  MIN_RATING = 1
  MAX_RATING = 5

  validates :comments, presence: true
  validates :reviewer, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: MIN_RATING, less_than_or_equal_to: MAX_RATING, only_integer: true}
end
