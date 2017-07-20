Feature: Reducing search parameters for Find Volunteers page
  As a project manager wanting to search for volunters
  I should see fields for search criteria
  But not see a field for conditionals such as greater than and is null
  And only search using the conditional contains
  
  # As a person interested in joining Engineers Without Borders
  # I should be able to register as a volunteer
  # So that I can be added to projects

Background: Volunteers have been added to the project page


    # going to add some weird functionality to the Given the following volunteers exist at some point.
    Given the following volunteers exist:
    |User          | availability                         | Fluency in Spanish | 
    |"Schmoe, Joe" | [:friday_afternoon, :sunday_morning] |                 Yes|
    |"User, Random"|                    [:sunday_morning] |                  No|




Scenario: 
  Given I am a project manager
  Given I am on the "Find Volunteers" page
  When I select "Education" from "       "

Scenario: Filter by time availability
  Given I am a project manager
  Given I am on the "Find Volunteers" page
  When I press "filter options"
  Then I should see "availability"
  When I select "sunday morning"
  When I press "submit"
  Then I should see "Joe"
  Then I should see "Random"
  
  # And test for RESTful URL
  
  
  
  # When I follow "Profile"
  # And I follow "Edit Profile"
  # And I select "Bachelor's Degree" from "Education:"
  # And I select "Computer Science" from "Field of Study or Expertise:"
  # And I select "Chemical" from "Certifications Related to Field:"
  # And I select "Spanish" from "First Language:"
  # And I select "5 - Native or Bilingual Proficiency" from "First Language Fluency:"
  # And I select "20" from "Age"
  # And I fill in "About:" with "College rules!"
  # And I fill in "Name of University/College:" with "Berkeley"
  # And I press "Update Background"

  # Then I should see "Bachelor's Degree"
  # Then I should see "Computer Science"
  # Then I should see "20"
  # Then I should see "College rules!"
  # Then I should see "Berkeley"