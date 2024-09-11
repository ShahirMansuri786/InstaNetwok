FactoryBot.define do
  factory :comment do
    association :post 
    comment_text {Faker::Lorem.sentence} 
  end
end 