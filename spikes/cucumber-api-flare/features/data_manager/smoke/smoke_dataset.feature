Feature: Smoke tests for dataset

  Scenario: Upload linked Dataset
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    When I click New Dataset
    And I create linked dataset 'Test' to 'CoA_Cerritos_v0' CoA
    And Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I click 'Setup Later' Mapping button
    Then I see that Test is appear in Dataset list

  Scenario: Upload non-linked Dataset
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    When I click New Dataset
    And I create a New Dataset with a random name
    And Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    And I click 'Setup Later' Mapping button
    Then I should see newly created dataset in Dataset list

  Scenario: Create a DataView
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    And I click New Dataset
    And I create linked dataset 'Test' to 'CoA_Cerritos_v0' CoA
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
    And I click 'Continue' Mapping button
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I open 'Filter & Aggregate' in Dataset menu
    When I click Add New View
    And I create Dataset View View_Test_Monthly with Monthly, Amount, Actual, Revenues
    And I save New View
    Then I should see that 'View_Test_Monthly' is appear in View list

  Scenario: Create a Dataset copy
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    And I click New Dataset
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
    And I click 'Continue' Mapping button
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    When I click on Create Copy button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Continue' Mapping button
    And I click 'Create Copy' Mapping button
    And I see dataset 'Dataset Copy Created.' pop-up status

  Scenario: Delete Dataset
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    When I click New Dataset
    And I create a Dataset Deletion_Test
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
    And I click 'Continue' Mapping button
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I delete 'Deletion_Test' Dataset
    Then I see notification contains 'Deletion_Test' 'was deleted'
    And I shouldn't see 'Deletion_Test' dataset in Dataset list
