require 'rails_helper'

RSpec.describe State, type: :model do
  let(:test_state) { FactoryBot.build(:state) }

  it "is valid with valid attributes" do
    expect(test_state).to be_valid
  end

  it "is invalid without a name" do
    test_state.name = nil
    expect(test_state).to_not be_valid
  end
end
