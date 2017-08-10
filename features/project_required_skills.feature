Feature: Viewing Required Skills
  As a volunteer for Engineers Without Borders
  I should be able to see what projects I am qualified for
  So that I can choose projects to apply for

Background: 
  Given I am a new, authenticated user
  Given there exists a project "Test Project"
  Given that "Test Project" has the key skill "Test Skill"
  
Scenario: View project required skills
  Given I am on the projects page
  When I follow the project link for "Test Project"
  Then I should see "Key Skills"
  And I should see "Test Skill"
