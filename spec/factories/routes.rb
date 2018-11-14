FactoryBot.define do
  factory :route do
    name {"Factory Route Name"}
    latitude { nil }
    longitude { nil }
    mpid { nil }
    pitches { 3 }
    rating { "3.4" }
    route_type { "Traditional" }
    location { FactoryBot.create(:location) }
  end
end
