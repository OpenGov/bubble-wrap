@frictionless
Feature: View chart manipulations

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget

  @p2
  Scenario: Go back in the budget chart history
    When I select first legend item on 'budget_builder' page
    And I go back in the chart history on 'budget_builder' page
    Then previous chart appears on 'budget_builder' page

  @p2
  Scenario: Go back in the proposal chart history
    When I have created a proposal via UI
    And I view the proposal
    And I select first legend item on 'new_proposal' page
    And I go back in the chart history on 'new_proposal' page
    Then previous chart appears on 'new_proposal' page

  @p1
  Scenario: Budget charts without history cannot be reset
    Then I can't reset this chart

  @bvt
  Scenario: Chart history buttons are disabled when there is no history
    Then chart history buttons are disabled
