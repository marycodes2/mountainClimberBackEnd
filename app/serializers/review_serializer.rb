class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :reviewer, :comments, :rating
end
