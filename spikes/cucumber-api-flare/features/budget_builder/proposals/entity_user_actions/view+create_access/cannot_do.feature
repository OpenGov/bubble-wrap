Feature: Entity user actions with someone else proposal (with 'View All + Create Proposals' access)

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I visit budget settings
    And I visit budget access panel
    And I turn up access for default_subdomain entity_user as 'View All + Create Proposals'
    And default_subdomain entity_user has 'View All + Create Proposals' access
    And I have created a proposal via UI
    And I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget

  @p1
  Scenario: can't update title for someone else proposal
    When I view the proposal
    Then I can't edit the proposal title

  @p1
  Scenario: can't update description for someone else proposal
    When I view the proposal
    Then I can't edit the proposal details

  @p2
  Scenario: can't share someone else proposal
    When I view the proposal
    Then I can't share this proposal

  @p2
  Scenario: can't create expense operations
    When I view the proposal
    Then I can't create expense operation

  @p2
  Scenario: can't create revenue operations
    When I view the proposal
    Then I can't create revenue operation
