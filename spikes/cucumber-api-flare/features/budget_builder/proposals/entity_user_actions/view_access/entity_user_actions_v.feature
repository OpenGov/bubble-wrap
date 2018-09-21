Feature: Entity user actions (with 'View All Proposals' access)

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I visit budget settings
    And I visit budget access panel
    And I turn up access for default_subdomain entity_user as 'View All Proposals'
    And default_subdomain entity_user has 'View All Proposals' access
    And I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget

  @p1
  Scenario: can't create the proposal
    Then I can't create a proposal

  @p1
  Scenario: can't delete the proposal
    Then I can't delete the proposal

  @p1
  Scenario: can't edit the proposal title
    When I view the proposal
    Then I can't edit the proposal title

  @p2
  Scenario: can't edit the proposal details
    When I view the proposal
    Then I can't edit the proposal details

  @p2
  Scenario: can't create expense operations
    When I view the proposal
    Then I can't create expense operation

  @p2
  Scenario: can't create revenue operations
    When I view the proposal
    Then I can't create revenue operation

  @p2
  Scenario: can see activity feed
    When I view the proposal
    Then I see activity feed

  @p2
  Scenario: can't share proposal
    When I view the proposal
    Then I can't share this proposal
