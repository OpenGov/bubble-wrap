Feature: Benchmark Linked Dataset performance

  Scenario Outline: Upload and append file to Linked Dataset
    Given I am logged on as an OpenGov admin
    And I am in a 'pharaoh' entity
    When I go to data manager from visitor_analytics page
    And I click New Dataset
    And I generate a Dataset linked to '<CoA>' CoA
    And Upload 'benchmark/<DS>' dataset file
    And I measure Dataset Upload time
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year   | Fiscal year            |
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
    And I measure Dataset Append time
    Then Post performance results to 'Benchmark'

    Examples:
      | CoA                  | DS               |
      | Arizona_CoA (Medium) | arizona_5K.csv   |
      | Arizona_CoA (Medium) | arizona_100K.csv |
      | Arizona_CoA (Medium) | arizona_1M.csv   |

  Scenario Outline: Append Multiple files to Linked dataset
    Given I am logged on as an OpenGov admin
    And I am in a 'pharaoh' entity
    And I go to data manager from visitor_analytics page
    And I click New Dataset
    When I generate a Dataset linked to '<CoA>' CoA
    And Upload 'benchmark/<DS>' dataset file
    And Upload 'benchmark/<DS>' dataset file
    And I measure Dataset Upload time
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year   | Fiscal year            |
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
    And I measure Dataset Append time
    Then Post performance results to 'Benchmark'

    Examples:
      | CoA                  | DS               |
      | Arizona_CoA (Medium) | arizona_5K.csv   |
      | Arizona_CoA (Medium) | arizona_100K.csv |
      | Arizona_CoA (Medium) | arizona_1M.csv   |

  Scenario: Upload and append file with multi sheets to Linked Dataset
    Given I am logged on as an OpenGov admin
    And I am in a 'pharaoh' entity
    And I go to data manager from visitor_analytics page
    And I click New Dataset
    And I generate a Dataset linked to 'Arizona_CoA (Medium)' CoA
    When Upload 'benchmark/arizona_100K_multi.xlsx' dataset file
    And I see 'Ready' status for 'arizona_100K_multi.xlsx' file in Batch
    And 'Select Sheets' button is disable
    And I select 'Sheet1' sheet from the 'arizona_100K_multi.xlsx' upload dropdown list
    And I measure Dataset Upload time
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year | Fiscal year           |
      | Amount         | Amount                |
      | Funds          | Fund 2 code           |
      | Departments    | Department code       |
      | Object         | Category level 3 code |
      | Appropriation  | Appropriation 1 code  |
      | SubFund        | SubFund#              |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency  |
    And I click 'Setup & Add' Mapping button
    And I measure Dataset Append time
    Then Post performance results to 'Benchmark'

  Scenario: Upload and append regular file (100K) to existing Linked upload
    Given I am logged on as an OpenGov admin
    And I am in a 'pharaoh' entity
    And I go to data manager from visitor_analytics page
    And I click New Dataset
    And I generate a Dataset linked to 'Arizona_CoA (Medium)' CoA
    And Upload 'benchmark/arizona_small_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year | Fiscal year           |
      | Amount         | Amount                |
      | Funds          | Fund 2 code           |
      | Departments    | Department code       |
      | Object         | Category level 3 code |
      | Appropriation  | Appropriation 1 code  |
      | SubFund        | SubFund#              |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency  |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added
    And I click Upload File button
    When Upload 'benchmark/arizona_100K.csv' dataset file
    And I measure Dataset Upload time
    And I click 'Add to Dataset' Mapping button
    Then I measure Dataset Append time
    And Post performance results to 'Benchmark'