@accurate
Feature: Budget Calculations

  @p1
  Scenario: Budget status for budget with proposal(with - expense operation)
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I see default status values on 'budget_builder' page
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    And I make a bulk adjustment of -1
    And I submit proposal
    Then I should see updated status values on 'budget_builder' page

  @p1
  Scenario: Budget status for budget with proposal(with + expense operation)
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I see default status values on 'budget_builder' page
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    And I increase bulk adjustment 1
    And I submit proposal
    Then I should see updated status values on 'budget_builder' page

  @p2
  Scenario: Budget status for budget with proposal(with - revenue operation)
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I see default status values on 'budget_builder' page
    And I view the proposal
    And I create revenue operation
    And I view this operation
    And I make a bulk adjustment of -1
    And I submit proposal
    Then I should see updated status values on 'budget_builder' page

  @p2
  Scenario: Budget status for budget with proposal(with + revenue operation)
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I see default status values on 'budget_builder' page
    And I view the proposal
    And I create revenue operation
    And I view this operation
    And I increase bulk adjustment 1
    And I submit proposal
    Then I should see updated status values on 'budget_builder' page
