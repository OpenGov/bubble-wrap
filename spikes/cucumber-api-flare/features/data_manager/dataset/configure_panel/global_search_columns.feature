Feature: Global-Search columns

  Background:
    Given I am logged on as an OpenGov test admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked Dataset with a random name
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
    And I see dataset file status as a Added

  Scenario: Toggle is unavailable
    When I go to Configure created Dataset
    And I select Configure columns on Dataset configure option
    Then I don't see 'Searchable' field

  Scenario: There are 3 fields: checkbox for visibility, original name, display name
    When I go to Configure created Dataset
    And I select Configure columns on Dataset configure option
    Then I see 'Checkbox' field
    And I see 'Column name' field
    And I see 'Display name' field

  Scenario: User should be able to set the visibility
    When I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select created dataset
    And I fill in the report information
    And I create the report
    And I see default report table columns
    And I go to data manager from report_view page
    And I go to Configure created Dataset
    And I select Configure columns on Dataset configure option
    And I hide some dataset columns
      | Fiscal Year   |
      | Fiscal Period |
    And I save configuration changes
    And I wait 30 seconds
    And I go to reports from data_manager page
    And I select recently created report
    Then I should not see hidden columns in report table
      | Fiscal Year   |
      | Fiscal Period |

  Scenario: User should be able to set display name
    When I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select created dataset
    And I fill in the report information
    And I create the report
    And I see default report table columns
    And I go to data manager from report_view page
    And I go to Configure created Dataset
    And I select Configure columns on Dataset configure option
    And I edit display columns names
      | Fiscal Year   | Financial Year   |
      | Fiscal Period | Financial Period |
    And I save configuration changes
    And I wait 30 seconds
    And I go to reports from data_manager page
    And I select recently created report
    Then I should see new columns names in report table
      | Financial Year   |
      | Financial Period |
