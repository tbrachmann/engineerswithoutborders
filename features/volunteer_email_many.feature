Feature: Emailing all the volunteers selected by a project manager
  As a project manager wanting to search for volunters
  I should be able to select the checkboxes next to volunteers I want
  And contact all volunteers that I select
  And email out the volunteers

Background:
  Given I am a project manager
  And I am on the "Find Volunteers" page
  And I should see "Listing Users"
  And Volunteer 1 exists
  And Volunteer 2 exists

Scenario: Emailing multiple volunteers
  When I press the checkbox next to Volunteer 1
  When I press the "Contact All" button
  And I press the "Send" button
  Then I should see the text "Emails have been sent!"

Scenario: Email template exists and is editable
  When I press the checkbox next to Volunteer 1
  And I press the checkbox next to Volunteer 2
  When I press the "Contact All" button
  Then I should see the text "After looking over your qualifications"
  When I delete the text in the message body
  Then I should not see "qualifications"