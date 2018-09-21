Feature: Batch Upload - Append file

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_existing_code.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Pay Date         |
      | Amount        | InvoiceAmount    |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency      |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I click Upload File button

  Scenario: Can not append while file is initializing
    When Upload 'dataset_existing_code_short.xlsx' dataset file
    And I see 'Initializing' status for 'dataset_existing_code_short.xlsx' file in Batch
    Then I shouldn't see the Add to Dataset button

  Scenario: Can not append while file is parsing
    When Upload 'dataset_existing_code_short.xlsx' dataset file
    And I see 'Parsing' status for 'dataset_existing_code_short.xlsx' file in Batch
    Then I shouldn't see the Add to Dataset button

  @release_run
  Scenario: Append when uploading is finished
    When Upload 'dataset_existing_code_short.xlsx' dataset file
    And I see dataset 'File Initialized!' pop-up status
    And I click 'Add to Dataset' Mapping button
    Then 'dataset_existing_code.xlsx' dataset should have 'Added' status
    And 'dataset_existing_code_short.xlsx' dataset should have 'Added' status

  @release_run
  Scenario: Append multiple uploads at once
    When Upload 'dataset_existing_code_short.xlsx' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And Upload 'dataset_existing_code_(dtools_310).xlsx' dataset file
    And I see 'Ready' status for 'dataset_existing_code_(dtools_310).xlsx' file in Batch
    And I click 'Add to Dataset' Mapping button
    Then 'dataset_existing_code_short.xlsx' dataset should have 'Added' status
    And 'dataset_existing_code_(dtools_310).xlsx' dataset should have 'Added' status

  Scenario: Append multiple error files
    When Upload 'corrupt.xlsx' dataset file
    And I see 'Parsing Error' status for 'corrupt.xlsx' file in Batch
    And Upload 'basic_error.xlsx' dataset file
    And I see 'Unrecognized Columns' status for 'basic_error.xlsx' file in Batch
    Then 'Add to Dataset' button is disable