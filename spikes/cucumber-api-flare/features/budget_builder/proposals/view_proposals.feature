Feature: View all proposals on a single page

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget

  @bvt @frictionless
  Scenario: View the proposal grid
    Then I should see a list of proposals

  @p1 @accurate
  Scenario: Use search bar to filter through the proposal
    When I search for Created By
    Then I should see a subset of records

  @p2 @frictionless
  Scenario: Special characters do not break the search
    When I search with 'n@n'
    Then I should see a subset of records
