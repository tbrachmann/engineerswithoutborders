Feature: Allowing users to go back to the EWB page
  As a user wanting to go back to the EWB page
  When I click on the EWB logo # on the top left corner
  Then I should be back on the EWB page

Scenario: Redirect link working on all pages
  Given I am a volunteer # if it works for volunteers, it works for everyone
  When I am on the homepage
  And I press the EWB logo
  Then I shouldbe back on the EWB website
  When I am on the "Find Volunteers" page
  And I press the EWB logo
  Then I shouldbe back on the EWB website
  When I am on the "Project Listings" page
  And I press the EWB logo
  Then I shouldbe back on the EWB website