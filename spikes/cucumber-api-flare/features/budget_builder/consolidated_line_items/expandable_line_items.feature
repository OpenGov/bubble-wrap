@p1
Feature: Expandable line items
  Background:
    Given I am logged into gotham as an entity_admin
    And I upload file 'gotham_dataset_big_new.csv' and create dataset by api
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
    And I make a amount adjustment of 739 to the 5th account strings
    And I add an itemized entry amount 88729
    And I remove the 7th account string
    And I done worksheet
    And I submit proposal
    And I select Line Items

    # Because it take quite a few steps to set up the test scenarios below, I combined them together as one scenario

  Scenario: Expandable line item check: calculation, line item links
    # Scenario: Verify expandable line items adjustment amount is correct
    When I select an expandable line item Schools/Seminars
    Then The consolidated adjustment amount is sum of all adjustments from line items and itemized line

    # Scenario: Verify expandable line items proposed amount is correct
    And I select an expandable line item ARREST EXPENSE
    Then The consolidated adjustment amount is sum of base and adjustment amount

# Save this background for debugging
#    Given I am logged into gotham as an entity_admin
#    And I go to budgets from reports page
#    And I visit the budget 'My Target'
#    And I select Line Items



