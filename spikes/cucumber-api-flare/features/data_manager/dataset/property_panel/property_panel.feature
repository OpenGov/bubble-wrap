Feature: Property Panel

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test

  Scenario: Displayed correct upload status
    When Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
      | Financial Period | Fiscal Period           |
      | Amount           | Amount                  |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I open a Dataset property panel
    Then I should see 'Processed' status in property panel

  Scenario: Displayed correct sheets for file with multiple sheets
    When Upload 'dataset_multiple_sheets1.xlsx' dataset file
    And I see 'Ready' status for 'dataset_multiple_sheets1.xlsx' file in Batch
    And 'Select Sheets' button is disable
    And I select 'Sheet3' sheet from the 'dataset_multiple_sheets1.xlsx' upload dropdown list
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date   | Pay Date      |
      | Amount | InvoiceAmount |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I open a Dataset property panel
    Then I should see 3 sheets in property panel

  Scenario: Displayed correct uploaded day and time (API needs)
    When Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
      | Financial Period | Fiscal Period           |
      | Amount           | Amount                  |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I open a Dataset property panel
    Then I should see correct uploaded day and time

  Scenario: Displayed correct File_Id (API needs)
    When Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
      | Financial Period | Fiscal Period           |
      | Amount           | Amount                  |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I open a Dataset property panel
    Then I should see correct File_Id