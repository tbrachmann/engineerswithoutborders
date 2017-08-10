Feature: Allowing users to go back to the EWB page
  As a user
  After I am done signing up
  I want to go back to the EWB page to learn more about it

Background:
  Given I am a new, authenticated user
  Given I am on the homepage

Scenario: Redirect link working on all pages
  When I follow "navbar-brand"
  Then I should go back to the EWB homepage
