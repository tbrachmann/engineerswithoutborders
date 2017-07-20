Feature: User Registration
  As a person interested in joining Engineers Without Borders
  I should be able to register as a volunteer
  So that I can be added to projects

Scenario: Filling out the Volunteer Form by subscribing
  Given I am on the home page
  Then I should see "GET INVOLVED"
  When I follow "GET INVOLVED"
  When I fill in "Email" with "woody@andysroom.com"
  And I fill in "user_password" with "reachforthesky"
  And I fill in "user_password_confirmation" with "reachforthesky"
  And I press "Sign up"
  Then I should see "Update Your Profile"
  Then I should see "Project Listings"
