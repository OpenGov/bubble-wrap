@accurate
Feature: Budget Calculations

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget

  @p1
  Scenario: Budget chart for a new budget
    Then I see default expenses chart data

  @p2
  Scenario: Budget chart for budget with proposal(with - expense operation)
    When I see default expenses chart data
    And I have created a proposal via UI
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    And I make a bulk adjustment of -1
    And I submit proposal
    Then I see updated budget expenses chart data

  @p2
  Scenario: Budget chart for budget with proposal(with + expense operation)
    When I see default expenses chart data
    And I have created a proposal via UI
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    And I increase bulk adjustment 1
    And I submit proposal
    Then I see updated budget expenses chart data

  @p2
  Scenario: Budget chart for budget with proposal(with - revenue operation)
    When I see default revenues chart data
    And I have created a proposal via UI
    And I view the proposal
    And I create revenue operation
    And I view this operation
    And I make a bulk adjustment of -1
    And I submit proposal
    Then I see updated budget revenues chart data

  @p2
  Scenario: Budget chart for budget with proposal(with + revenue operation)
    When I see default revenues chart data
    And I have created a proposal via UI
    And I view the proposal
    And I create revenue operation
    And I view this operation
    And I increase bulk adjustment 1
    And I submit proposal
    Then I see updated budget revenues chart data
