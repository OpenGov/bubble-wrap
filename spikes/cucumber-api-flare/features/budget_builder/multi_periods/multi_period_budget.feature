Feature: Multi-period budget

  Background:
    Given I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page

  @bvt
  Scenario: Multi-period Roll-Forward Adjustment Budget
    Given I have created a '2' periods budget with 'roll-forward' adjustments and '' dataset
    And I have created a proposal via UI
    And I view the proposal
    And I create revenue operation
    And I view this operation
    Then I see a worksheet with '2' period
    Then I see a worksheet with 'roll-forward' adjustment

  @bvt
  Scenario: Multi-period Fixed-Base Adjustment Budget
    Given I have created a '2' periods budget with 'fixed-base' adjustments and '' dataset
    And I have created a proposal via UI
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    Then I see a worksheet with '2' period
    Then I see a worksheet with 'fixed-base' adjustment