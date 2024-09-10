FactoryBot.define do
  factory :user_info do
    association :user  
    bio { Faker::Lorem.sentence }
  end
end  
