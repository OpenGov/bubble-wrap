Feature: Finalize a budget

  @p1 @frictionless
  Scenario: Start to finalize a budget I created
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    When I click the Finalize Budget button
    Then the Budget review modal appears

  @bvt @frictionless
  Scenario: Confirm to finalize my budget
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    And I make a bulk adjustment of 1
    And I submit proposal
    And I click the Finalize Budget button
    And I confirm finalizing budget
    Then the Budget finalize success modal appears
    And the budget should be finalized

  @p2 @secure
  Scenario: Attempt to finalize a budget without permission
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
    Then I should not be able to finalize the budget

  @p2
  Scenario: The Budget review modal displayed right data
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I click the Finalize Budget button
    Then the Budget review modal appears
    And the Budget review modal displayed right data
