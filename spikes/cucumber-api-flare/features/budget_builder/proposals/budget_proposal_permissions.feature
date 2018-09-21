@secure
Feature: Users see budget and proposals according to their permsions

  @bvt
  Scenario: Budget creator can create an operation
    Given I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I have created a budget via UI
    And I have created a proposal via UI
    And I view the proposal
    When I create expense operation ''
    Then operation is created

  @bvt
  Scenario: Entity Admin can create a budget
    Given I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    When I have created a budget via UI
    And I search for the budget
    Then the budget appears in the budget list

  @bvt
  Scenario: Budget creator can create a proposal
    Given I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    When I have created a budget via UI
    And I have created a proposal via UI
    And I search for the proposal
    Then the proposal appears in the proposal list

  @bvt
  Scenario: Budget creator can reject a proposal
    Given I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    When I have created a budget via UI
    And I have created a proposal via UI
    And I view the proposal
    And I submit proposal
    And I reject this proposal
    Then proposal is rejected
