Feature: Batch Upload - Source Files

  @release_run
  Scenario: Show files link
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
    Then I should see 'Show files' link for 'dataset_upl.csv' file

  Scenario: Batch should get appended without single errored upload
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And I upload 'dataset_upl.csv' file 10 times in Batch
    And Upload 'corrupt.xlsx' dataset file
    And I see 'Parsing Error' status for 'corrupt.xlsx' file in Batch
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
    And I see that dataset has '10' appended files with Added status
    And I click 'Show files' for 'corrupt.xlsx' file
    Then I see 'Parsing Error' status for 'corrupt.xlsx' file in Batch
    And I should see '10 of 11 files added' on Batch table