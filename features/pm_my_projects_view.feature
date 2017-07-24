Feature: See "My Projects" instead of Project Listings
  As a project manager
  I should be able to see all the projects I manage
  So that I can select which project to manage

Background: 
  Given I am a project manager on "Remba Island Project"
  Given there exists a project "Fake Remba Island Project"

Scenario: Viewing only my managed projects on "My Projects" page
  Given I am on the home page
  Then I should see "Project Listings"
  And I should see "My Projects"
  When I follow "My Projects"
  Then I should see "Remba Island Project"
  But I should not see "Fake Remba Island Project"
