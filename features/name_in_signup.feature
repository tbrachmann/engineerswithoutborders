Feature: Fill out name upon Signing Up
  As a volunteer
  I want to be able to fill out my name upon signing up
  To create a valid account
  
  
  Scenario: Signing Up
    Given I am on the welcome page
    When I follow "Get Involved"
    Then I should see "First Name"
    And I should see "Last Name"
    
  Scenario: Creates Valid User
    Given I am on the sign up page
    And I fill in "Claire" for "First Name"
    And I fill in "Scheele" for "Last Name"
    And I fill in "cscheele@berkeley.edu" for "email"
    And I fill in "password" for "password"
    And I follow "Sign Up"
    Then the following users should exist
    |last_name      | first_name            | email                     | password            |
    |"Scheele"      | "Claire"              | "cscheele@berkeley.edu"   | "password"          |