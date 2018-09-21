@frictionless
Feature: Tooltips provide user with information from the chart

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget

  @bvt
  Scenario: Budget charts have tooltips
    Then I see that chart have tooltips

  @bvt
  Scenario: Proposal charts have tooltips
    When I view the proposal
    And I visit expense operations
    Then I see that chart have tooltips

  @p2
  Scenario: Tooltips data updated to reflect user's mouse move
    Given I see default expenses chart data
    When I go down through chart
    Then I see correct values in the chart
