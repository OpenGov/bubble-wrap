Feature: Filter Panel and Transactions Table

  Scenario: Transactions table shows results after filtering
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
      | item2 | linkage_view |
    And I go to data manager from settings_app page
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked Dataset with a random name
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
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to reports from data_manager page
    When I begin to create a 'Standard' report
    And I select all ledger types
    And I select all the datasets and click next
    And I fill in the report information
    And I create the report
    And I see default report table data
    And I select 'Funds' filtered by element
    And I expand 'Capital projects funds' option
    And I uncheck 'Los Cerritos Capital Projects' item
    Then I still see GL report table