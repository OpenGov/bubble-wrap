@dataset_exports
Feature: Deletion of Datasets w/ Filtered Dataset Exports

  Scenario: Delete dataset for newly created entity
    Given I am logged on as an OpenGov test admin
    And Create entity by api
    And I click New Dataset
    And I create a New Dataset with a random name
    When Upload 'arizona_small_dataset_1.xlsx' dataset file
    And I see 'Ready' status for 'arizona_small_dataset_1.xlsx' file in Batch
    And I see default rows value for 'arizona_small_dataset_1.xlsx' dataset
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year   |
      | Financial Period | Fiscal period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
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
    And I delete created report
    And I go to data manager from reports page
    And I delete newly created Dataset
    Then I see dataset 'Dataset deleted' pop-up status
    And I shouldn't see newly created dataset in Dataset list

  Scenario: Delete dataset for City of Hanford entity
    Given I am logged on as an OpenGov test admin
    And I am in a 'hanfordca' entity
    And I go to data manager from visitor_analytics page
    And I click New Dataset
    And I create a New Dataset with a random name
    When Upload 'arizona_small_dataset_1.xlsx' dataset file
    And I see 'Ready' status for 'arizona_small_dataset_1.xlsx' file in Batch
    And I see default rows value for 'arizona_small_dataset_1.xlsx' dataset
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year   |
      | Financial Period | Fiscal period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Continue' Mapping button
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
    And I delete created report
    And I go to data manager from reports page
    And I delete newly created Dataset
    Then I see dataset 'Dataset deleted' pop-up status
    And I shouldn't see newly created dataset in Dataset list