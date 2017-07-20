Feature: Reducing search parameters for Find Volunteers page
  As a project manager wanting to search for volunters
  I should see fields for search criteria
  But not see a field for conditionals such as greater than and is null
  And only search using the conditional contains
  And being able to select multiple search criteria using Add Conditions
  
Background:
  Given I am a project manager
  And I am on the "Find Volunteers" page

Scenario: Minimize attribute filter criteria to fields like certifications
  When I select attribute field
  Then I should see "Certifications"
  And I should see "First Name"
  But I should not see "created at"
  And I should not see "id"
  
Scenario: Minimize predicate criteria to contains
  When I select predicate field
  Then I should see "contains"
  But I should not see "null"
  And I should not see "eq"
  
Scenario: Be able to properly add conditions to search by
  When I press the "Add Conditions" button
  Then the number of attibute fields should be 2
  And the number of predicate fields should be 2
  When I press the "remove" button
  Then the number of attibute fields should be 1
  And the number of predicate fields should be 1
