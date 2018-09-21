Feature: Upload Dataset file

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test

  Scenario: Upload valid file
    When Upload 'dataset_upl.csv' dataset file
    Then I click 'Continue' Mapping button

  Scenario: Upload file with column named "Ledger Type"
    When Upload 'dataset_ledger_type_column.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Pay Date         |
      | Amount        | InvoiceAmount    |
      | Funds         | FundNbr          |
      | Departments   | DepartmentNbr    |
      | Object        | Ledger Type      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | InvoiceAmount | Currency          |
    And I click 'Setup & Add' Mapping button
    Then I see dataset 'File processed' pop-up status

  Scenario: Setup is not available when one upload in batch is incomplete
    When Upload 'dataset_200K.xlsx' dataset file
    And I wait 2 seconds
    And I reload a DatasetMapping page
    Then I see 'Upload Incomplete' status for 'dataset_200K.xlsx' file in Batch
    And 'Continue' button is disable