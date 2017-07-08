Feature: display list of volunteers filtered by different skills/certifications

    As a EWB Project Manager
    So that I can recruit potential volunteers for my project
    I want to see only volunteers that meet the selected qualifications
    
Background: Volunteers have been added to the project page

    Given the following volunteers exist:
    |User          | ABET Certified?| Fluency in Spanish | 
    |"Schmoe, Joe" |             N/A|                 Yes|
    |"User, Random"|             Yes|                  No|

    And I am on a project page
    
Scenario: filter the volunteers list by a certain attribute
    When I select "ABET Certified"
    
    When I select "Professional Fluency in Spanish"

    When I press the "Apply" button
    
    Then I should see "Schmoe, Joe" #A user that meets these specified qualifications
    
    Then I should not see "User, Random" #A user that does not
