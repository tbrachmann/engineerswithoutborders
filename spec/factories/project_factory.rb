FactoryGirl.define do
    factory :project do
        created_at { 5.years.ago }
        updated_at { 10.years.ago }
        start_date { 2.days.ago}
        name { Faker::Movie.quote }
        description { Faker::Company.bs }
        volunteer_capacity { Faker::Number.number(2) }
        location { Faker::Address.city }
        #image { Faker::LoremPixel.image("50x50") }
        hours_per_week { Faker::Number.number(2) }
    end
end
