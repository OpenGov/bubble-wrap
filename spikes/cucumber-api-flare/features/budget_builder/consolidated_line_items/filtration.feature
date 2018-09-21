@p2
Feature: Line Items table filtration and sorting

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

  #Scenario: Filtering Base column between '>= From' and '<=To'
  Scenario: Filtering each column between '>= From' and '<=To'
    When I filter 'Base' column between '20000' and '45000'
    Then I see 'Base' column only with these values

  #Scenario: Filtering Adjustment column between '>= From' and '<=To'
    And I clear the filter of 'Base' column
    When I filter 'Adjustment' column between '50' and '3500'
    Then I see 'Adjustment' column only with these values

  #Scenario: Filtering Proposed column between '>= From' and '<=To'And I clear the filter of 'Adjustment' column
    And I clear the filter of 'Adjustment' column
    When I filter 'Proposed' column between '20000' and '45000'
    Then I see 'Proposed' column only with these values

#  @bug @APO-2223
#  Scenario: Filtering Account String column by name
#    When I filter 'Account String' column by name 'Franchise'
#    Then I see 'Account String' column only with this name

#  @wip
#  Scenario: Filtering Ledger column by name 'Revenue'
#    When I filter 'Ledger' column by name 'rev'
#    Then I see 'Ledger' column only with this name

#  @wip
#  Scenario: Filtering Ledger column by name 'Expense'
#    When I filter 'Ledger' column by name 'exp'
#    Then I see 'Ledger' column only with this name

#  @APO-2504 @bug
#  Scenario: Filtering Percent changed column between '>= From' and '<=To'
#    When I filter 'Percent changed' column between '5' and '25'
#    Then I see '%' column only with these values

# Save this background for debugging
#    Given I am logged into gotham as an entity_admin
#    And I go to budgets from reports page
#    And I visit the budget 'My Target'
#    And I select Line Items



