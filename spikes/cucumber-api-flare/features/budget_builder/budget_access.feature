Feature: Budget Access

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I visit budget settings

  @bvt
  Scenario: Entity admin can see budget access panel
    Then I can see budget access panel

  @bvt @wip # this tfunction does not work properly, but this test case fails to detect the bug
  Scenario: Entity admin can search for user which can collaborate on the budget
    When I visit budget access panel
    And I search for default_subdomain entity_user in the collaboration list
    Then I can see default_subdomain entity_user in the collaboration list

  @p1
  Scenario: Entity admin can turn up access for user as 'Proposal Viewer'
    When I visit budget access panel
    And I turn up access for default_subdomain entity_user as 'View All Proposals'
    Then default_subdomain entity_user has 'View All Proposals' access

  @p2
  Scenario: Entity admin can turn up access for user as 'View All + Create Proposals'
    When I visit budget access panel
    And I turn up access for default_subdomain entity_user as 'View All + Create Proposals'
    Then default_subdomain entity_user has 'View All + Create Proposals' access

  @p1
  Scenario: Entity admin can turn down access for user
    When I visit budget access panel
    And I turn up access for default_subdomain entity_user as 'View All Proposals'
    And I turn down access for default_subdomain entity_user
    Then default_subdomain entity_user can't collaborate on this budget

  @p1
  Scenario: Entity admin can turn down access for user
    When I visit budget access panel
    And I turn up access for default_subdomain entity_user as 'View Shared + Create Proposals'
    Then default_subdomain entity_user has 'View Shared + Create Proposals' access

  @p1
  Scenario: Entity admin can turn down access for user
    When I visit budget access panel
    And I turn up access for default_subdomain entity_user as 'View Shared Proposals'
    Then default_subdomain entity_user has 'View Shared Proposals' access
