Feature: Viewing Event Information
  As a volunteer for Engineers Without Borders
  I should be able to view information about various events
  So that I can pick events to attend
  
  Scenario: Clicking on an Event
    Given I am a new, authenticated user
    Given I am on the events page
    When I follow an Event Link
    Then I should see "Event Description"
    And I should see "Event Dates"
    And I should see "Event Location"