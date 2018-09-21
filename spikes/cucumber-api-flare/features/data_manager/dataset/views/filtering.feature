Feature: Dataset - Views: Filtering

  @release_run
  Scenario Outline: User can filter view data
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I go to CoA page from data manager page
    And I click New Dataset
    And I create a New linked DataSet Dataset Test
    And Upload 'new_codes_bug.xlsx' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year   | Year       |
      | Amount           | Amount     |
      | Funds            | Fund       |
      | Departments      | Department |
      | Object           | Object     |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency   |
    And I click 'Setup & Add' Mapping button
    And 'new_codes_bug.xlsx' dataset should have 'Too Many Codes' status
    And I click on 'new_codes_bug.xlsx' source file
    And I click 'Ignore and add data' link in Property panel
    And I click 'Continue'
    And I see dataset file status as a New Codes
    And I open 'Filter & Aggregate' in Dataset menu
    And I select 'Yearly View' view
    And I add filter: '<column>' should be '<operator>' '<value>'
    And I update view
    Then the Preview table should be updated

    Examples:
      | column | operator     | value       |
      | Object | equal to     | NEW_OBJ_1   |
      | Object | not equal to | NEW_OBJ_2   |
      | Amount | greater than | 170000.6700 |
      | Amount | less than    | 555702.5600 |
      | Amount | at most      | 238131      |
      | Amount | at least     | 1008691     |