Feature: Batch Upload - Polling

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test

  Scenario: Sources file table polls
    When Upload 'dataset_multiple_sheets1.xlsx' dataset file
    And Upload 'dataset_multiple_sheets2.xlsx' dataset file
    And I click 'Setup Later' Mapping button
    Then 'dataset_multiple_sheets1.xlsx' dataset should have 'Initializing' status
    And 'dataset_multiple_sheets2.xlsx' dataset should have 'Initializing' status
    And I see dataset 'File Initialized!' pop-up status
    And 'dataset_multiple_sheets1.xlsx' dataset should have 'Set up dataset' status
    And 'dataset_multiple_sheets2.xlsx' dataset should have 'Set up dataset' status

  @release_run
  Scenario: Batch upload screen polls
    When Upload 'dataset_1K.xlsx' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And Upload 'dataset_5K.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Invoice_Date     |
      | Amount        | Test_Amount      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency      |
    And I click 'Setup & Add' Mapping button
    And I click 'Show files' for 'dataset_1K.xlsx' file
    Then I see dataset 'File processed' pop-up status
    And I see 'Added' status for 'dataset_1K.xlsx' file in Batch
    And I see 'Added' status for 'dataset_5K.xlsx' file in Batch