FactoryBot.define do
  factory :review do
    comments {"Factory comment string"}
    reviewer {"Factory reviewer string"}
    rating { 1 }
    route { FactoryBot.create(:route) }
  end
end
