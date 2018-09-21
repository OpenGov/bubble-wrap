Feature: Buttons are disable during appending

  Scenario: Buttons are disable during appending
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked Dataset with a random name
    And Upload 'dataset_50K.xlsx' dataset file
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
    When I go to Configure created Dataset
    Then I should see buttons disable:
      | Sync with chart of accounts         |
      | Preview and edit check image fields |
      | Configure columns                   |