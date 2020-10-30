FactoryGirl.define do
  factory :slot do
    start_time  { Faker::Internet.date }
    end_time  { Faker::Internet.date }
  	
  end
end