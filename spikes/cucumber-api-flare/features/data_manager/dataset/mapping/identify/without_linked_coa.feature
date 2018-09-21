Feature: Column Mapping / Identify Without a Linked CoA

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period

  Scenario: Ensure 'Continue' disabled for Step 1 before column mapping has been done
    When 'Continue' Mapping button is disable
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    Then 'Continue' Mapping button is enable

  Scenario: Ensure 'Save' disabled for Step 2 before transaction_amount (First Field) has a type selected
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And 'Setup & Add' Mapping button is disable
    And I map required fields for dataset file
      | Amount | Number |
    Then 'Setup & Add' Mapping button is enable

  Scenario: Map data with invalid column mapping
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year            |
      | Financial Period | Department Description |
      | Amount           | Amount                 |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Error Processing

  Scenario: Map data with invalid type
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount                 | Currency |
    And I remove mapping for the following columns
      | Department Description | Text     |
    And I map required fields for dataset file
      | Department Description | Number   |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Error Processing

  Scenario: Map data correctly and ensure enforced (for file with incorrect types)
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I click Upload File button
    And Upload 'dataset_upl_bad_types.xlsx' dataset file
    And I click 'Add to Dataset' Mapping button
    Then I see dataset file status as a Error Processing

  Scenario: Map data correctly and ensure enforced (for file with incorrect headers)
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I click Upload File button
    And Upload 'dataset_upl_bad_headers.xlsx' dataset file
    Then I see dataset 'Columns Do Not Match' pop-up status

  @release_run
  Scenario: Map data correctly and ensure properties panel has correct mappings
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Number |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I go to Configure Test Dataset
    And I go to Dataset Details
    Then I see that mappings are correct
      | Fiscal Year   | Financial Year     | Number |
      | Fiscal Period | Financial Period   | Number |
      | Amount        | Transaction Amount | Number |

  Scenario: Map columns as a percentile value
    When I map required fields for dataset file
      | Financial Year   | Fiscal Year   |
      | Financial Period | Fiscal Period |
      | Amount           | Amount        |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount          | Currency |
      | Fund Code       | Percent  |
      | Department Code | Percent  |
      | Object Code     | Percent  |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Added