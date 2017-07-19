Feature: display alphabetized list of volunteers

    As a EWB Project Manager
    So that I can recruit volunteers for my project
    I want to see an alphabetized list of applicants
    
Background: Volunteers have been added to the project page

    Given the following volunteers exist:
    |User          |
    |"Schmoe, Joe" |
    |"User, Random"|

    And I am on a project page
    
Scenario: Sort volunteers list alphabetically

    When I press "View Applicants"

    Then I should see "Schmoe, Joe" before "User, Random"
