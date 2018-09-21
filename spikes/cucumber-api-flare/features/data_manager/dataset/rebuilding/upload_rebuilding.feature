Feature: Dataset rebuilding after uploading a file

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.csv' dataset file
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
    And I see dataset file status as a Added

  Scenario: Upload files during the rebuidling - sync w/coa
    When I go to Configure Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    And I click Upload File button
    And Upload 'dataset_upl_new_code.csv' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And I click 'Setup Later' Mapping button
    Then 'dataset_upl.csv' dataset should have 'Rebuilding' status
    And 'dataset_upl_new_code.csv' dataset should have 'Rebuilding' status
    And I should see the small loading icons in front of each dataset

  Scenario: Upload files during the rebuidling - delete file
    When I click on 'dataset_upl.csv' source file
    And I click Delete dataset file via property panel
    And I click Upload File button
    And Upload 'dataset_upl_new_code.csv' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And I click 'Add Later' Mapping button
    Then 'dataset_upl_new_code.csv' dataset should have 'Ready' status
    And I should see the small loading icons in front of each dataset