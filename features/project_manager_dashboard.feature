Feature: The project manager can view special information about the project on a dashboard view
  As a project manager
  So that I can better manage my project
  I want to see a special view of the project

Background: 
  Given I am a project manager on "Remba Island Project"
  
  Given the following volunteers are on "Remba Island Project":
    | first_name | last_name | email              |
    | Buzz       | Lightyear | buzz@lightyear.com |
    | Woody      | Allen     | woody@allen.com    |
  
  Given "Buzz" is available on "Monday Morning"
  Given "Woody" is available on "Sunday Afternoon"
  And I am on the home page
  When I follow "My Projects"

Scenario: View volunteers on project
  When I follow "Remba Island Project"
  Then I should see "Buzz"
  And I should see "Lightyear"
  And I should see "buzz@lightyear.com"


Scenario: Edit project
  When I follow "Remba Island Project"
  Then I should see "Edit Project"
  When I follow "Edit Project"
  Then I should see "Editing Project"
