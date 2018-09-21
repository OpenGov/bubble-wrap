@accurate
Feature: View chart manipulations

  Background:
    Given I am logged into jcwsaga as an entity_admin
    And I go to budgets from reports page

  @p1
  Scenario: Budget chart reset returns the correct values
    When I select first legend item on 'budget_builder' page
    And I reset chart
    Then I see correct default chart values on 'budget_builder' page

  @p1
  Scenario: Proposal chart reset returns the correct values
    When I have created a proposal via UI
    And I search for the proposal
    And I view the proposal
    And I select first legend item on 'new_proposal' page
    And I reset chart
    Then I see correct default chart values on 'new_proposal' page
