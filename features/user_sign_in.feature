Feature: Updating Volunteer Information
  As a person interested in joining Engineers Without Borders
  I should be able to login
  So that I can access the website
  
  
  Scenario: Invalid password
    Given I am on the home page
    When I press "GET INVOLVED"
    Given my name is "joe"
    Given I am a user with a password "apple" and I input "carrot"
    And I press "Log In"
    Then I should see "Incorrect Password"
    
  Scenario: Signing Up
    Given I am on the home page
    And I follow "GET INVOLVED"
    Then I should see "Log In"
    
  Scenario: Logging In
    Given I am on the home page
    And I follow "Log In"
    Then I should see "Sign Up"