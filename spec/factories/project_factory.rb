# coding: utf-8
FactoryGirl.define do
    factory :project do
        created_at { 5.years.ago }
        updated_at { 10.years.ago }
        start_date { 2.days.ago}
        name { Faker::Address.city }
        description "The San Francisco–Oakland Bay Bridge (known locally as the Bay Bridge) is a complex of bridges spanning San Francisco Bay in California. As part of Interstate 80 and the direct road between San Francisco and Oakland, it carries about 260,000 vehicles a day on its two decks.[3][4] It has one of the longest spans in the United States.

The toll bridge was conceived as early as the gold rush days, but construction did not begin until 1933. Designed by Charles H. Purcell,[6][7] and built by American Bridge Company, it opened on November 12, 1936, six months before the Golden Gate Bridge. It originally carried automobile traffic on its upper deck, and trucks and interurban streetcars on the lower, but after the Key System abandoned rail service, the lower deck was converted to all-road traffic as well. In 1986 the bridge was unofficially dedicated to James Rolph.[8]"
        volunteer_capacity { Faker::Number.number(2) }
        location { Faker::Address.city }
        #image { Faker::LoremPixel.image("50x50") }
        hours_per_week { Faker::Number.number(2) }
    end
end
