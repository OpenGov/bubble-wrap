Feature: Open_in_Excel button status

  @p2
  Scenario: check status with turned off budget_excel_add_in permission
    Given I turn off budget_excel_add_in feature for 'default_subdomain' entity
    And I have created a budget
    And I have created a proposal
    When I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    Then I should see a correct status of Open_in_Excel button according to the platform

  @p2
  Scenario: check status with turned on budget_excel_add_in permission
    Given I turn on budget_excel_add_in feature for 'default_subdomain' entity
    And I have created a budget
    And I have created a proposal
    When I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    Then I should see Open_in_Excel button according to the platform

  @p2
  Scenario: entity users with 'View All + Create Proposals' access can see Open_in_Excel
            button with turned on budget_excel_add_in permission
    Given I turn on budget_excel_add_in feature for 'default_subdomain' entity
    And I have created a budget
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
    And I share proposal with default_subdomain entity_user
    And I logged out from new_proposal page
    When I am logged into default_subdomain as an entity_user
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    Then I should see Open_in_Excel button according to the platform