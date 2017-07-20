Feature: 
  As a user of the EWB volunteers website
  I want to see a consistent interface,
  With the same text fonts and theme colors
  And I also want to see that all page headings are the same font size, style, and color
  And I want to see that the theme is consistent with the main EWB website
  
Background:
  Given I am a new, authenticated user

Scenario: Visiting the home page
  Given I am on the home page
  Then I should see that the page headings, font styles, and text sizes are uniform across the website
  Then I should see that the page theme and colors are consistent with the main EWB website
  
Scenario: Visiting the projects page
  Given I am on the projects page
  Then I should see that the page headings, font styles, and text sizes are uniform across the website
  Then I should see that the page theme and colors are consistent with the main EWB website
  
Scenario: Visiting the User Information page
  Given I am on the users page
  Then I should see that the page headings, font styles, and text sizes are uniform across the website
  Then I should see that the page theme and colors are consistent with the main EWB website