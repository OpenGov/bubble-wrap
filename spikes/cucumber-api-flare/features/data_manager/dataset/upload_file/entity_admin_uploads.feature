Feature: Upload different file formats

  Scenario: Upload different datasets with same account strings
    Given I logged as 'kkhilko+1@opengov.com' username to 'test' entity
    When I go to data manager from reports page
    And I click New Dataset
    And I create a New linked Dataset with a random name
    And Upload 'budget_dataset.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year
    And I map required fields for dataset file
      | Financial Year   | Year         |
      | Amount           | Amount       |
      | Funds            | Fund         |
      | Departments      | Dept         |
      | Object           | Account      |
      | Projects         | Project      |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount           | Currency     |
    And I click 'Continue' Mapping button
    And I click 'Setup & Add' Mapping button
    Then I see dataset file status as a Added
