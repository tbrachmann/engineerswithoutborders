Feature: "In-Demand Skills" banner on Projects Listings page
    As a volunteer
    I want to see all the currently "In Demand" qualities on the projects listing page
    So I can see if I am especially qualified for any particular project

Background:
  Given there exists a project "Test Project"
  Given the project "Test Project" has the following in demand qualities:
    | name       | type          |
    | test_skill | Skill         |
    | test_cert  | Certification |
  Given I am a new, authenticated user
  And I follow "Projects Listings"
  And I should see "Remba Island"
  And I should see "Test Project"
  
Scenario: viewing "In-Demand" qualities on projects listings page
  And I should see "In-Demand Qualities"
  And I follow "In-Demand Qualities"
  And I should see "test_skill"
  And I should see "test_cert"

Scenario: viewing "In-Demand" qualities on project page
  When I follow "Test Project"
  Then I should see "test_skill"
  And I should see "test_cert"
