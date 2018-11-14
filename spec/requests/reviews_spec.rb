require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  context "destroy" do
    let(:review_to_delete) { FactoryBot.create(:review) }

    before do
      delete api_v1_review_path(review_to_delete)
    end

    it "returns an HTTP status 200" do
      expect(response).to have_http_status 200
    end
  end

  context "create" do
    before do
      route = FactoryBot.create(:route)
      params = {
        route_id: route.id,
        review: {
                comments: "Foo comment",
                reviewer: "A Reviewer",
                rating: 3,
                route_id: route.id
              }
      }

      post api_v1_reviews_path, params: params
    end

    it "returns an HTTP status 200" do
      expect(response).to have_http_status 200
    end
  end

  context "update" do
    before do
      route = FactoryBot.create(:route)
      review = FactoryBot.create(:review, route: route)

      params = {
        route_id: route.id,
        review: {
                comments: "Foo comment",
                reviewer: "A Reviewer",
                rating: 3,
                route_id: route.id
              }
      }

      patch api_v1_review_path(review.id), params: params
    end
    
    it "returns an HTTP status 200" do
      expect(response).to have_http_status 200
    end
  end
end
