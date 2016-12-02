Feature: Managing Projects
  As a project manager
  I should be able to create and edit events
  So that volunteers can sign up for individual events

  Background:
    Given I am a project manager
    Given the following users exist:
      | email                 | password | first_name | last_name |
      | admin@gmail.com       | testPass | Admin      | Guy       |

  Scenario: Creating and Updating an Event
    Given I am on the projects page
    When I follow "New Project"
    Then I should be on the new project page
    And I fill in "Name" with "Tester Project"
    And I fill in "Description" with "Tester Project for Events"
    And I fill in "Volunteer capacity" with "25"
    And I fill in "Volunteers" with "10"
    And I fill in "Location" with "Berkeley"
    And I press "Create Project"
    When I follow "Project Listings"
    Then I should be on the projects page
    And I should see "Tester Project"
    And I follow "Tester Project"

    Then I should see "Create Event"
    Then I follow "Create Event"
    Then I should be on the new event page
    And I fill in "Name" with "Tester Event"
    And I fill in "Description" with "Tester Event basic description"
    And I fill in "Location" with "Berkeley"
    And select "Yes" from "Repeats:"
    And I press "Create Event"

    Then I should see "Tester Event"
    And I should see "Tester Event basic description"
    And I should see "Berkeley"



