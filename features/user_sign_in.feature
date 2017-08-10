Feature: Updating Volunteer Information
  As a person interested in joining Engineers Without Borders
  I should be able to login
  So that I can access the website
  
  
  Scenario: Invalid password
    Given the following users exist:
      | first_name | last_name | email                 | password |
      | Test       | Person    | testing1234@email.com | secret   |
    Given I am on the home page
    When I follow "Login"
    And I fill in "Password" with "asdfgh"
    And I press "Log in"
    Then I should see "Invalid Email or password."
    
  Scenario: Signing Up
    Given I am on the home page
    And I follow "GET INVOLVED"
    Then I should see "Log In"
    
  Scenario: Logging In
    Given I am on the home page
    And I follow "Login"
    Then I should see "Sign Up"
