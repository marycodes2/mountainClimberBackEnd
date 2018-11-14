require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { FactoryBot.build(:location) }

  it "is valid with valid attributes" do
    expect(location).to be_valid
  end

  it "is invalid without a name" do
    location.name = nil
    expect(location).to_not be_valid
  end
end
