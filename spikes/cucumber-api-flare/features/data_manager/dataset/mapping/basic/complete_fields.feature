Feature: Basic Dataset mapping

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
      | Financial Year   | Fiscal Year            |
      | Financial Period | Fiscal Period          |
      | Amount           | Amount                 |
      | Funds            | Fund Code              |
      | Departments      | Department Code        |
      | Object           | Object Code            |

  Scenario: Mapping require fields
    When I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    Then I see dataset 'File processed' pop-up status

  @release_run
  Scenario: Mapping optional fields
    When I map optional fields for dataset file
      | Funds       | Fund Description        |
      | Departments | Department Description  |
      | Object      | Object Description      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    Then I see dataset 'File processed' pop-up status

  Scenario: Verify correct value assign for all mapping fields
    When I map optional fields for dataset file
      | Funds       | Fund Description        |
      | Departments | Department Description  |
      | Object      | Object Description      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount   | Currency  |
    Then I see that Fiscal Year locked for mapping
    And I see that Fiscal Period locked for mapping
    And I see that Fund Code locked for mapping
    And I see that Fund Description locked for mapping
    And I see that Department Code locked for mapping
    And I see that Department Description locked for mapping
    And I see that Object Code locked for mapping
    And I see that Object Description locked for mapping
    And I see 'Setup & Add' Mapping button