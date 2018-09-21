@wip #This functionality isn't implemented. Follow DI-691
Feature: Grid reports should reflect when data is updating

  Scenario: Remove CoA column notification
    Given I am logged on as an OpenGov admin
    And Create entity by api
    # need to wrap to Upload COA:<CoA_name> step
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    # need to wrap to Upload Dataset: <Dataset_file> step
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
    And I begin to create a 'Grid-based' report
    And I select recently uploaded transaction dataset
    And I fill in the report information
    And I create the report
    And I go to data manager from report_view page
    And I click edit CoA
    And I go to 'Funds' tab
    And I delete 'Fund Category' column
    And I save changes
    And I go to reports from data_manager page
    And I select recently created report
    Then I see 'Column(s) removed from report' report pop-up

  Scenario: Remove CoA column notification - transaction_linkage enabled
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | transaction_linkage |
    And I go to data manager from settings_app page
    # need to wrap to Upload COA:<CoA_name> step
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    # need to wrap to Upload Dataset: <Dataset_file> step
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
    And I begin to create a 'Grid-based' report
    And I select recently uploaded transaction dataset
    And I fill in the report information
    And I create the report
    And I go to data manager from report_view page
    And I click edit CoA
    And I go to 'Funds' tab
    And I delete 'Fund Category' column
    And I save changes
    And I go to reports from data_manager page
    And I select recently created report
    Then I see 'Column(s) removed from report' report pop-up
