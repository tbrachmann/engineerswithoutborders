Feature: Refactor Events 
  As a volunteer for Engineers Without Borders
  I do not want to see an Events Listing page
  Because it already exists on the main EWB page
  
  As a project manager
  I do not want to see an Events Listing page
  Because I want to reduce redundancy on my website
  
  Background:
    Given I am a project manager
    Given I am on the home page
  
  Scenario: On the Home Page
    Then I should not see "Event Listings"
    
  Scenario: On a Project Page
    When I follow "Project Listings"
    And I follow "Create New Project"
    Then I should be on the new project page
    And I fill in "Name" with "Tester Project"
    And I fill in "Description" with "Tester Project for Events"
    And I fill in "Volunteer capacity" with "25"
    And I fill in "Location" with "Berkeley"
    And I press "Create Project"
    When I follow "Project Listings"
    Then I should be on the projects page
    And I should see "Tester Project"
    And I follow "Tester Project"
    Then I should not see "Create Event"