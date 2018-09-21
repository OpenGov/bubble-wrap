Feature: Dataset - file deletion via trash icon

  Scenario Outline: Delete single file - different formats
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And Upload '<file>' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year      |
      | Financial Period | Fiscal Period    |
      | Amount           | Amount           |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency         |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I delete dataset file '<file>' dataset via trash bin icon
    Then '<file>' dataset should have 'Deleting' status
    And I should see Batch uploader

  Examples:
    | file             |
    | dataset_upl.csv  |
    | dataset_upl.xls  |
    | dataset_upl.xlsx |

  Scenario: Delete Error file
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'corrupt.xlsx' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And I click 'Setup Later' Mapping button
    And 'corrupt.xlsx' dataset should have 'Parsing Error' status
    And I delete dataset file 'corrupt.xlsx' dataset via trash bin icon
    Then 'corrupt.xlsx' dataset should have 'Deleting' status
    And I should see Batch uploader

  Scenario: Delete multiple file
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
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
    And I click on 'dataset_upl_new_code.csv' source file
    And I click 'Got it'
    And I close a panel
    And I delete dataset file 'dataset_upl.csv' dataset via trash bin icon
    And I delete dataset file 'dataset_upl_new_code.csv' dataset via trash bin icon
    Then 'dataset_upl_new_code.csv' dataset should have 'Deleting' status
    And I should see Batch uploader

  Scenario: Delete file which contains more than 50K
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_100K.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Invoice_Date  |
      | Amount        | Test_Amount   |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Test_Amount   | Currency       |
    And I click 'Setup & Add' Mapping button
    And 'dataset_100K.xlsx' dataset should have 'Added' status
    And I delete dataset file 'dataset_100K.xlsx' dataset via trash bin icon
    Then 'dataset_100K.xlsx' dataset should have 'Deleting' status
    And I should see Batch uploader

  Scenario: Deleting Dataset via trash icon - reload check
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.xls' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year      |
      | Financial Period | Fiscal Period    |
      | Amount           | Amount           |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency         |
    And I click 'Setup & Add' Mapping button
    And I see dataset 'File processed' pop-up status
    And I delete dataset file 'dataset_upl.xls' dataset via trash bin icon
    And I reload a Dataset page
    Then 'dataset_upl.xls' dataset should have 'Deleting' status
    And I should see Batch uploader

  Scenario: Delete upload should only cause the particular upload to change indicators
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
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
    And I delete dataset file 'dataset_upl.csv' dataset via trash bin icon
    Then I should see the small loading icons in front of 'dataset_upl.csv' dataset
    And I should not see the small loading icons in front of 'dataset_upl_new_code.csv' dataset
    And 'dataset_upl_new_code.csv' dataset should have 'New Codes' status
    And 'dataset_upl.csv' dataset should have 'Deleting' status
    And I should not see 'dataset_upl.csv' dataset in a source files list

  Scenario: Delete from Source Files with refresh
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
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
    And I delete dataset file 'dataset_upl.csv' dataset via trash bin icon
    And I reload a Dataset page
    Then 'dataset_upl.csv' dataset should have 'Deleting' status
    And I should not see 'dataset_upl.csv' dataset in a source files list

  Scenario: Delete file during rebuilding
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
    And I go to Configure Test Dataset
    And I select Sync with chart of accounts on Dataset configure option
    And 'dataset_upl.csv' dataset should have 'Rebuilding' status
    And I delete dataset file 'dataset_upl.csv' dataset via trash bin icon
    Then 'dataset_upl.csv' dataset should have 'Deleting' status
    And I should not see 'dataset_upl.csv' dataset in a source files list
