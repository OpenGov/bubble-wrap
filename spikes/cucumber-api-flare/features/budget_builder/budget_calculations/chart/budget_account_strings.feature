@accurate
Feature: Budget Calculations

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget

  @p1
  Scenario: Budget chart for a proposal with - expense operation account strings
    Given I see default expenses chart data
    And I have created a proposal via UI
    And I view the proposal
    When I create expense operation ''
    And I view this operation
    And I make an absolute adjustment of -1 for first account string
    And I submit proposal
    Then I see updated budget expenses chart data

  @p2
  Scenario: Budget chart for a proposal with + expense operation account strings
    Given I see default expenses chart data
    And I have created a proposal via UI
    And I view the proposal
    When I create expense operation ''
    And I view this operation
    And I make an absolute adjustment of 1 for first account string
    And I submit proposal
    Then I see updated budget expenses chart data

  @p2
  Scenario: Budget chart for a proposal with - revenue operation account strings
    Given I see default revenues chart data
    And I have created a proposal via UI
    And I view the proposal
    When I create revenue operation
    And I view this operation
    And I make an absolute adjustment of -1 for first account string
    And I submit proposal
    Then I see updated budget revenues chart data

  @p2
  Scenario: Budget chart for a proposal with + revenue operation account strings
    Given I see default revenues chart data
    And I have created a proposal via UI
    And I view the proposal
    When I create revenue operation
    And I view this operation
    And I make an absolute adjustment of 1 for first account string
    And I submit proposal
    Then I see updated budget revenues chart data
