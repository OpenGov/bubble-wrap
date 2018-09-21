@wip
Feature: Total Amount verification
  Background:
    Given I am logged into morgan as an entity_admin
    And I go to budgets from reports page
    And I visit the budget '21 lines budget'
    And I select Line Items

  @p1 @APO-2347 @bug
  Scenario: Total revenue base amount is correct
    When I select 'rev' as ledger type
    Then The 'base' 'Rev.' total equals the sum of its column

  @p1 @APO-2347 @bug
  Scenario: Total expense base amount is correct
    When I select 'exp' as ledger type
    Then The 'base' 'Exp.' total equals the sum of its column

  @p1
  Scenario: Total revenue adjustment amount is correct
    When I select 'rev' as ledger type
    Then The 'adjustment' 'Rev.' total equals the sum of its column

  @p1
  Scenario: Total expense adjustment amount is correct
    When I select 'exp' as ledger type
    Then The 'adjustment' 'Exp.' total equals the sum of its column

  @p1 @APO-2347 @bug
  Scenario: Total revenue proposed amount is correct
    When I select 'rev' as ledger type
    Then The 'proposed' 'Rev.' total equals the sum of its column

  @p1
  Scenario: Total expense proposed amount is correct
    When I select 'exp' as ledger type
    Then The 'proposed' 'Exp.' total equals the sum of its column

  @p1
  Scenario: Total revenue percent changed amount is correct
    When I select 'rev' as ledger type
    Then Total 'Rev.' percent changed amount is correct

  @p1
  Scenario: Total expense percent changed amount is correct
    When I select 'exp' as ledger type
    Then  Total 'Exp.' percent changed amount is correct

  @p1
  Scenario: Each revenue line item percent changed is correct
    When I select 'rev' as ledger type
    Then Each 'Rev.' line item percent changed amount is correct

  @p1
  Scenario: Each expense line item percent changed is correct
    When I select 'exp' as ledger type
    Then Each 'Exp.' line item percent changed amount is correct
