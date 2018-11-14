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

    it "returns the deleted object in the response body" do
      body = JSON.parse(response.body)
      expect(body["id"]).to eq(review_to_delete.id)
      expect(body["reviewer"]).to eq(review_to_delete.reviewer)
      expect(body["comments"]).to eq(review_to_delete.comments)
      expect(body["rating"]).to eq(review_to_delete.rating)
      expect(body["route_id"]).to eq(review_to_delete.route_id)
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

    it "returns the new object in the response body" do
      body = JSON.parse(response.body)
      expect(body["reviewer"]).to eq("A Reviewer")
      expect(body["comments"]).to eq("Foo comment")
      expect(body["rating"]).to eq(3)
    end
  end

  context "update" do
    before do
      route = FactoryBot.create(:route)
      @review = FactoryBot.create(:review, route: route)

      params = {
        route_id: route.id,
        review: {
                comments: "Foo comment",
                reviewer: "A Reviewer",
                rating: 3,
                route_id: route.id
              }
      }

      patch api_v1_review_path(@review.id), params: params
    end

    it "returns an HTTP status 200" do
      expect(response).to have_http_status 200
    end

    it "returns the updated in the response body" do
      body = JSON.parse(response.body)
      expect(body["id"]).to eq(@review.id)
      expect(body["reviewer"]).to eq("A Reviewer")
      expect(body["comments"]).to eq("Foo comment")
      expect(body["rating"]).to eq(3)
      expect(body["route_id"]).to eq(@review.route_id)
    end
  end
end
