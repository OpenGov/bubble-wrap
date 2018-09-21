Feature: Search for budgets

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget

  @p1 @frictionless
  Scenario: Create a budget then switch to a previous budget
    Given there is some budget
    When I have created a budget via UI
    And I switch to a different budget
    Then I see different budget data

  @bvt @accurate
  Scenario: Searching for a budget
    When I search for the budget
    Then the budget appears in the budget list

