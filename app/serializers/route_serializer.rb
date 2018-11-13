class RouteSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :pitches, :imgMedium, :latitude, :longitude, :route_type
  has_many :reviews
end
