Feature: Dataset - Views: Filter & Aggregate [small]

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I go to CoA page from data manager page
    And I click New Dataset
    And I create a New linked DataSet Dataset Test
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
    And I open 'Filter & Aggregate' in Dataset menu

  Scenario Outline: User can select default views
    When I select '<view_type>' view
    Then the Preview table should be updated
    And Data Aggregation should be unavailable for change

    Examples:
      | view_type    |
      | Yearly View  |
      | Monthly View |

  @release_run
  Scenario: User can filter view data
    When I select 'Yearly View' view
    And I add filter: 'Department Code' should be 'not equal to' '888'
    And I update view
    And the Preview table should not include '888'
    Then the Preview table should be updated

  @release_run
  Scenario Outline: User can add new view
    When I click Add New View
    And I create Dataset View <name> with <date>, <amount>, <type>, <negate_type>
    And I save New View
    Then I should see that '<name>' is appear in View list

    Examples:
      | name              | date    | amount | type   | negate_type |
      | View_Test_Monthly | Monthly | Amount | Actual | Revenues    |
      | View_Test2_Annual | Annual  | Amount | Actual | Revenues    |

  @release_run
  Scenario: User can delete a view
    When I select 'Monthly View' view
    And I click on 'Delete' button
    Then I shouldn't see that '<name>' is appear in View list

  Scenario: User can modify and update default views
    When I select 'Monthly View' view
    And I modify view name into 'New Test Name'
    And I update view
    Then I should see that 'New Test Name' is appear in View list

  Scenario: Clear View form data
    When I create Dataset View Test with Monthly, Amount, Actual, Revenues
    And I clear all view form data
    Then View form should be clear

  Scenario: Verify that Save New button disable when required field is empty
    Then I see that 'Save New' button is disable