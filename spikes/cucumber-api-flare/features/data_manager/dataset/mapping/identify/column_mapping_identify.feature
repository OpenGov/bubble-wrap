Feature: Column Mapping / Identify

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period

  Scenario: Selection of Financial Year & Period causes a change in mapping fields
    Then I see required fields for Financial Year & Period Date Format
      | item 1 | Financial Year   |
      | item 2 | Financial Period |

  Scenario: both fields as well as amount must be selected before 'Continue' is enabled
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year     |
      | Financial Period | Fiscal Period   |
      | Amount           | Amount          |
    Then 'Continue' Mapping button is enable

  Scenario: both fields as well as amount must be selected before 'Continue' is enabled
    When I map required fields for dataset file
      | Amount      | Amount          |
    Then 'Continue' Mapping button is disable

  Scenario: Moving back from Financial Year & Period resets to just one field
    When I map a Date Format to Financial Year
    Then I don't see required fields for Financial Year & Period Date Format
      | item 1 | Financial Period |