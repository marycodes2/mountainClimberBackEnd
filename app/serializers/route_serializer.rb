class RouteSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :pitches, :imgMedium, :latitude, :longitude
  has_many :reviews
end
