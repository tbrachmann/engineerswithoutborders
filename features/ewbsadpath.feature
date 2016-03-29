Feature: Signing up as a volunteer with bad arguments
 
  As a person with mal intentions trying to mess up our database by
  submitting incomplete arguments

Background: I am on the EWB home page


Scenario: Filling out the Volunteer Form by subscribing
  Given I am on the Volunteer page
  When I press "Create Volunteer"
  Then I should see "Error: Invalid first name."
  
  When I fill in "First name" with "Mark"
  And I press "Create Volunteer"
  Then I should see "Error: Invalid last name."
  
  When I fill in "Last name" with "Luigi"
  And I press "Create Volunteer"
  Then I should see "Error: Invalid phone number."
  
  And I fill in "Phone" with "apple"
  And I press "Create Volunteer"
  Then I should see "Error: Invalid phone number"
  
  And I fill in "Phone" with "510 510 5555"
  And I press "Create Volunteer"
  Then I should see "Error: Invalid email address"
  
  And I fill in "Email" with "helloworldatberkeley.edu"
  And I press "Create Volunteer"
  Then I should see "Error: Invalid email address"
  
  And I fill in "Email" with "helloworld@berkeley.edu"
  And I press "Create Volunteer"
  Then I should see "Error: Invalid State"
  
  And I fill in "State" with "CAL"
  And I press "Create Volunteer"
  Then I should see "Error: Invalid State"
  
  And I fill in "State" with "CA"
  Then I should see "Error: Invalid City"
  
  And I fill in "City" with "Berkeley"
  And I check "Subscribe"
  And I press "Create Volunteer"
  Then I should see "Volunteer was successfully created."
  