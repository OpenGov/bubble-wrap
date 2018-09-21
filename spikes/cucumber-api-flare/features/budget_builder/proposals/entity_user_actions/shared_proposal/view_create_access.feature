Feature: Entity user actions with 'View Shared + Create Proposals' access

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I visit budget settings
    And I visit budget access panel
    And I turn up access for default_subdomain entity_user as 'View Shared + Create Proposals'
    And default_subdomain entity_user has 'View Shared + Create Proposals' access
    And I close budget settings panel
    And I have created a proposal via UI
    And I view the proposal
    When I share proposal with default_subdomain entity_user
    And I can see default_subdomain entity_user in the list

  @bvt
  Scenario: can create the proposal
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    Then I can create a proposal

  @p1
  Scenario: can not delete the proposal
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    Then I can't delete the proposal

  @p1
  Scenario: can edit the proposal title
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    And I edit proposal title
    Then I see new proposal title

  @p2
  Scenario: can edit the proposal details
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    And I edit proposal details
    Then I see new proposal details

  @p2
  Scenario: can add support documents
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    And I add 'CoA_Cerritos_v0.xlsx' as support document
    Then I can see this document

  @p2
  Scenario: can delete support documents
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    And I add 'CoA_Cerritos_v0.xlsx' as support document
    And I delete this support document
    Then I don't see this document

  @p2
  Scenario: can create expense operations
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    Then I can create expense operation

  @p2
  Scenario: can create revenue operations
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    Then I can create revenue operation

  @p2
  Scenario:  can adjust amounts and persist to the backend
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    And I see default status values on 'new_proposal' page
    And I make a bulk adjustment of -1
    Then I should see updated status values on 'new_proposal' page

  @p2
  Scenario: can see activity feed
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    Then I see activity feed

  @p2
  Scenario: can share proposal
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    Then I can share this proposal

  @p2
  Scenario: Can not see export proposal link
    When I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    Then I do not see export proposal link

  @p2
  Scenario: Can modify worksheet title
    When I create expense operation ''
    And I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    And I visit expense operations
    And I view this operation
    And I modify operations name
    Then I see new operations name

  @p2
  Scenario: Can adjust worksheet amount
    When I create expense operation ''
    And I logged out from budget_builder page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I search for the proposal
    And I view the proposal
    And I visit expense operations
    And I view this operation
    And I see default status values on 'new_proposal' page
    And I make a bulk adjustment of 1
    Then I should see updated status values on 'new_proposal' page
