Feature: Viewing Project Information
  As a volunteer for Engineers Without Borders
  I should be able to view information about various projects
  So that I can choose projects to apply for

  Scenario: Clicking on a Project Listing
    Given I am a new, authenticated user
    Given there exists a project "Remba Island Project"
    Given I am on the projects page
    When I follow the project link for "Remba Island Project"
    Then I should see "Creating a large-scale water filter system"
    And I should see "Remba Island, Kenya"
    And I should see "Luke Skywalker"
    And I should see "testing@man.net"
    And I should see "Project has 0 volunteers, needs 25 more!"
