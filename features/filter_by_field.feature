Feature: Filter Volunteers by Field of Study
  As a project manager
  I want to be able to filter prospective volunteers by their field of study
  So I can determine which volunteers are best suited for my projects
  
  Background:
    Given I am a project manager
    Given the following users exist with the given qualities:
      | last_name    | first_name    | email                | password      | skills                                                                        | certifications                     | field of study                           |
      | Conolly      | Jeniffer      | jcon@ucon.edu        | palmtree43    | people skills, empathetic, organization management, structural engineering    | emt                                | civil engineering                        |
      | Garrett      | Brad          | bgarrett@plant.org   | Fungi169      | organization management, grassroots engagement, implementation,               | teacher                            | environmental engineering                |
      | Gutierrez    | Maria Laura   | mlg@yahoo.com        | bigmac99      | trilingual, English, Spanish, Italian                                         | cpr, emt, sustainable development  | computer science, civil engineering      | 
    Given I am on the find volunteers page
    
  Scenario: Nothing is checked
    Then I should see everyone
  
  
  Scenario: Filtering by one field of study -- happy path
    When I check "Civil Engineering"
    Then I should see "Jeniffer Conolly"
    And I should see "Maria Laura Gutierrez"
    But I should not see "Brad Garrett"
    
  Scenario: Filtering by one field of study -- sad path
    When I check "Education"
    Then I should see noone
    
  Scenario: Filtering by two fields of study -- happy path
    When I check "Civil Engineering"
    And I check "Computer Science"
    Then I should see "Maria Laura Gutierrez"
    But I should not see "Jeniffer Conolly"
    And I should not see "Brad Garrett"
    
  Scenario: Filtering by two fields of study -- sad path
    When I check "Civil Engineering"
    And I check "Education"
    Then I should see noone
    

    