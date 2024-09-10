# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    association :user  
    caption { Faker::Lorem.sentence }
  end
end  