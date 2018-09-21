Feature: An entity admin or higher can reject a proposal

  @bvt @frictionless
  Scenario: Reject a proposal (Request Proposal Revisions)
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I submit proposal
    And I reject this proposal
    Then proposal is rejected
    And the rejected proposal has a reason

  @p1 @frictionless
  Scenario: Reject a proposal without a reason (Request Proposal Revisions)
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I submit proposal
    And I reject this proposal without a reason
    Then proposal is rejected
    And the rejected proposal has no reason

  @p1 @frictionless
  Scenario: Submitted proposals have a Request Proposal Revisions
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I submit proposal
    Then this proposal have a RPR

  @p2 @frictionless
  Scenario: Rejected proposals have no RPR
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I submit proposal
    And I reject this proposal
    Then this proposal have no RPR

  @p2 @frictionless
  Scenario: Open proposals have no RPR
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    Then this proposal have no RPR

  @p2 @frictionless
  Scenario: Resubmitted proposals have an RPR
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I submit proposal
    And I reject this proposal
    And I resubmit this proposal
    Then this proposal have a RPR

  @p2 @frictionless
  Scenario: Canceling a revision request
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    When I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I submit proposal
    Then I am able to cancel revision request

  @p2 @secure
  Scenario: Entity user have the ability to revise his own proposal
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I visit budget settings
    And I visit budget access panel
    And I turn up access for default_subdomain entity_user as 'View All + Create Proposals'
    And default_subdomain entity_user has 'View All + Create Proposals' access
    And I logged out from budget_builder page
    When I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I have created a proposal via UI
    And I view the proposal
    Then I am able to revise this proposal

  @p2 @secure
  Scenario: Entity user does not have the ability to revise someone else proposal
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
    When I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    Then I am not able to revise this proposal
