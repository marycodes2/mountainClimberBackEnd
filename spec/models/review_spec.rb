require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { FactoryBot.build(:review) }

  it "is valid with valid inputs" do
    expect(review).to be_valid
  end

  it "is invalid without comments" do
    review.comments = nil
    expect(review).to_not be_valid
  end

  it "is invalid without a rating" do
    review.rating = nil
    expect(review).to_not be_valid
  end

  it "is invalid without a reviewer" do
    review.reviewer = nil
    expect(review).to_not be_valid
  end
end
