Feature: Viewing Project Information
  As a volunteer for Engineers Without Borders
  I should be able to view information about various projects
  So that I can choose projects to apply for

  Background:
    Given there exists a project "Remba Island Project"

  Scenario: Clicking on a Project Listing
    Given I am a new, authenticated user
    Given I am on the projects page
    And I should see "Project Listings"
    When I follow the project link for "Remba Island Project"
    Then I should see "Creating a large-scale water filter system"
    And I should see "Remba Island, Kenya"
    And I should see "Luke Skywalker"
    And I should see "not_current@man.net"
    And I should see "25"
    And I should see "Ruby"
    And I should see "Microsoft Excel"
    And I should see "Well"
    And I should see "Road"
    And I should not see "VOLUNTEER_TABLE"
    
    
    
  Scenario: As a project manager, I should not be able to edit a project if I am not the assigned PM
    Given I am a project manager
    Given I am on the projects page
    When I follow the project link for "Remba Island Project"
    And I should see "Remba Island, Kenya"
    And I should not see "Edit Project"

Scenario: As a project manager, I should not be able to add a picture to a project page
    Given I am a project manager
    Given I am on the welcome page
    When I follow "My Projects"
    And I follow "Remba Island Project"
    And I follow "Edit Project"
    Then I should not see "Image"
    And I should not see "Choose File" 