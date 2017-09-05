
FactoryGirl.define do
  factory :attendance do
  	user
    clockin Time.zone.now
  end
end