Feature: Verify Dataset Copied file totals

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year     |
      | Financial Period | Fiscal Period   |
      | Amount           | Amount          |
      | Funds            | Fund Code       |
      | Departments      | Department Code |
      | Object           | Object Code     |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added

  Scenario: Copied file totals displayed correctly on Explore
    When I click on Create Copy button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created' pop-up status
    And I select 'Test [Copy]' dataset
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I open 'Explore' in Dataset menu
    Then I verify that Total amount is $1,900.00
    And I verify that Row Count is 19

  Scenario: Copied file totals displayed correctly on Property Panel
    When I click on Create Copy button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created' pop-up status
    And I select 'Test [Copy]' dataset
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I wait 60 seconds
    And I reload a Dataset page
    And I open a Dataset property panel
    Then I see that 'Expenses' amount totals in property panel equal '$1,100.00'
    And Then I see that 'Revenues' amount totals in property panel equal '$800.00'