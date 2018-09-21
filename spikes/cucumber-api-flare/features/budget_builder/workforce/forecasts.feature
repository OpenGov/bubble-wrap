Feature: Personnel Cost Forecast
  Background:
    Given I turn on workforce feature for 'gotham' entity
    And I am logged into cloudcity as an entity_admin
    And I go to data manager from reports page
    And I click on 'Workforce Plans' on Tools panel
    And I select a completed workforce plan

  Scenario: Verify 'Projected Total Cost' of a position is correct
    When I select a position
    Then I see 'Projected Total Cost' is the sum of all elemensts' cost

  Scenario: Verify 'Proposed Total' amount is correct
    Then I see 'Proposed total' is the sum of all positions

  Scenario: Verify the calculated value of a cost element is correct
    When I select a cost element
    And I calculate the cost of that element 'FICA'
    And I select a position with FICA element
    Then the numbers from above two steps are equals






