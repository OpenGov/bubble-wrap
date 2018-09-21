Feature: Initiatives search

 
  @STRAT-40 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Search shows relevant results and hides irrelevant

    Given I am an entity admin
    And there are several departments
    And there are initiatives:
      | name                     |
      | Police rescue helicopter |
      | Police recruitment       |
      | Firefighter recruitment  |
      | Firefighter fundraising  |
    When I visit strategic initiatives
    And I search for initiative "recruitment"
    Then I see initiatives:
      | name                    |
      | Police recruitment      |
      | Firefighter recruitment |
    And I do not see initiatives:
      | name                     |
      | Police rescue helicopter |
      | Firefighter fundraising  |

