Feature: Benchmark Non-Linked Dataset performance

  Scenario Outline:  Upload and append file to Non-Linked Dataset
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I click New Dataset
    And I create a Dataset Test
    When Upload 'benchmark/<DS>' dataset file
    And I measure Dataset Upload time
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year  | Fiscal year |
      | Amount          | Amount      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency  |
    And I click 'Setup & Add' Mapping button
    And I measure Dataset Append time
    Then Post performance results to 'Benchmark'

    Examples:
      | DS               |
      | arizona_5K.csv   |
      | arizona_100K.csv |
      | arizona_1M.csv   |

  Scenario Outline: Upload and append multiple files to Non-Linked Dataset
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I click New Dataset
    And I create a Dataset Test
    When Upload 'benchmark/<DS>' dataset file
    And Upload 'benchmark/<DS>' dataset file
    And I measure Dataset Upload time
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year  | Fiscal year |
      | Amount          | Amount      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency  |
    And I click 'Setup & Add' Mapping button
    And I measure Dataset Append time
    Then Post performance results to 'Benchmark'

    Examples:
      | DS               |
      | arizona_5K.csv   |
      | arizona_100K.csv |
      | arizona_1M.csv   |

  Scenario: Upload and append file with multi sheets to Non-Linked Dataset
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I click New Dataset
    And I create a Dataset Test
    When Upload 'benchmark/arizona_100K_multi.xlsx' dataset file
    And I see 'Ready' status for 'arizona_100K_multi.xlsx' file in Batch
    And 'Select Sheets' button is disable
    And I select 'Sheet1' sheet from the 'arizona_100K_multi.xlsx' upload dropdown list
    And I measure Dataset Upload time
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year  | Fiscal year |
      | Amount          | Amount      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency  |
    And I click 'Setup & Add' Mapping button
    And I measure Dataset Append time
    Then Post performance results to 'Benchmark'

  Scenario: Upload and append regular file (100K) to existing Non-Linked upload
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I click New Dataset
    And I create a Dataset Test
    And Upload 'benchmark/arizona_small_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year  | Fiscal year |
      | Amount          | Amount      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency  |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I click Upload File button
    When Upload 'benchmark/arizona_100K.csv' dataset file
    And I measure Dataset Upload time
    And I click 'Add to Dataset' Mapping button
    And I measure Dataset Append time
    Then Post performance results to 'Benchmark'