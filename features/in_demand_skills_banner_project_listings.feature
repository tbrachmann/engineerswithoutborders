Feature: "In-Demand Skills" banner on Projects Listings page
    As a volunteer
    I want to see all the currently "In Demand" qualities on the projects listing page
    So I can see if I am especially qualified for any particular project

Background:
    Given I am a volunteer
    And I am on the "Projects Listings" page
    And I should see "Remba Island"
    And I should see "Peru Project"

Scenario: viewing "In-Demand" qualities on projects listings page
    And I should see "In-Demand Skills"
    And I should see "Water Filtration Systems"
    And I should see "Geotechnical Engineering"
    And I should see "Pump Design"
    And I should not see "Evironmental Engineering"