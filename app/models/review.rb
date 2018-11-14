class Review < ApplicationRecord
  belongs_to :route

  validates :comments, presence: true
  validates :reviewer, presence: true
  validates :rating, presence: true
end
