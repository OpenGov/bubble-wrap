Feature: Report reflects on coa tree changes

  Scenario: Report reflect on coa expenses new category
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | linkage_view     |
      | item2 | optimize_queries |
    And I go to data manager from settings_app page
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    # need to wrap to Upload Dataset: <Dataset_file> step
    And I click New Dataset
    And I create a New linked DataSet Test
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
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select 'Test' Transaction dataset
    And I fill in the report information
    And I create the report
    And I wait 10 minutes
    And I refresh report page
    And I scroll to 'Expenses' column
    And I see default report table data
    And I go to data manager from report_view page
    And I click edit CoA
    And I go to 'Expenses' tab
    And I add new level for 'Object Type' column
    And I save changes
    And  I wait 10 minutes
    And I go to reports from data_manager page
    And I select recently created report
    Then I should see 'New Level' column in Grid table
    And I should see the following diffs in reports

  @bug #Look at DI-721
  Scenario: Report reflect on coa revenues new category
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I go to settings from data_manager page
    And I open 'General' settings tab
    And I enable the following feature flags
      | item1 | linkage_view     |
      | item2 | optimize_queries |
    And I go to data manager from settings_app page
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    # need to wrap to Upload Dataset: <Dataset_file> step
    And I click New Dataset
    And I create a New linked DataSet Test
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
    And I click 'Setup & Add' Mapping button
    And 'dataset_upl.csv' dataset should have 'Added' status
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select 'Test' Transaction dataset
    And I fill in the report information
    And I create the report
    And I wait 7 minutes
    And I see default report table data
    And I go to data manager from report_view page
    And I click edit CoA
    And I go to 'Revenues' tab
    And I add new level for 'Object Type' column
    And I save changes
    And  I wait 10 minutes
    And I go to reports from data_manager page
    And I select recently created report
    Then I should see 'New Level' column in Grid table
    And I should see the following diffs in reports

