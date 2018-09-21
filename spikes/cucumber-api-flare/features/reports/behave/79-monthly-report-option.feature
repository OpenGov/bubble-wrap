@configuration
Feature: Monthly Report Option


  Background:
    Given I have a Monthly report in the "Ishim" entity
    And I am logged as an 'OpenGov Admin' in 'Ishim' entity

 
  @ORPHAN
  Scenario Outline: Incremental amounts axis label for Monthly report

    When I visit the report
    And I click Settings button
    And I select Report Settings 'Monthly report options' option
    And I select '<option>' amounts settings
    And I close a report settings window
    Then I should see '<text>' amounts axis title text
    
    Examples:
      | name      | desc | option      | text                  |
      | Monthly_Z | mon  | Incremental | (incremental amounts) |
      | Monthly_X | mon  | Cumulative  | (cumulative amounts)  |


  @ORPHAN
  Scenario: Enable proration option is default value for Monthly report

    When I visit the report
    And I click Settings button
    And I select Report Settings 'Monthly report options' option
    Then I should see 'Proration enabled' as a default value for budget proration


  @ORPHAN @ie
  Scenario: Can change proration option is default value for Monthly report

    When I visit the report
    And I click Settings button
    And I select Report Settings 'Monthly report options' option
    And I change budget proration mode
    Then I should see changed budget proration mode

