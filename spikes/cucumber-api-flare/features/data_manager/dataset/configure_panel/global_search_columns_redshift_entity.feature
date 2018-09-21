@wip # redshift entity
Feature: Global-Search columns

  Background:
    Given I am logged on as an OpenGov test admin
    And I am in a 'testingvilleca' entity
    And I go to data manager from visitor_analytics page
    And I click New Dataset
    And I generate a Dataset linked to 'Arizona_CoA (Medium)' CoA
    When Upload 'arizona_small_dataset_1.xlsx' dataset file
    And I see 'Ready' status for 'arizona_small_dataset_1.xlsx' file in Batch
    And I see default rows value for 'arizona_small_dataset_1.xlsx' dataset
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal year            |
      | Financial Period | Fiscal period          |
      | Amount           | Amount                 |
      | Funds            | Fund 2 code            |
      | Departments      | Department code        |
      | Object           | Category level 3 code  |
      | Appropriation    | Appropriation 1 code   |
      | SubFund          | SubFund#               |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency  |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added

  Scenario: Toggle is avaialbe
    When I go to Configure created Dataset
    And I select Configure columns on Dataset configure option
    Then I see 'Searchable' field

  Scenario: Toggle should only be enabled on 'Text Field'
    When I go to Configure created Dataset
    And I select Configure columns on Dataset configure option
    Then I see 'Searchable' field only for 'Text Field'

  Scenario: The distinct number should appear on the bottom of the text field with smaller font
    When I go to Configure created Dataset
    And I select Configure columns on Dataset configure option
    Then I see distinct number on the bottom of the text field

  Scenario: There are 5 fields: checkbox for visibility, original name, display name, type and search toggle
    When I go to Configure created Dataset
    And I select Configure columns on Dataset configure option
    Then I see 'Checkbox' field
    And I see 'Column name' field
    And I see 'Display name' field
    And I see 'Type' field
    And I see 'Searchable' field

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
      | Fund 1 name |
      | Fund 2 name |
    And I save configuration changes
    And I wait 30 seconds
    And I go to reports from data_manager page
    And I open newly created report for 'Arizona_CoA (Medium)' CoA
    Then I should not see hidden columns in report table
      | Fund 1 name |
      | Fund 2 name |

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
      | Fund 1 name | Fund 1 new name |
      | Fund 2 name | Fund 2 new name |
    And I save configuration changes
    And I wait 30 seconds
    And I go to reports from data_manager page
    And I open newly created report for 'Arizona_CoA (Medium)' CoA
    Then I should see new columns names in report table
      | Fund 1 new name |
      | Fund 2 new name |

  Scenario: User should be able to set searchability
    When I go to Configure created Dataset
    And I select Configure columns on Dataset configure option
    And I make columns searchable
      | Fund 1 name |
    And I save configuration changes
    And I wait 30 seconds
    And I go to reports from data_manager page
    And I begin to create a 'Grid-based' report
    And I select created dataset
    And I fill in the report information
    And I create the report
    And I see default report table data
    And I search for 'GENERAL FUND' data
    Then I should see this data in report table
