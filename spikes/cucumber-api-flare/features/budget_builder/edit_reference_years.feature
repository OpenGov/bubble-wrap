Feature: Edit budget reference years

  @bvt
  Scenario: Edit budget reference years for non UDI entity
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I see default expenses chart data
    When I visit budget settings
    And I change reference years
    And I close budget settings panel
    Then I see that budget data is changed

  @bvt
  Scenario: Edit budget reference years for UDI entity
    Given I am logged into gotham as an entity_admin
    And I go to budgets from reports page
    And I have created a budget via UI
    And I see default expenses chart data
    When I visit budget settings
    And I change reference years
    And I close budget settings panel
    Then I see that budget data is changed