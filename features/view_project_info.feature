Feature: Viewing Project Information
  As a volunteer for Engineers Without Borders
  I should be able to view information about various projects
  So that I can choose projects to apply for
  
  Background:
    # Given I am a project manager
    # Given I am on the home page
    # When I follow "Project Listings"
    # And I follow "Create New Project"
    # And I fill in "Name" with "Remove Snakes From Boots"                      
    # And I fill in "Description" with "Assist toy cowboys with recurring problem."
    # And I fill in "Volunteer capacity" with "2"                         
    # And I fill in "Location" with "Andy's Room" 
    # And I press "Create Project"
    
    Given I am a new, authenticated user
    And there exists a project "Remba Island Project"
    Given I am on the projects page
    And I should see "Remba Island Project"
  
  Scenario: Clicking on a Project Listing
    When I follow "Remba Island Project"
    Then I should see "Project Description"
    And I should see "Project Dates"
    And I should see "Project Location"
    And I should see "Project Manager"
    And I should see "Manager Contact Information"