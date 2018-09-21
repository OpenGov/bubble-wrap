Feature: Budget Cloning Smoke

  Background:
    Given I am logged into gotham as an entity_admin
    And I upload file 'gotham_dataset_big_new.csv' and create dataset by api
    And I map the data '' to COA by api
    And I go to budgets from reports page

  @smoke @bvt
  Scenario: Clone a budget with a subset of dataset
    Given I have created a '2' periods budget with 'fixed-base' adjustments and '' dataset
    And I have created a proposal via UI
    And I view the proposal
    And I add 'CoA_Cerritos_v0.xlsx' as support document
    And I can see this document
    And I create expense operation ''
    And I view this operation
    And I make a zero adjustment of 0 to the 3th account strings
    And I make a percent adjustment of 27 to the 2th account strings
    And I make a replace adjustment of 54321 to the 5th account strings
    And I make a amount adjustment of 678 to the 6th account strings
    And I make a bulk adjustment of 33
    And I done proposal
    And I upload file 'gotham_dataset_small_new.csv' and create dataset by api
    And I map the data 'SUBSET' to COA by api
    And I clone a multi-period budget
    And I set a new period name and leave a period name blank
    And I cloned a budget
    And I wait 50 seconds
    And I search for the clone budget
    And I select the clone budget
    And I visit budget settings
    And I see one new and one original period name
    And I close budget settings panel
    And I view the first proposal
    And I can see this document
    And I select proposal Expenses tab
    And I view the first operation
    Then I see some account strings base amount are zeros
      | 10-98-6024001 | 0 |
      | 27-43-6138002 | 0 |
      | 46-69-6011013 | 0 |
      | 5-60-6064003  | 0 |
      | 78-46-6211001 | 0 |
    And I see all adjustment type and amount are correct
      | 10-98-6024001   |     33 | $ |
      | 19-11-6113005   |     27 | % |
      | 24-0-6011001    | -50009 | Ø |
      | 27-43-6138002   |     33 | $ |
      | 27-60-6602043   |  54321 | ☓ |
      | 34-57-6052047   |    678 | $ |
      | 46-15-6011001   |     33 | $ |
      | 46-69-6011013   |     33 | $ |
      | 55-33-6052055   |     33 | $ |
      | 5-60-6064003    |     33 | $ |
      | 58-22-6011005   |     33 | $ |
      | 67-72-6728002   |     33 | $ |
      | 78-46-6211001   |     33 | $ |
      | 89-36-6361020   |     33 | $ |
      | 99-24-6011001   |     33 | $ |




