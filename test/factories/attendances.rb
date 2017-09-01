
FactoryGirl.define do
  factory :attendance do
  	user
    clockin { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end
end