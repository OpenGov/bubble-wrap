Feature: Budget Clone P1

  Background:
    Given I am logged into gotham as an entity_admin
    And I upload file 'gotham_dataset_big.csv' and create dataset by api
    And I map the data '' to COA by api
    And I go to budgets from reports page

  # can be replaced by budget_cloning_smoke
  Scenario: Clone a budget with the same dataset
    When I create a budget '' with '' dataset
    And I have created a proposal via UI
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    And I collect adjustment table data
    And I done proposal
    And I clone a budget with '' and ''
    And I wait 60 seconds
    And I search for the clone budget
    And I select the clone budget
    And I view the first proposal
    And I select proposal Expenses tab
    And I view the first operation
   Then The cloned adjustment table are identical to the origin
    And I clean up dataset

  # can be replaced by budget_cloning_smoke
  Scenario: Clone a budget with a subset of dataset
    When I create a budget '' with '' dataset
    And I have created a proposal via UI
    And I view the proposal
    And I create expense operation ''
    And I done proposal
    And I upload file 'gotham_dataset_small.csv' and create dataset by api
    And I map the data 'SUBSET' to COA by api
    And I clone a budget with a data subset
    And I wait 50 seconds
    And I search for the clone budget
    And I select the clone budget
    And I view the first proposal
    And I select proposal Expenses tab
    And I view the first operation
    Then I see some account strings base amount are zeros
      | 1-0-6011013 | 0 |
      | 1-0-6024001 | 0 |
      | 1-0-6064003 | 0 |
      | 1-0-6138002 | 0 |
      | 1-0-6211001 | 0 |
    And I clean up dataset

