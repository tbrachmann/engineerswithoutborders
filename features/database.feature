Feature: Make sure that filtering works in the database
Background: volunteers added to the database
  Given the following volunteers exist:
  | first_name | last_name | phone      | email               | city         | state | status  | major            | languages        |
  | jio        | calderon  | 5556667777 | jio@calderon.com    | alameda      | ca    | student | computer science | tagalog, spanish |
  | daniel     | anderson  | 5105105999 | daniel@anderson.com | berkeley     | ca    | working | computer science | english, spanish |
  | carmen     | tang      | 1231236666 | carmen@tang.com     | new york     | ny    | student | computer science | english, french  |
  | lawrence   | vo        | 2223334432 | lawrence@vo.com     | berkeley     | ca    | student | potato farming   | english, french  |
  | kevin      | chen      | 1234562342 | kevin@chen.com      | new york     | ny    | retired | potato farming   | english, french  |
  | anthony    | tran      | 5523423422 | anthony@tran.com    | las vegas    | ca    | retired | potato farming   | english, spanish |
  And I am on the list volunteers page
  
Scenario: Check that filtering works
  When I fill in "City" with "Berkeley"
  And I press "Filter Volunteers"
  Then I should see "daniel anderson"
  And I should see "lawrence vo"
  And I should not see "jio calderon"
  And I should not see "tagalog"
  
  When I fill in "major" with "computer science"
  And I press "Filter Volunteers"
  Then I should see "jio calderon"
  And I should see "daniel anderson"
  And I should see "carmen tang"
  And I should not see "lawrence vo"
  And I should not see "kevin chen"
  And I should not see "anthony tran"
