FactoryGirl.define do
  factory :certification do
    name { Faker::Job.key_skill }
  end
end
