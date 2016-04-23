Feature: As a team leader, I want to navigate and group together volunteers into groups.
This is done by a group field we can use to filter the volunteers.

Background: volunteers added to the database
  Given the following volunteers exist:
  | first_name | last_name | phone      | email               | city         | state | status  | major            | languages        | group |
  | jio        | calderon  | 5556667777 | jio@calderon.com    | alameda      | CA    | Student | computer science | tagalog, spanish | B     |
  | daniel     | anderson  | 5105105999 | daniel@anderson.com | berkeley     | CA    | Working | computer science | english, spanish | B     |
  | carmen     | tang      | 1231236666 | carmen@tang.com     | new york     | NY    | Student | computer science | english, french  | None  |
  | lawrence   | vo        | 2223334432 | lawrence@vo.com     | berkeley     | CA    | Student | potato farming   | english, french  | B     |
  | kevin      | chen      | 1234562342 | kevin@chen.com      | new york     | NY    | Retired | potato farming   | english, french  | B     |
  | anthony    | tran      | 5523423422 | anthony@tran.com    | las vegas    | CA    | Retired | potato farming   | english, spanish | C     |

Scenario: the group field is invisible to volunteers
  Given I am on the Volunteer page
  Then I should not see "group"

Scenario: people are assigned to groups by the admin
  Given I am on the list volunteers page
  And I press "edit" #maybe learn to make this edit pressed for a specific person.
  And I fill in "group" with "A"
  And I press "edit volunteer"
  Then I should see "volunteer successfully edited"
  Then I am on the list volunteers page
  And I should see "A"
  
Scenario: filtering based on the groups works properly.
  Given I am on the list volunteers page
  And I select "C" from "group"
  Then I should not see "jio"
  And I should not see "daniel"
  And I should not see "carmen"
  And I should see "anthony"
  


  
  
  