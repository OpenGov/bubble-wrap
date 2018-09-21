@secure
Feature: Users see buttons according to their permissions

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
    When I have created a proposal via UI
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
    When I reject this proposal
    Then proposal is rejected

  @wip
  Scenario: Promoted OpenGov users can see the new proposal button
    Given I am logged on as an OpenGov admin
    When I go to settings from visitor_analytics page
    And I promote opengov_user
    And I logged out from settings_app page
    And I am logged on as an OpenGov user
    And I am in a 'Gotham' entity
    And I go to budgets from visitor_analytics page
    Then I can see the new proposal button
