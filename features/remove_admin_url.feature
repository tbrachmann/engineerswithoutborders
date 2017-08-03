Feature: Preventing non-admin users from accessing the admin view
  As a non-admin
  I should not be able to go to "/admin"
  And I should not be able to change the roles of other users

Scenario: Allowing admins to access view # happy path
  Given I am an admin
  When I go to "/admin"
  Then I should see "Site Administration" on the page
  
Scenario: Preventing volunteers to access view
  Given I am a volunteer
  When I go to "/admin"
  Then I should not see "Site Administration" on the page
  And I should see "Update Your Profile" on the page # redirect back to homepage

Scenario: Preventing project managers to access view
  Given I am a project manager
  When I go to "/admin"
  Then I should not see "Site Administration" on the page
  And I should see "Update Your Profile" on the page