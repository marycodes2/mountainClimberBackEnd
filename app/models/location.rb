class Location < ApplicationRecord
  has_many :routes
  has_many :reviews, through: :routes
  belongs_to :state
end
