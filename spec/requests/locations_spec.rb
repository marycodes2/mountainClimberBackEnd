require 'rails_helper'

describe "GET /v1/locations" do
  let(:locations) { FactoryBot.create_list(:location, 5, state: FactoryBot.create(:state)) }

  before { get api_v1_locations_path }

  it "returns HTTP status 200" do
    expect(response).to have_http_status 200
  end

  it "returns all locations"
  it "returns associated routes"
  it "returns associated comments"
end