@frictionless
Feature: Create a new proposal

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget

  @bvt @frictionless
  Scenario: Create a proposal
    Given I have created a proposal via UI
    When I search for the proposal
    Then the proposal appears in the proposal list

  @bvt @frictionless
  Scenario: View a proposal
    Given I have created a proposal via UI
    When I view the proposal
    Then I see the proposal details
