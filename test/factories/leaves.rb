
FactoryGirl.define do
  factory :leave do
  	user
    from_date Faker::Date.forward(2)  
    to_date Faker::Date.forward(4) 
    status 'open'
    message Faker::Lorem.sentence
  end
end