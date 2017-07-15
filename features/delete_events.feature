Feature: Refactor Events 
  As a volunteer for Engineers Without Borders
  I do not want to see an Events Listing page
  Because it already exists on the main EWB page
  
  As an admin
  I do not want to see an Events Listing page
  Because I want to reduce redundancy on my website
  
  Scenario: On the Home Page
    Given I am a new, authenticated user
    Given I am on the home page
    Then I should not see "Event Listings"