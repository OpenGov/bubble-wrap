Feature: Dataset with new codes

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_all_new_code.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Date          | Pay Date         |
      | Amount        | InvoiceAmount    |
      | Funds         | FundNbr          |
      | Departments   | DepartmentNbr    |
      | Object        | ExpenseNbr       |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | InvoiceAmount | Currency          |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a New Codes

  @release_run
  Scenario: Verify new code numbers
    When I open a Dataset property panel
    Then I see '30' new codes totals in property panel

  Scenario: New codes list display correct on property panel
    When I open a Dataset property panel
    And I open New Codes list on property panel
    And I open Funds view more codes
    Then I see a new codes in Dataset file
      | item1  | 11 |
      | item2  | 12 |
      | item3  | 20 |
      | item4  | 21 |
      | item5  | 22 |
      | item6  | 23 |
      | item7  | 24 |
      | item8  | 25 |
      | item9  | 26 |
      | item10 | 27 |
    And I go back to panel from code list
    And I open Departments view more codes
    Then I see a new codes in Dataset file
      | item1  | 132 |
      | item2  | 161 |
      | item3  | 171 |
      | item4  | 181 |
      | item5  | 215 |
      | item6  | 613 |
      | item7  | 614 |
      | item8  | 615 |
      | item9  | 622 |
      | item10 | 623 |
    And I go back to panel from code list
    And I open Account Types view more codes
    Then I see a new codes in Dataset file
      | item1  | 40001 |
      | item2  | 40002 |
      | item3  | 40003 |
      | item4  | 40004 |
      | item5  | 40005 |
      | item6  | 52040 |
      | item7  | 52160 |
      | item8  | 52710 |
      | item9  | 57310 |
      | item10 | 58150 |