Feature: Configure Panel - Configure columns

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I click New Dataset
    And I create a Dataset Test

  Scenario: Correct column code name display
    When Upload 'dataset_upl.csv' dataset file
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
    And I go to Configure Test Dataset
    And I select Configure columns on Dataset configure option
    Then I should see the correct Column name and Display name
      | Fiscal Year            | Fiscal Year            |
      | Fiscal Period          | Fiscal Period          |
      | Fund Description       | Fund Description       |
      | Fund Code              | Fund Code              |
      | Department Description | Department Description |
      | Department Code        | Department Code        |
      | Object Description     | Object Description     |
      | Object Code            | Object Code            |
      | Amount                 | Amount                 |

  Scenario: Can configure columns names
    When Upload 'dataset_existing_code.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Pay Date         |
      | Amount        | InvoiceAmount    |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency      |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I go to Configure Test Dataset
    And I select Configure columns on Dataset configure option
    And I edit display columns names
      | Fin Yr   | Financial_Year |
      | CheckNbr | Check Number   |
    Then I should see the correct Column name and Display name
      | Fin Yr   | Financial_Year |
      | CheckNbr | Check Number   |

  Scenario: By default all configure columns are checked
    When Upload 'dataset_upl.csv' dataset file
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
    And I go to Configure Test Dataset
    And I select Configure columns on Dataset configure option
    Then I should see the following configure columns are checked
      | Fiscal Year            |
      | Fiscal Period          |
      | Fund Description       |
      | Fund Code              |
      | Department Description |
      | Department Code        |
      | Object Description     |
      | Object Code            |

  Scenario: Columns Visibility Notification - Column settings updated
    When Upload 'dataset_upl.csv' dataset file
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
    And I go to Configure Test Dataset
    And I select Configure columns on Dataset configure option
    And I uncheck all column names to make unvisible
    And I save configuration changes
    Then I see dataset 'Column settings updated' pop-up status