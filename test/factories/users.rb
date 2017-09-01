
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'hello123'
  end
end