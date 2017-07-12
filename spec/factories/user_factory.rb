FactoryGirl.define do
    factory :user do
        first_name Faker::Name.first_name
        last_name Faker::Name.last_name
        email Faker::Internet.email
        encrypted_password "asdfghjkl"
        sign_in_count 1
        created_at { 10.years.ago }
        updated_at { 10.years.ago }
        role "volunteer"
    end
    factory :manager, class: User do
        first_name Faker::Name.first_name
        last_name Faker::Name.last_name
        email Faker::Internet.email
        encrypted_password "asdfghjkl"
        sign_in_count 1
        created_at { 10.years.ago }
        updated_at { 10.years.ago }
        role "manager"
    end
end