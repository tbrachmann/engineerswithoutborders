Feature: View Volunteers' Skills, Certifications, and Field of Study on Find Volunteers page
  As a project manager
  I want to see a volunteer's skills, certifications, and field of study next to their name on the find volunteers page
  So I can quickly see who is best suited for my projects
  
  Background:
    Given I am a project manager
    Given the following users exist with the given qualities:
      | last_name    | first_name    | email                | password      | skills                                                                        | certifications                     | field of study                           |
      | Conolly      | Jeniffer      | jcon@ucon.edu        | palmtree43    | people skills, empathetic, organization management, structural engineering    | emt                                | civil engineering                        |
      | Garrett      | Brad          | bgarrett@plant.org   | Fungi169      | organization management, grassroots engagement, implementation,               | teacher                            | environmental engineering                |
      | Gutierrez    | Maria Laura   | mlg@yahoo.com        | bigmac99      | trilingual, English, Spanish, Italian                                         | cpr, emt, sustainable development  | computer science, civil engineering      | 
    Given I am on the find volunteers page
    
  Scenario: Nothing is checked 
    Then I should see everyone's qualities
    
  Scenario: Skills are checked
    When I check "People Skills"
    Then I should see "Jeniffer Conolly"'s qualities
    And I should not see "Brad Garrett"'s qualities
    And I should not see "Maria Laura Gutierrez"'s qualities
    
  Scenario: Certifications are checked
    When I check "EMT"
    Then I should see "Jeniffer Conolly"'s qualities
    And I should see "Maria Laura Gutierrez"'s qualities
    And I should not see "Brad Garrett"'s qualities
    
  Scenario: Field of study is checked
    When I check "Environmental Engineering"
    Then I should see "Brad Garrett"'s qualities
    And I should not see "Jeniffer Conolly"'s qualities
    And I should not see "Maria Laura Gutierrez"'s qualities
