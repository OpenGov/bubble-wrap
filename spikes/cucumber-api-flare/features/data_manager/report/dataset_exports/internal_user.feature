@dataset_exports
Feature: Filtered Dataset Exports on Grid Reports - Internal User/Logged In User

  Background:
    Given I am logged on as an OpenGov test admin
    And Create entity by api
    And I click New Dataset
    And I create a New Dataset with a random name

  Scenario: Dataset with less than 50k rows
    When Upload 'arizona_small_dataset_1.xlsx' dataset file
    And I see 'Ready' status for 'arizona_small_dataset_1.xlsx' file in Batch
    And I see default rows value for 'arizona_small_dataset_1.xlsx' dataset
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year            |
      | Financial Period | Fiscal period          |
      | Amount           | Amount                 |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency  |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select created dataset
    And I fill in the report information
    And I create the report
    And I select 'Fiscal period' option on Show filter
    And I click on Download button
    And I Export report current view
    And I read data from received email
    And I read exported file rows value
    Then Exported file rows value should be equal default file rows value

  Scenario: Dataset with exactly 50k rows
    When Upload 'arizona_50k.xlsx' dataset file
    And I see 'Ready' status for 'arizona_50k.xlsx' file in Batch
    And I see default rows value for 'arizona_50k.xlsx' dataset
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year            |
      | Financial Period | Fiscal period          |
      | Amount           | Amount                 |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency  |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select created dataset
    And I fill in the report information
    And I create the report
    And I select 'Fiscal period' option on Show filter
    And I click on Download button
    And I Export report current view
    And I read data from received email
    And I read exported file rows value
    Then Exported file rows value should be equal default file rows value

  Scenario: Dataset with more than 50k rows
    When Upload 'benchmark/arizona_100K.csv' dataset file
    And I see 'Ready' status for 'arizona_100K.csv' file in Batch
    And I see default rows value for 'arizona_100K.csv' dataset
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year            |
      | Financial Period | Fiscal period          |
      | Amount           | Amount                 |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency  |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select created dataset
    And I fill in the report information
    And I create the report
    And I select 'Fiscal period' option on Show filter
    And I click on Download button
    And I Export report current view
    And I read data from received email
    And I read exported file rows value
    Then Exported file rows value should be equal default file rows value
