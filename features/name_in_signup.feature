Feature: Fill out name upon Signing Up
  As a volunteer
  I want to be able to fill out my name upon signing up
  To create a valid account  
  
  Scenario: Signing Up
    Given I am on the home page
    When I follow "GET INVOLVED"
    Then I should see "First Name"
    And I should see "Last Name"
    
  Scenario: Creates Valid User
    Given I am on the sign up page
    And I fill in "test" for "First Name"
    And I fill in "person" for "Last Name"
    And I fill in "testing1234@email.com" for "Email"
    And I fill in "password" for "user_password"
    And I fill in "password" for "user_password_confirmation"
    And I press "Sign up"
    Then the following users should exist
      | last_name | first_name | email                 | password |
      | person    | test       | testing1234@email.com | password |
