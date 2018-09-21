Feature: New codes Integration Test

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

  Scenario: New codes displayed correctly on Report (Departments, Funds)
    When I go to reports from dataset page
    And I create a 'Standard' report '2008' 'Yearly' for UDI
    And I setup to display Account Codes
    Then I see that Report contains correct descriptions for new Funds

  Scenario: New codes displayed correctly on Report (Departments, Funds)
    When I go to reports from dataset page
    And I create a 'Standard' report '2008' 'Yearly' for UDI
    And I setup to display Account Codes
    Then I see that Report contains correct descriptions for new Departments