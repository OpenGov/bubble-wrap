Feature: Configure Dataset Panel

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status

  Scenario: Can switch between Configure tab - Options
    When I go to Configure Test Dataset
    Then I should see all Options tab buttons

  Scenario: Can switch between Configure tab - Datails
    When I go to Configure Test Dataset
    And I go to Dataset Details
    Then I see that mappings are correct
      | Fiscal Year   | Financial Year     | Number |
      | Fiscal Period | Financial Period   | Number |
      | Amount        | Transaction Amount | Number |

  Scenario Outline:: Back button works
    When I go to Configure Test Dataset
    And I select <option> on Dataset configure option
    And I click on back configure panel button
    Then I should see all Options tab buttons

    Examples:
      | option                              |
      | Preview and edit check image fields |
      | Configure columns                   |
