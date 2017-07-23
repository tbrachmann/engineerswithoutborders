Feature: display list of volunteers filtered by different skills/certifications

    As a EWB Project Manager
    So that I can recruit potential volunteers for my project
    I want to see only volunteers that meet the selected qualifications
    
Background: Volunteers have been added to the project page

    Given the following volunteers exist:
    |last_name  | first_name        | email           | password            |
    |"Schmoe"   | "Joe"             | "joe@joe.com"   | "password"          |
    |"User"     | "Random"          | "rando@bob.com" | "abcdefg"           |
    
    Given the following skill table exists:
    |user_id    | name                              |
    | 1         | "Pump Design"                     |
    | 1         | "Professional Fluency in Spanish" |
    | 2         | "Solar Panels"                    |
    
    And I am a project manager
    And I am on the "Find Volunteers" page
    
    Scenario: filter the volunteers list by a certain attribute
      #When I select "Skills"
      When I check "Professional Fluency in Spanish"
      Then I should see "Joe Schmoe" #A user that meets these specified qualifications
      Then I should not see "Random User" 
    
    Scenario: Filter volunteers by multiple critera
      When I check "Pump Design"
      And I check "Solar Panels"
      Then I should see "Joe Schmoe" #A user that meets these specified qualifications
      And I should see "Random User" #A user that meets these specified qualifications
