@p2
Feature: Worksheet links
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


    Scenario: Worksheet link under non-expandable line item works
    When I click the worksheet for line item 'Base Pay'
    Then the worksheet is displayed

    # Scenario: Worksheet link under expandable line item works
    And I done worksheet
    And I done proposal
    And I select Line Items
    And I select an expandable line item Ammunition
    And I go to a worksheet through the link in expanded panel
    Then the worksheet is displayed

