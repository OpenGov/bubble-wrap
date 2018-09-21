Feature: Budget Smoke Test

  Background:
    Given I am logged into gotham as an entity_admin
    And I go to budgets from reports page

  @smoke
  Scenario: Create a budget, proposal, worksheet
    When I have created a '3' periods budget with 'roll-forward' adjustments and '' dataset
    And I have created a proposal via UI
    And I view the proposal
    And I create revenue operation
    And I view this operation
    Then I see a worksheet with '3' period
    Then I see a worksheet with 'roll-forward' adjustment