Feature: Dataset Cloning - Reports

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
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
    And I see dataset file status as a Added
    And I go to reports from Dataset page
    And I begin to create a 'Grid-based' report
    And I select 'Test' Transaction dataset
    And I fill in the report information
    And I create the report
    And I save table data to 'original_report'
    And I go to data manager from ReportView page
    And I select 'Test' dataset
    And I click on Create Copy button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created' pop-up status
    And I go to reports from Dataset page

  Scenario: Reports should display same data
   When I begin to create a 'Grid-based' report
   And I select 'Test [Copy]' Transaction dataset
   And I fill in the report name - 'Test_report2' and description - 'By Grid-based type'
   And I create the report
   And I save table data to 'copy_report'
   Then the 'original_report' and 'copy_report' reports data should be equal

  Scenario: Dataset Clone appear in available report data
    When I select recently created report
    And I click Settings button
    And I select Report Settings 'Report data' option
    Then I should see 'Test [Copy]' dataset in report data list

  Scenario: Can change the dataset in the report to the clone
    When I select recently created report
    And I click Settings button
    And I select Report Settings 'Report data' option
    And I select 'Test [Copy]' as new Transaction dataset for report
    And I click 'Save' button to save report data change
    And I save table data to 'copy_report'
    Then the 'original_report' and 'copy_report' reports data should be equal