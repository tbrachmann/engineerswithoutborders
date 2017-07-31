Feature: Adding "In-Demand Skills" to individual project pages
    As a project manager
    I want to be able to add new "In Demand" qualities to my projects
    So I can find volunteers with qualities I really need

Background:
    Given I am a project manager
    And I am on the "Project Listings" page
    And I should see "Remba Island"
    And I should see "Peru Project"
    And I follow "Remba Island"

Scenario: Add new "In Demand" qualities to a project
    Given I follow "Remba Island"
    And I should see "Water Filtration Systems"
    And I should see "Pump Design"
    And I click "Edit Project"
    And I click "Add New Quality"
    And I type in "Environmental Engineering"
    And I click "Submit"
    And I should see "Environmental Engineering"
