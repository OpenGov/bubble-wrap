@p2
Feature: Sort Ascending Line Items table

  Background:
    Given I am logged into gotham as an entity_admin
    And I upload file 'gotham_dataset_big_new2.csv' and create dataset by api
    And I map the data '' to COA by api
    And I go to budgets from reports page
    And I have created a '2' periods budget with 'fixed-base' adjustments and '' dataset
    And I have created a proposal via UI
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    And I make a zero adjustment of 0 to the 3th account strings
    And I make a percent adjustment of 27 to the 2th account strings
    And I make a replace adjustment of 54321 to the 7th account strings
    And I make a amount adjustment of 678 to the 6th account strings
    And I done worksheet
    And I submit proposal
    And I have created a proposal via UI
    And I view the proposal
    And I create expense operation ''
    And I view this operation
    And I make a amount adjustment of 678 to the 5th account strings
    And I add an itemized entry amount 88729
    And I remove the 7th account string
    And I done worksheet
    And I submit proposal
    And I select Line Items

  #Scenario: Sort Account String column
  Scenario: Sort each column ascending
    When I 'Sort Ascending' 'Account String' column
    Then I see 'Account String' column sorted ascending

  #Scenario: Sort Account String column descending
    When I 'Sort Descending' 'Account String' column
    Then I see 'Account String' column sorted descending

  #Scenario: Sort Account String column
    When I 'Sort Ascending' 'Account String' column
    Then I see 'Account String' column sorted ascending

  #Scenario: Sort Ledger column
    When I 'Sort Ascending' 'Ledger' column
    Then I see 'Ledger' column sorted ascending

  #Scenario: Sort Base column
    When I 'Sort Ascending' 'Base' column
    Then I see 'Base' column sorted ascending

  #Scenario: Sort Adjustment column
    When I 'Sort Ascending' 'Adjustment' column
    Then I see 'Adjustment' column sorted ascending

  #Scenario: Sort Percent changed column
    When I 'Sort Ascending' '%' column
    Then I see '%' column sorted ascending

  #Scenario: Sort Proposed column
    When I 'Sort Ascending' 'Proposed' column
    Then I see 'Proposed' column sorted ascending

# Save this background for debugging
#    Given I am logged into gotham as an entity_admin
#    And I go to budgets from reports page
#    And I visit the budget 'My Target'
#    And I select Line Items