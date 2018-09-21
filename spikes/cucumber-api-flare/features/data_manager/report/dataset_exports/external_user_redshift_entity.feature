@dataset_exports @wip # redshift entity
Feature: Filtered Dataset Exports on Grid Reports - External User/Non Logged in User

  Background:
    Given I am logged on as an OpenGov test admin
    And I am in a 'testingvilleca' entity
    And I go to data manager from visitor_analytics page
    And I click New Dataset
    And I generate a Dataset linked to 'Arizona_CoA (Medium)' CoA

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
      | Funds            | Fund 2 code            |
      | Departments      | Department code        |
      | Object           | Category level 3 code  |
      | Appropriation    | Appropriation 1 code   |
      | SubFund          | SubFund#               |
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
    And I edit access link
    And I select 'Network' type
    And I should see 'Network' type selected
    And I go to portal from report_view page
    And I go to Reports portal section
    And I add newly created report
    And I click on Preview in Transparency button
    And I skip transparency report welcome tour
    And I click on Download button on transparency page
    And I should see enable export button
    And I Export Current View
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
      | Funds            | Fund 2 code            |
      | Departments      | Department code        |
      | Object           | Category level 3 code  |
      | Appropriation    | Appropriation 1 code   |
      | SubFund          | SubFund#               |
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
    And I edit access link
    And I select 'Network' type
    And I should see 'Network' type selected
    And I go to portal from report_view page
    And I go to Reports portal section
    And I add newly created report
    And I click on Preview in Transparency button
    And I skip transparency report welcome tour
    And I click on Download button on transparency page
    And I should see enable export button
    And I Export Current View
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
      | Funds            | Fund 2 code            |
      | Departments      | Department code        |
      | Object           | Category level 3 code  |
      | Appropriation    | Appropriation 1 code   |
      | SubFund          | SubFund#               |
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
    And I edit access link
    And I select 'Network' type
    And I should see 'Network' type selected
    And I go to portal from report_view page
    And I go to Reports portal section
    And I add newly created report
    And I click on Preview in Transparency button
    And I skip transparency report welcome tour
    And I click on Download button on transparency page
    Then I should see disable export button
