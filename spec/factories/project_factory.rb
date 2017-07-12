FactoryGirl.define do
    factory :project do
        created_at { 5.years.ago }
        updated_at { 10.years.ago }
    end
end