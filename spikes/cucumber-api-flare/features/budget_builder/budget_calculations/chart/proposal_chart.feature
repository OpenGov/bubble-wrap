@accurate
Feature: Budget Calculations

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal

  @p1
  Scenario: Proposal chart for a proposal with - expense operation
    When I create expense operation ''
    And I view this operation
    And I make a bulk adjustment of -1
    And I done worksheet
    Then I see updated proposal chart data

  @p1
  Scenario: Proposal chart for a proposal with + expense operation
    When I create expense operation ''
    And I view this operation
    And I increase bulk adjustment 1
    And I done worksheet
    Then I see updated proposal chart data

  @p2
  Scenario: Proposal chart for a proposal with - revenue operation
    When I create revenue operation
    And I view this operation
    And I make a bulk adjustment of -1
    And I done worksheet
    Then I see updated proposal chart data

  @p2
  Scenario: Proposal chart for a proposal with + revenue operation
    When I create revenue operation
    And I view this operation
    And I increase bulk adjustment 1
    And I done worksheet
    Then I see updated proposal chart data
