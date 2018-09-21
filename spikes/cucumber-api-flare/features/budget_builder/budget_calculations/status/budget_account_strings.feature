@accurate
Feature: Budget Calculations

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I see default status values on 'budget_builder' page
    And I view the proposal

  @p1
  Scenario: Budget status for a proposal with - expense operation account strings
    When I create expense operation ''
    And I view this operation
    And I make an absolute adjustment of -1 for first account string
    And I submit proposal
    Then I should see updated status values on 'budget_builder' page

  @p1
  Scenario: Budget status for a proposal with + expense operation account strings
    When I create expense operation ''
    And I view this operation
    And I make an absolute adjustment of 1 for first account string
    And I submit proposal
    Then I should see updated status values on 'budget_builder' page

  @p2
  Scenario: Budget status for a proposal with - revenue operation account strings
    When I create revenue operation
    And I view this operation
    And I make an absolute adjustment of -1 for first account string
    And I submit proposal
    Then I should see updated status values on 'budget_builder' page

  @p2
  Scenario: Budget status for a proposal with + revenue operation account strings
    When I create revenue operation
    And I view this operation
    And I make an absolute adjustment of 1 for first account string
    And I submit proposal
    Then I should see updated status values on 'budget_builder' page
