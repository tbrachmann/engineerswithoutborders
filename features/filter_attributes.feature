Feature: display list of volunteers filtered by different skills/certifications

    As a EWB Project Manager
    So that I can recruit potential volunteers for my project
    I want to see only volunteers that meet the selected qualifications
    
Background: Volunteers have been added to the project page

    Given the following volunteers exist:
    |User          | ABET Certified?| Fluency in Spanish | Skills                       |
    |"Schmoe, Joe" |             N/A|                 Yes| Pump Design, Solar Panels    |
    |"User, Random"|             Yes|                  No| Solar Panels                 |

    And I am on the find volunteers page
    
    Scenario: filter the volunteers list by a certain attribute
      When I select "ABET Certified"
      When I select "Professional Fluency in Spanish"
      When I press the "Apply" button
      Then I should see "Schmoe, Joe" #A user that meets these specified qualifications
      Then I should not see "User, Random" #A user that does not
    
    Scenario: Filter volunteers by multiple critera
      When I select "Pump Design"
      And I select "Solar Panels"
      And I press the "Apply" button
      Then I should see "Schmoe, Joe"
      And I should not see "User, Random"
