@p1
Feature: Proposal filters
Background:
    Given I am logged into gotham as an entity_admin
    And I upload file 'gotham_dataset_big_new.csv' and create dataset by api
    And I map the data '' to COA by api
    And I go to budgets from reports page
    And I have created a '2' periods budget with 'fixed-base' adjustments and '' dataset
    And I have created a proposal via UI
    And I view the proposal
    And I create expense operation 'In Progress'
    And I view this operation
    And I make a bulk adjustment of 200
    And I done worksheet
    And I done proposal
    And I have created a proposal via UI
    And I view the proposal
    And I create expense operation 'Rejected'
    And I view this operation
    And I make a bulk adjustment of 300
    And I done worksheet
    And I submit proposal
    And I reject this proposal
    And I done proposal

  Scenario: Proposal status 'In Progress'
    And I select Line Items
    And I select proposal status 'In Progress', '', '', ''
    Then I see only selected status worksheet links


  Scenario: Proposal status 'Rejected'
    And I select Line Items
    And I select proposal status 'Rejected', '', '', ''
    Then I see only selected status worksheet links

  Scenario: No proposal statuses selected
    And I select Line Items
    And I select proposal status '', '', '', ''
    Then I see 0 worksheets

  Scenario: Proposal status 'Rejected' and 'In Progress'
    And I select Line Items
    And I select proposal status 'Rejected', 'In Progress', '', ''
    And I select an expandable line item Schools/Seminars
    Then I see only selected status worksheet links
