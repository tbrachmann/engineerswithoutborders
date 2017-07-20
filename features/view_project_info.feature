Feature: Viewing Project Information
  As a volunteer for Engineers Without Borders
  I should be able to view information about various projects
  So that I can choose projects to apply for
  
  Scenario: Clicking on a Project Listing
    Given I am a new, authenticated user
    Given I am on the projects page
    When I follow a Project Link
    Then I should see "Project Description"
    And I should see "Project Dates"
    And I should see "Project Location"
    And I should see "Project Manager"
    And I should see "Manager Contact Information"
    And I should see "Current Volunteers"
    And I should see "skill 1"
    And I should see "skill 2"