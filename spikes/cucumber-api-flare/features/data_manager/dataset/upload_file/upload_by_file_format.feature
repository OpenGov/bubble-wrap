Feature: Upload different file formats

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test

  @release_run
  Scenario Outline: Upload .csv format file
    When Upload '<file>' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year             |
      | Financial Period | Fiscal Period           |
      | Amount           | Amount                  |
      | Funds            | Fund Code               |
      | Departments      | Department Code         |
      | Object           | Object Code             |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency                |
    And I click 'Setup & Add' Mapping button
    Then I see dataset 'File processed' pop-up status

    Examples:
      | file             |
      | dataset_upl.csv  |
      | dataset_upl.xls  |
      | dataset_upl.xlsx |

  Scenario: Upload wrong format file
    When Upload 'wrong_format.docx' dataset file
    Then I see 'files are not supported for upload' pop-up