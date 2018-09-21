@configuration
Feature: Account Codes options Part 2


  Background:
    Given I have a Balance Sheet report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity

 
  @ORPHAN
  Scenario: Disabled default value for Balance Sheet report

    When I visit the report
    Then I should see account codes options with disabled default value


  @ORPHAN @ie
  Scenario: Can make enable account codes option for Balance Sheet report

    When I visit the report
    And I click on account codes toggle
    Then I should see enabled account codes options

