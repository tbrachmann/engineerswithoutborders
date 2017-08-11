Feature: Adding "In-Demand Skills" to individual project pages
    As a project manager
    I want to be able to add new "In Demand" qualities to my projects
    So I can find volunteers with qualities I really need

Background:
    Given I am a project manager on "Remba Island Project"
    Given the project "Remba Island Project" has the following in demand qualities:
      | name                     | type                   |
      | Water Filtration Systems | ConstructionExperience |
      | Pump Design              | DesignExperience       |
    And I am on the home page
    And I follow "My Projects"

Scenario: Edit "In Demand" qualities on a project
    When I follow "Remba Island"
    Then I should see "Water Filtration Systems"
    And I should see "Pump Design"
    When I follow "Edit In Demand"
    Then I should see "Editing In Demand on Remba Island Project"
