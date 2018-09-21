Feature: Dataset Mapping - General

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I click New Dataset
    And I create a Dataset Test

  Scenario: Ensure correct file is used when taken to data-loader
    When Upload 'corrupt.xlsx' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And Upload 'corrupt.xlsx' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    Then I see dataset preview data
      | Description Pending: Fund#952 |
      | Los Cerritos Capital Projects |
    And I should see 'dataset_upl.csv' filename in the preview summary

  Scenario: Ensure column type resets to default on cancel
    When Upload 'blank_column.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Transaction Date
    And I map required fields for dataset file
      | Date        | Fund_Type |
      | Amount      | Programs  |
    And I remove mapping for the following columns
      | Date        | Fund_Type |
      | Amount      | Programs  |
    And I map required fields for dataset file
      | Date        | Document_Date |
      | Amount      | Test_Amount   |
    And I click 'Continue' Mapping button
    Then I should see filled the following mapping fields
      | Fund_Type     | Text     |
      | Programs      | Text     |
      | Document_Date | Date     |
    And I should see blank the following mapping fields
      | Test_Amount   |

    Scenario: Ensure types can be changed, move to next next, and progress
      When Upload 'blank_column.csv' dataset file
      And I click 'Continue' Mapping button
      And I map a Date Format to Transaction Date
      And I map required fields for dataset file
        | Date        | Fund_Type |
        | Amount      | Programs  |
      And I remove mapping for the following columns
        | Date        | Fund_Type |
        | Amount      | Programs  |
      And I map required fields for dataset file
        | Date        | Document_Date |
        | Amount      | Test_Amount   |
      And I click 'Continue' Mapping button
      And I map required fields for dataset file
        | Test_Amount | Currency |
      Then 'Setup & Add' Mapping button is enable