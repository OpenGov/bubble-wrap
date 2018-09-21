Feature: Delete Dataset

  Background:
    Given I am logged on as an OpenGov admin
    When Create entity by api

  Scenario: User can delete non-mapped dataset
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I click 'Setup Later' Mapping button
    And I delete 'Test' Dataset
    Then I see notification contains 'Test' 'was deleted'
    And I shouldn't see 'Test' dataset in Dataset list

   Scenario: Delete dataset through Cancel batch btn
     When I click New Dataset
     And I create a Dataset Test
     And Upload 'dataset_upl.csv' dataset file
     And I see 'Ready' status for 'dataset_upl.csv' file in Batch
     And I click 'Cancel' Mapping button
     And I click 'Okay' in dialog on Mapping Page
     Then I see notification contains 'Test' 'was deleted'
     And I shouldn't see 'Test' dataset in Dataset list

  @release_run
  Scenario: User can delete a simple dataset
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
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
    And I see dataset file status as a Added
    And I delete 'Test' Dataset
    Then I see notification contains 'Test' 'was deleted'
    And I shouldn't see 'Test' dataset in Dataset list

  Scenario: User can see deleting icon presence
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
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
    And I see dataset file status as a Added
    And I delete 'Test' Dataset
    Then I should see data hint for the dataset spinner icon

  @release_run
  Scenario: User can delete a simple dataset with multiple files
    When I click New Dataset
    And I create a Dataset Test
    And Upload 'dataset_upl.csv' dataset file
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
    And I see dataset file status as a Added
    And I click Upload File button
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Add to Dataset' Mapping button
    And I see dataset 'File processed' pop-up status
    And I delete 'Test' Dataset
    Then I see notification contains 'Test' 'was deleted'
    And I shouldn't see 'Test' dataset in Dataset list

  @release_run
  Scenario: User can delete Linked dataset
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year      |
      | Financial Period | Fiscal Period    |
      | Amount           | Amount           |
      | Funds            | Fund Code        |
      | Departments      | Department Code  |
      | Object           | Object Code      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency         |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I delete 'Test' Dataset
    Then I see notification contains 'Test' 'was deleted'
    And I shouldn't see 'Test' dataset in Dataset list

  Scenario: Delete multiple linked datasets
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I create 4 linked datasets with 'dataset_upl.csv' file and no mapping
    And I delete 'Test4' Dataset
    And I see notification contains 'Test4' 'was deleted'
    And I delete 'Test3' Dataset
    And I see notification contains 'Test3' 'was deleted'
    And I delete 'Test2' Dataset
    And I see notification contains 'Test2' 'was deleted'
    And I delete 'Test1' Dataset
    And I see notification contains 'Test1' 'was deleted'
    Then I shouldn't see 'Test1' dataset in Dataset list
    And I shouldn't see 'Test2' dataset in Dataset list
    And I shouldn't see 'Test3' dataset in Dataset list
    And I shouldn't see 'Test4' dataset in Dataset list

  Scenario: Delete multiple linked datasets with mapped file
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I create 4 linked datasets with 'dataset_upl.csv' file and mapping
    And I delete 'Test4' Dataset
    And I see notification contains 'Test4' 'was deleted'
    And I delete 'Test3' Dataset
    And I see notification contains 'Test3' 'was deleted'
    And I delete 'Test2' Dataset
    And I see notification contains 'Test2' 'was deleted'
    And I delete 'Test1' Dataset
    And I see notification contains 'Test1' 'was deleted'
    Then I shouldn't see 'Test1' dataset in Dataset list
    And I shouldn't see 'Test2' dataset in Dataset list
    And I shouldn't see 'Test3' dataset in Dataset list
    And I shouldn't see 'Test4' dataset in Dataset list

  Scenario: Delete multiple linked datasets with appended file
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I create 4 linked datasets with mapped and appended 'dataset_upl.csv' file
    And I delete 'Test4' Dataset
    And I see notification contains 'Test4' 'was deleted'
    And I delete 'Test3' Dataset
    And I see notification contains 'Test3' 'was deleted'
    And I delete 'Test2' Dataset
    And I see notification contains 'Test2' 'was deleted'
    And I delete 'Test1' Dataset
    And I see notification contains 'Test1' 'was deleted'
    Then I shouldn't see 'Test4' dataset in Dataset list
    And I shouldn't see 'Test3' dataset in Dataset list
    And I shouldn't see 'Test2' dataset in Dataset list
    And I shouldn't see 'Test1' dataset in Dataset list

  Scenario: Delete copied dataset
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
    And I click on Create Copy button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copied' pop-up status
    And I delete 'Test [Copy]' Dataset
    Then I see notification contains 'Test [Copy]' 'was deleted'
    And I shouldn't see 'Test [Copy]' dataset in Dataset list