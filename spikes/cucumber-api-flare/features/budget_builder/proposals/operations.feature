@frictionless
Feature: Create operations for a proposal

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal

  @bvt
  Scenario: Create a first operation for new proposal
    When I create expense operation ''
    Then I should see the new operation in the list

  @p1
  Scenario: Create multiple operations for a new proposal
    When I create expense operation ''
    And I create revenue operation
    Then I should see the new operation in the list

  @p1
  Scenario: Can edit operations name
    When I create expense operation ''
    And I view this operation
    And I modify operations name
    Then I see new operations name

  @bug @APO-1964 # this is no longer a valid test case
  Scenario: Modify selected nodes for an operation
    When I create expense operation ''
    And I view this operation
    And I modify selected nodes for this operation
    And I done worksheet
    Then I see new chart and legend labels

  @p1
  Scenario: Verify selected nodes stay selected
    When I create expense operation ''
    And I view this operation
    And I re-select some nodes for this worksheet
    And I re-open line items window
    Then the selected nodes stay selected

  @p1
  Scenario: Create an operation for a submitted rejected or resubmitted proposal
    And I submit proposal
    When I reject this proposal
    And I create expense operation ''
    Then the proposal's status reverts to draft

  @p2 @bug @APO-2054
  Scenario: Modify an operation for a submitted rejected or resubmitted proposal
    And I submit proposal
    When I reject this proposal
    And I resubmit this proposal
    And I view the proposal
    And I create expense operation ''
    Then the proposal's status reverts to draft

  @p2
  Scenario: Delete an operation for a submitted rejected or resubmitted proposal
    And I create expense operation ''
    And I delete this operation
    Then the proposal's status reverts to draft

  @p2
  Scenario: Cancel operation creation for new proposal
    When I start to create expense operation
    Then I can cancel operation creation
