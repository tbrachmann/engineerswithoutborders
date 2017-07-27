Feature: Reducing search parameters for Find Volunteers page
  As a project manager wanting to search for volunters
  I should be able to search for attributes only with "contains"
  So that searching is easier and can be accomplished quicker
  
Background:
  Given I am a project manager
  And I am on the "Find Volunteers" page

Scenario: Minimize attribute filter criteria to fields like certifications
  Then the "attribute" field should contain "First name"
  And the "attribute" field should contain "Certification"
  And the "attribute" field should contain "Last name"
  And the "attribute" field should contain "Role"
  And the "attribute" field should contain "Skill"
  And the "attribute" field should contain "Construction experience"
  And the "attribute" field should contain "Design experience"
  But the "attribute" field should not contain "created at"
  And the "attribute" field should not contain "id"
  
Scenario: Minimize predicate criteria to contains
  Then the "predicate" field should contain "contains"
  But the "predicate" field should not contain "null"
  And the "predicate" field should not contain "eq"
  And the "predicate" field should not contain "contains all"
  And the "predicate" field should not contain "contains any"
  
Scenario: Be able to properly add conditions to search by
  When I press the "Add Conditions" button
  Then the number of attribute fields should be 2
  And the number of predicate fields should be 2
  When I press the "remove" button
  Then the number of attribute fields should be 1
  And the number of predicate fields should be 1
