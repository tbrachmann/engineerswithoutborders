Feature: Updating Volunteer Information
  As a person interested in joining Engineers Without Borders
  I should be able to register as a volunteer
  So that I can be added to projects

Scenario: Updating Profile Information
  Given I am a new, authenticated user
  Given I am on the home page
  When I follow "Profile"
  And I follow "Edit Profile"
  And I select "Bachelor's Degree" from "Education:"
  And I select "Computer Science" from "Field of Study or Expertise:"
  And I select "Spanish" from "First Language:"
  And I select "5 - Native or Bilingual Proficiency" from "First Language Fluency:"
  And I select "20" from "Age"
  And I fill in "Please tell us very briefly a little about yourself and why you want to volunteer for Engineers without Borders." with "College rules!"
  And I fill in "Name of University/College:" with "Berkeley"
  And I press "Update Background"

  Then I should see "Bachelor's Degree"
  Then I should see "Computer Science"
  Then I should see "20"
  Then I should see "College rules!"
  Then I should see "Berkeley"
  
Scenario: User sees own availability after edit profile
  Given I am a new, authenticated user
  Given I am on the home page
  When I follow "Profile"
  And I follow "Edit Profile"
  And I check "user_availability_wednesday_morning"
  And I check "user_availability_saturday_evening"
  And I press "Update Background"
  Then I should see "Wednesday Morning"
  Then I should see "Saturday Evening"
  
  

  
