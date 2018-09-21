Feature: Dataset rebuilding after deleting a file

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.csv' dataset file
    And Upload 'dataset_upl_new_code.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
      | Financial Period | Fiscal Period           |
      | Amount           | Amount                  |
      | Funds            | Fund Code               |
      | Departments      | Department Code         |
      | Object           | Object Code             |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And 'dataset_upl_new_code.csv' dataset should have 'New Codes' status

  Scenario: Deleting - loading icon check
    When I click on 'dataset_upl.csv' source file
    And I click Delete dataset file via property panel
    Then the settings gear should become a loading icon for 'Test' dataset
    And I should be not able to perform any action on the setting icon for 'Test'

  Scenario: Deleting - deleting status check
    When I click on 'dataset_upl_new_code.csv' source file
    And I click 'Got it'
    And I click Delete dataset file via property panel
    Then I should see the small loading icons in front of 'dataset_upl_new_code.csv' dataset
    And  'dataset_upl_new_code.csv' dataset should have 'Deleting' status