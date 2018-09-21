Feature: Column Mapping / Identify With a Linked CoA

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period

  @release_run
  Scenario: Map data with invalid column mapping
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Department Description |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Fiscal Period          |
      | Object           | Object Code            |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Error Processing

  @release_run
  Scenario: Map data correctly and ensure properties panel has correct mappings
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year     |
      | Financial Period | Fiscal Period   |
      | Amount           | Amount          |
      | Funds            | Fund Code       |
      | Departments      | Department Code |
      | Object           | Object Code     |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I go to Configure Test Dataset
    And I go to Dataset Details
    Then I see that mappings are correct
      | Fiscal Year     | Financial Year     | Number |
      | Fiscal Period   | Financial Period   | Number |
      | Amount          | Transaction Amount | Number |
      | Fund Code	    | Funds code	     | String |
      | Department Code	| Departments code   | String |
      | Object Code	    | Expenses code	     | String |
