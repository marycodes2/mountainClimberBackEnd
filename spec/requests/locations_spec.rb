require 'rails_helper'

describe "GET /v1/locations" do

  let(:state_one) { FactoryBot.create(:state) }
  let(:location_one) { FactoryBot.create(:location, name: "Location One", state: state_one)}
  let(:location_two) { FactoryBot.create(:location, name: "Location two", state: state_one)}
  let(:location_three) { FactoryBot.create(:location, name: "Location three", state: state_one)}

  before { get api_v1_locations_path }

  it "returns HTTP status 200" do
    expect(response).to have_http_status 200
  end

  it "returns all locations"
  it "returns associated routes"
  it "returns associated comments"
end