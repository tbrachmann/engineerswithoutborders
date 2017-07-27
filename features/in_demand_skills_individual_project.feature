Feature: "In-Demand Skills" banner on individual project pages
    As a volunteer
    I want to see the "In-Demand" qualities for a specific project on that project's page
    So I can see if I am well matched to that project

Background:
    Given I am a volunteer
    And I am on the "Projects Listings" page
    And I should see "Remba Island"
    And I should see "Peru Project"
    And I follow "Remba Island"

Scenario: viewing "In-Demand" qualities on an individual project page
    Given I follow "Remba Island"
    And I should see "Water Filtration Systems"
    And I should see "Pump Design"
    And I should not see "Geotechnical Engineering"