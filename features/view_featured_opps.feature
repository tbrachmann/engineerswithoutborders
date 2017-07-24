Feature: Display Featured Opportunities on a banner at the top of the projects page
  As a volunteer
  I want to see a list of qualities in high demand
  So I can see if my set of skills is valuable to a certain project right now

  As a project manager
  I want to list qualities I need in a volunteer
  So I can attract volunteers that fit my needs
  
  Background:
    Given I am on the projects page
  
  Scenario: Viewing the Projects Page as a Volunteer
    Given I am a new, authenticated user
    Then I should see "Featured Opportunities"
    And I should not see "Add an Opportunity"
    
  Scenario: Viewing the Projects Page as a Project Manager
    Given I am a project manager
    Then I should see "Featured Opportunities"
    And I should see "Add an Opportunity"
    
  Scenario: Adding an Opportunity
    Given I am a project manager
    When I follow "Add an Opportunity"
    Then I should be on the add an opportunity page
