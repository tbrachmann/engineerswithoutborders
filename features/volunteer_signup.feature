Feature: Signing up as a volunteer
 
  As a person interested in joining Engineers Without Borders

Background: I am on the EWB home page

Scenario: Filling out the Volunteer Form by subscribing
  Given I am on the Volunteer page
  When I fill in "First name" with "Mark"
  And I fill in "Last name" with "Emiliano"
  And I fill in "Phone" with "650-999-0111"
  And I fill in "Email" with "helloworld@berkeley.edu"
  And I fill in "City" with "Berkeley"
  And I select "CA" from "State"
  And I check "Subscribe"
  And I press "Create Volunteer"
  Then I should see "Volunteer was successfully created."
  
@javascript
Scenario: Filling out the Volunteer Form by joining project team
  Given I am on the Volunteer page
  When I fill in "First name" with "Daniel"
  And I fill in "Last name" with "Anderson"
  And I fill in "Phone" with "650-999-0111"
  And I fill in "Email" with "helloworld@berkeley.edu"
  And I fill in "City" with "Berkeley"
  And I check "Join project team"
  Then the detailed project information should be revealed
  And I should see "Join Project Team"
  And I select "Student" from "Status"
  And I select "Bachelors" from "Education"
  And I fill in "Major" with "Computer Science"
  And I fill in "Certification" with "PE"
  And I fill in "Languages" with "Spanish"
<<<<<<< HEAD:features/volunteer_signup.feature
  And I fill in "Fluency" with "Proficient"
  And I fill in "Ewb experience" with "Volunteered at Haiti"
  And I fill in "International experience" with "Studied abroad in Ireland"
  And I fill in "Work experience" with "Software Engineer with IBM"
  And I fill in "Reason" with "I love volunteering!"
  And I select "Thrice" from "Time investment"
  And I check "Travel"
  And I select "Europe" from "Places"
  And I check "Current events"
  And I select "Fundraising" from "Involvement"
    
  
=======
  And I select "Level of Fluency" with "Proficient"
  And I fill in "Previous EWB Experience" with "Volunteered at Haiti"
  And I fill in "Previous International Experience" with "Studied abroad"
  And I fill in "Previous Work Experience" with "Software Engineer with IBM"
  And I check the following teams: Executive, Fiji
  And I fill in "Reason" with "I love volunteering so much and I want to help!"
  And I select "Time Investment" with "> 3 hours a week"
  And I select "Travel" with "Yes"
  And I select "Current Events" with "Yes"
  And I check the following events: Fundraising, Graphic Design
>>>>>>> 07cfac9557edf5c22cba141de65ee0a1bb352937:features/ewb.feature
