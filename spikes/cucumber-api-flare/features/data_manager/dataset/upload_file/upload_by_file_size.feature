Feature: Upload different file sizes

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test

  Scenario Outline: Upload large size file
    When Upload '<file>' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Invoice_Date  |
      | Amount        | Test_Amount   |
      | Funds         | Fund          |
      | Departments   | Dept          |
      | Object        | Obj           |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Test_Amount   | Currency       |
    And I click 'Setup & Add' Mapping button
    Then I see dataset 'NEW ACCOUNT CODES FOUND' pop-up status

    Examples:
      | file                |
      | dataset_5K.xlsx     |
      | dataset_25K.xlsx    |
      | dataset_50K.xlsx    |
      | dataset_100K.xlsx   |
      | dataset_200K.xlsx   |

  Scenario: Upload empty file
    When Upload 'dataset_empty_file.xlsx' dataset file
    And I click 'Continue' Mapping button
    Then I see that mapping sheet is empty