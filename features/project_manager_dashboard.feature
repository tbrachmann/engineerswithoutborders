Feature: The project manager can view special information about the project on a dashboard view
  As a project manager
  So that I can better manage my project
  I want to see a special view of the project

Background: 
  Given I am a project manager on "Remba Island Project"
  Given that these volunteers are on "Remba Island Project"
    | first_name | last_name | email              |
    | Buzz       | Lightyear | buzz@lightyear.com |
    | Woody      | Allen     | woody@allen.com    |
  And I am on the "My Projects" page

Scenario: View volunteers on project
  When I click on "Remba Island Project"
  Then I should see "Buzz"
  And I should see "Lightyear"
  And I should see "buzz@lightyear.com"

Scenario: Edit project
  When I click on "Remba Island Project"
  Then I should see "Edit Project"
  When I click on "Edit Project"
  Then I should be on the "Edit Project" page
