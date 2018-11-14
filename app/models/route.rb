class Route < ApplicationRecord
  belongs_to :location
  has_many :reviews

  validates :name, presence: true
  validates :rating, presence: true
  validates :route_type, presence: true
  validates :pitches, presence: true
end
