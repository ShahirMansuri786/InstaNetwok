FactoryBot.define do
  factory :message do
    association :room  
    content { Faker::Lorem.sentence }
  end
end  