Feature: Operations table

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal

  @p1
  Scenario: show updated totals for Expense operation
    When I create expense operation ''
    And I see default operation totals
    And I view this operation
    And I increase bulk adjustment 1
    And I confirm this operation
    Then I should see updated totals in the table

  @p1
  Scenario: show updated totals for Revenue operation
    When I create revenue operation
    And I see default operation totals
    And I view this operation
    And I increase bulk adjustment 1
    And I confirm this operation
    Then I should see updated totals in the table
