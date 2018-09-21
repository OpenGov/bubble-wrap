Feature: Reports - Exporting after dataset change

  Scenario: Report download data changes after one dataset file delete
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_existing_code.xlsx' dataset file
    And I see 'Ready' status for 'dataset_existing_code.xlsx' file in Batch
    And Upload 'dataset_existing_code_(dtools_310).xlsx' dataset file
    And I see 'Ready' status for 'dataset_existing_code_(dtools_310).xlsx' file in Batch
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Pay Date         |
      | Amount        | InvoiceAmount    |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency      |
    And I click 'Setup & Add' Mapping button
    And 'dataset_existing_code.xlsx' dataset should have 'Added' status
    And 'dataset_existing_code_(dtools_310).xlsx' dataset should have 'Added' status
    And I go to reports from Dataset page
    And I begin to create a 'Grid-based' report
    And I select 'Test' Transaction dataset
    And I fill in the report name - 'Test_report' and description - 'By Grid-based type'
    And I create the report
    And I click on Download button
    And I should see the following download data files buttons
      | All fiscal years | 2 KB |
      | FY 2009          | 2 KB |
    And I go to data manager from ReportView page
    And I select 'Test' dataset
    And I delete dataset file 'dataset_existing_code_(dtools_310).xlsx' dataset via trash bin icon
    And I see dataset 'File deleted' pop-up status
    And I go to reports from Dataset page
    And I select the 'Test_report' report
    And I click on Download button
    Then I should see the following download data files buttons
      | All fiscal years | 1 KB |
      | FY 2009          | 1 KB |
