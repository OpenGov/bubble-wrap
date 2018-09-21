Feature: Budget Export

  @p1
  Scenario: Publish to Dataset
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    When I click on Export button
    And I export budget as 'Publish to Dataset'
    And I go to data manager from budget_builder page
    And I go to general ledgers page
    Then I see exported budget in data sets table

  @bvt
  Scenario: Export Budget Amounts
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    When I visit the new budget
    And I click on Export button
    Then I can export tables to xlxs

  @p1 @ci-smoke @wip
  Scenario: Publish to Dataset (UDI)
    Given I am logged into gotham as an entity_admin
    And I go to budgets from reports page
    And I have created a budget via UI
    And I visit budget settings
    And I change reference years
    And I close budget settings panel
    And I have created a proposal via UI
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    And I make a bulk adjustment of 1
    And I submit proposal
    When I click on Export button
    And I export budget as 'Publish to Dataset'
    Then I see exported budget as dataset

  @p1
  Scenario: All Proposals Export
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    When I click on Export button
    And I export budget as 'All Proposals Export'
    Then I should see 'Downloading budget' window

  @p1
  Scenario: Consolidated Budget Export
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    When I click on Export button
    And I export budget as 'Consolidated Budget Export'
    Then I should see 'Downloading budget' window
