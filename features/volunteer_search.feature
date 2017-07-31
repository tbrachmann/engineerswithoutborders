Feature: Reducing search parameters for Find Volunteers page
  As a project manager wanting to search for volunters
  I should be able to search for attributes only with "contains"
  So that searching is easier and can be accomplished quicker
  
Background:
  Given I am a project manager
  And I am on the "Find Volunteers" page

Scenario: Minimize attribute filter criteria to fields like certifications
  Then the "attribute" field should contain "Name"
  And the "attribute" field should contain "Certification"
  And the "attribute" field should contain "Role"
  And the "attribute" field should contain "Skill"
  And the "attribute" field should contain "Construction Experience"
  And the "attribute" field should contain "Design Experience"
  But the "attribute" field should not contain "created at"
  And the "attribute" field should not contain "id"
  
Scenario: Minimize predicate criteria to contains
  Then I should see "contains"
  But the "predicate" field should not contain "null"
  And the "predicate" field should not contain "eq"
  And the "predicate" field should not contain "contains all"
  And the "predicate" field should not contain "contains any"
