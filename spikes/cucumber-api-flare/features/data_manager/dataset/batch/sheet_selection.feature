Feature: Batch Upload - Sheet Selection

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I click New Dataset
    And I create a Dataset Test

  Scenario: Sheet selection dropdown not appear for file with one sheet
    When Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_upl.csv' file in Batch
    Then I shouldn't see dropdown sheet selection for 'dataset_upl.csv'

  @release_run
  Scenario: Sheets display once upload is parsed
    When Upload 'dataset_multiple_sheets1.xlsx' dataset file
    And I see 'Ready' status for 'dataset_multiple_sheets1.xlsx' file in Batch
    And I open dropdown sheet selection for 'dataset_multiple_sheets1.xlsx'
    Then I should see dropdown sheet selection option
      | item1 | Sheet1 |
      | item2 | Sheet2 |
      | item3 | Sheet3 |

  @release_run
  Scenario: Sheets display for multiple uploads
    When Upload 'dataset_multiple_sheets1.xlsx' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And Upload 'dataset_multiple_sheets2.xlsx' dataset file
    And I see 'Ready' status for 'dataset_multiple_sheets1.xlsx' file in Batch
    And I open dropdown sheet selection for 'dataset_multiple_sheets1.xlsx'
    Then I should see dropdown sheet selection option
      | item1 | Sheet1 |
      | item2 | Sheet2 |
      | item3 | Sheet3 |
    And I open dropdown sheet selection for 'dataset_multiple_sheets2.xlsx'
    And I should see dropdown sheet selection option
      | item1 | Sheet_1 |
      | item2 | Sheet_2 |
      | item3 | Sheet_3 |

  @release_run
  Scenario: Some uploads with sheets some without
    When Upload 'dataset_upl.csv' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And Upload 'dataset_multiple_sheets1.xlsx' dataset file
    And I see 'Ready' status for 'dataset_multiple_sheets1.xlsx' file in Batch
    And I open dropdown sheet selection for 'dataset_multiple_sheets1.xlsx'
    Then I should see dropdown sheet selection option
      | item1 | Sheet1 |
      | item2 | Sheet2 |
      | item3 | Sheet3 |
    And I shouldn't see dropdown sheet selection for 'dataset_upl.csv'

  Scenario: Sheet selection is require for next set up step
    When Upload 'dataset_multiple_sheets1.xlsx' dataset file
    And I see 'Ready' status for 'dataset_multiple_sheets1.xlsx' file in Batch
    And 'Select Sheets' button is disable
    And I select 'Sheet1' sheet from the 'dataset_multiple_sheets1.xlsx' upload dropdown list
    And I click 'Continue' Mapping button
    Then I see dataset preview data
      | BANK OF NEW YORK MELLON TRUST COMPANY |
      | 2027                                  |

  Scenario: Upload multiple files with multiple sheets
    When Upload 'dataset_multiple_sheets1.xlsx' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And Upload 'dataset_multiple_sheets2.xlsx' dataset file
    And I see 'Ready' status for 'dataset_multiple_sheets1.xlsx' file in Batch
    And 'Select Sheets' button is disable
    And I select 'Sheet1' sheet from the 'dataset_multiple_sheets1.xlsx' upload dropdown list
    And 'Select Sheets' button is disable
    And I select 'Sheet_2' sheet from the 'dataset_multiple_sheets2.xlsx' upload dropdown list
    And I click 'Continue' Mapping button
    Then I see dataset preview data
      | BANK OF NEW YORK MELLON TRUST COMPANY |
      | 2027                                  |

  @release_run
  Scenario: Upload multiple files some with multiple sheets and some with only one
    When Upload 'dataset_multiple_sheets1.xlsx' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And Upload 'dataset_upl.csv' dataset file
    And I see 'Ready' status for 'dataset_multiple_sheets1.xlsx' file in Batch
    And 'Select Sheets' button is disable
    And I select 'Sheet1' sheet from the 'dataset_multiple_sheets1.xlsx' upload dropdown list
    Then I see the Continue button

  Scenario: Add multiple files with sheets when upload incomplete
    When Upload 'dataset_200K.xlsx' dataset file
    And I wait 2 seconds
    And I reload a DatasetMapping page
    And I see 'Upload Incomplete' status for 'dataset_200K.xlsx' file in Batch
    And Upload 'dataset_multiple_sheets1.xlsx' dataset file
    And I see dataset 'File Uploaded!' pop-up status
    And Upload 'dataset_multiple_sheets2.xlsx' dataset file
    And I see 'Ready' status for 'dataset_multiple_sheets1.xlsx' file in Batch
    And 'Select Sheets' button is disable
    And I select 'Sheet1' sheet from the 'dataset_multiple_sheets1.xlsx' upload dropdown list
    And I select 'Sheet_2' sheet from the 'dataset_multiple_sheets2.xlsx' upload dropdown list
    Then I see the Continue button

  Scenario: Use first ready upload for mapping
    When Upload 'dataset_200K.xlsx' dataset file
    And I wait 2 seconds
    And I reload a DatasetMapping page
    And Upload 'corrupt.xlsx' dataset file
    And I see 'Upload Incomplete' status for 'dataset_200K.xlsx' file in Batch
    And I see 'Parsing Error' status for 'corrupt.xlsx' file in Batch
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year     |
      | Financial Period | Fiscal Period   |
      | Amount           | Amount          |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    Then I see the Setup & Add button

  Scenario: Select one from multiple sheets before mapping
    When Upload 'dataset_multiple_sheets1.xlsx' dataset file
    And I see 'Ready' status for 'dataset_multiple_sheets1.xlsx' file in Batch
    And 'Select Sheets' button is disable
    And I select 'Sheet3' sheet from the 'dataset_multiple_sheets1.xlsx' upload dropdown list
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date   | Pay Date      |
      | Amount | InvoiceAmount |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Added
    And I see that Test is appear in Dataset list
