Feature: Test line item adjustment and sort them in ascending and descending orders

  Background:
    Given I am logged into harfordmd as an entity_admin
    And I go to budgets from reports page
    And I visit the budget 'FY 18 Proposed Budget'
    And I visit budget settings
    And I visit COA reference settings
    And I select account string as COA reference level
    And I close budget settings panel
    And I search for the proposal 'Highways Fund Revenues'
    And I select the proposal 'Highways Fund Revenues'
    And I select proposal Revenues tab
    And I select 'Highways Fund Revenues' operation

  @p2
  Scenario: can sort account string by ascending order
    When I sort account strings by increase
    Then I see account strings sorted by increase

  @p2 @bug
  Scenario: can sort account string by descending order
    When I sort account strings by decrease
    Then I see account strings sorted by decrease