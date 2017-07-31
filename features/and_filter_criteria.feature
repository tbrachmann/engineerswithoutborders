Feature: Only view Volunteers who match all selection criteria in "Find Volunteers"
  As a Project Manager
  I want to only view Volunteers that match all my selected criteria
  So I can find Volunteers that match my precise needs
  
  Background: 
    Given I am a project manager
    Given the following users exist with the given qualities:
      | last_name    | first_name    | email                | password      | skills                                                                        | certifications                     | field_of_study                           |
      | Conolly      | Jeniffer      | jcon@ucon.edu        | palmtree43    | people skills, empathetic, organization management, structural engineering    | emt                                | civil engineering                        |
      | Garrett      | Brad          | bgarrett@plant.org   | Fungi169      | organization management, grassroots engagement, implementation,               | teacher                            | environmental engineering                |
      | Gutierrez    | Maria Laura   | mlg@yahoo.com        | bigmac99      | trilingual, English, Spanish, Italian                                         | cpr, emt, sustainable development  | computer science, civil engineering      | 
    Given I am on the "Find Volunteers" page
    
    Scenario: Nothing is checked
      Then I should see everyone
    
    Scenario: Check a Skill and a Certification -- happy path
      When I check "People Skills"
      And I check "EMT"
      Then I should see "Jeniffer Conolly"
      And I should not see "Brad Garrett"
      And I should not see "Maria Laura Gutierrez"
      
    Scenario: Check a Skill and a Certification -- sad path
      When I check "People Skills"
      And I check "Teacher"
      Then I should see noone
      
    Scenario: Check a Certification and a Field of Study -- happy path
      When I check "CPR"
      And I check "Civil Engineering"
      Then I should see "Maria Laura Gutierrez"
      And I should not see "Jeniffer Conolly"
      And I should not see "Brad Garrett"
      
    Scenario: Check a Certification and a Field of Study -- sad path
      When I check "Teacher"
      And I check "Computer Science"
      Then I should see noone
      
    Scenario: Check a Skill and a Field of Study -- happy path
      When I check "Organization Management"
      And I check "Environmental Engineering"
      Then I should see "Brad Garrett"
      And I should not see "Jeniffer Conolly"
      And I should not see "Maria Laura Gutierrez"
      
    Scenario: Check a Skill and a Field of Study -- sad path
      When I check "Trilingual"
      And I check "Environmental Engineering"
      Then I should see noone
      
    Scenario: Check many boxes -- happy path
      When I check "Trilingual"
      And I check "Italian"
      And I check "Sustainable Development"
      And I check "Computer Science"
      Then I should see "Maria Laura Gutierrez"
      And I should not see "Jeniffer Conolly"
      And I should not see "Brad Garrett"
      
    Scenario: Check many boxes -- sad path
      When I check "Trilingual"
      And I check "Italian"
      And I check "Sustainable Development"
      And I check "Computer Science"
      And I check "Environmental Engineering"
      Then I should see noone
      
    