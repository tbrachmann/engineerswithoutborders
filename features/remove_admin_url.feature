Feature: Preventing non-admin users from accessing the admin view
  As a non-admin
  I should not be able to go to "/admin"
  So I cannot change the roles of other users

Background: 
  Given I am on the home page

Scenario: Allowing admins to access view # happy path
  Given I am an admin
  When I go to the admin page
  Then I should be on the admin page
  
Scenario: Preventing volunteers to access view
  Given I am a new, authenticated user
  When I go to the admin page
  Then I should be on the home page

Scenario: Preventing project managers to access view
  Given I am a project manager
  When I go to the admin page
  Then I should be on the home page
