Feature: Allowing for multiple selection on Find Volunteers page
  As a project manager wanting to search for volunters
  I should be able to see checkboxes to the left of each volunteer
  And be able to select multiple volunteers
  And press the contact all button to email out # need to implement for next iter

Background:
  Given I am a project manager
  And I am on the "Find Volunteers" page
  And Volunteer 1 exists
  And Volunteer 2 exists

Scenario: Select multiple volunteers
  When I press the checkbox next to the first volunteer 
  And press the checkbox next to the second volunteer
  Then the number of checked boxes should be 2
  When I press the checkbox next to the first volunteer
  Then the number of checked boxes should be 1
  And there will be no checked box for the first volunteer