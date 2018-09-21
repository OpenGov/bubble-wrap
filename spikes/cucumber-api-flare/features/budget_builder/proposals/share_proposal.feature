Feature: Share Proposal

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I visit budget settings
    And I visit budget access panel
    And I turn up access for default_subdomain entity_user as 'View All + Create Proposals'
    And default_subdomain entity_user has 'View All + Create Proposals' access
    And I close budget settings panel
    And I have created a proposal via UI
    And I view the proposal

  @bvt
  Scenario: Can add other users to proposal
    When I share proposal with default_subdomain entity_user
    Then I can see default_subdomain entity_user in the list

  @p1
  Scenario: Can remove users from proposal
    When I share proposal with default_subdomain entity_user
    And I remove default_subdomain entity_user
    Then I can't see default_subdomain entity_user in the list

  @p1
  Scenario: Can edit shared proposal
    When I share proposal with default_subdomain entity_user
    And I logged out from new_proposal page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    Then I can edit this proposal

  @p2
  Scenario: Can share shared proposal
    When I share proposal with default_subdomain entity_user
    And I logged out from new_proposal page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    Then I can share this proposal

  @p2
  Scenario: Can not share not shared proposal
    When I logged out from new_proposal page
    And I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    Then I can't share this proposal
