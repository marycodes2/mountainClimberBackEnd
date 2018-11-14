FactoryBot.define do
  factory :location do
    name {"Test location name"} 
    state { FactoryBot.create(:state) }   
  end
end
