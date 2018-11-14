require 'rails_helper'

RSpec.describe Route, type: :model do
  let(:route) { FactoryBot.build(:route) }

  it "is valid with valid attributes" do
    expect(route).to be_valid
  end

  it "is invalid without a name" do
    route.name = nil
    expect(route).to_not be_valid
  end

  it "is invalid without a rating" do
    route.rating = nil
    expect(route).to_not be_valid
  end

  it "is invalid without a route_type" do
    route.route_type = nil
    expect(route).to_not be_valid
  end

  it "is invalid without pitches" do
    route.pitches = nil
    expect(route).to_not be_valid
  end
end
