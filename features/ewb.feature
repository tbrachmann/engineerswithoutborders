Feature: Signing up as a volunteer
 
  As a person interested in joining Engineers Without Borders

Background: I am on the EWB home page

Scenario: Filling out the Volunteer Form by joining project team
  Given I am on the Volunteer page
  When I fill in "First Name" with "Daniel"
  And I fill in "Last Name" with "Anderson"
  And I fill in "Phone" with "650-999-0111"
  And I fill in "Email" with "helloworld@berkeley.edu"
  And I fill in "City" with "Berkeley"
  And I fill in "State" with "California"
  And I fill in "Major" with "Computer Science"
  And I fill in "Language" with "Spanish"
  And I fill in "previous_ewb_exp" with "Volunteered at Haiti"
  And I fill in "previous_int_exp" with "Studied abroad"
  And I fill in "previous_work_exp" with "Software Engineer with IBM"
  And I fill in "Reason" with "I love volunteering!"
