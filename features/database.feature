Feature: As a team leader from EngineerWithouBoarder San Francisco,
I want to navigate through potential volunteers who have signed up with their detailed information,
so that I can optimize my volunteer search to find the best fit volunteer
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
  
# Scenario: Check that state filtering works
#   When I select "CA" from "state"
#   And I press "Refresh"
#   Then I should see "daniel anderson"
#   And I should see "carmen tang"
  
# Scenario: Check filtering for status
#   When I select "student" from "status"
#   And I press "Refresh"
#   Then I should see "jio calderon"
#   And I should see "lawrence vo"
#   And I should see "carmen tang"
#   And I should not see "kevin chen"
#   And I should not see "anthony tran"

# Scenario: Check that multiple filtering works
#   When I select "CA" from "state"
#   And I select "student" from "status"
#   And I press "Refresh"
#   Then I should see "jio calderon"
#   Then I should not see "anthony tran"
#   Then I should not see "potato farming"

Scenario:
  When I select "CA" from "state"
  Then I should not see "daniel"