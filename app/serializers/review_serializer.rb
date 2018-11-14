class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :reviewer, :comments, :rating, :route_id, :errors, :route_id
end
