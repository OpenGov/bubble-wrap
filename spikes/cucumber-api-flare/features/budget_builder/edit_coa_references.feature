Feature: Edit COA reference levels

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I create expense operation ''
    And I done proposal

  @p2
  Scenario: Edit budget COA reference
    When I visit budget settings
    And I visit COA reference settings
    And I edit COA reference level
    And I close budget settings panel
    And I view the proposal
    And I select proposal Expenses tab
    And I view this operation
    Then I see the selected reference shows as column header on adjustment table