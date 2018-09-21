@accurate
Feature: Search for proposals

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget

  @p1
  Scenario: Searching for a proposal by title
    When I search for a proposal by title
    Then the proposal appears in the proposal list

  @p2
  Scenario: Searching for a proposal by description
    When I search for a proposal by description
    Then the proposal appears in the proposal list