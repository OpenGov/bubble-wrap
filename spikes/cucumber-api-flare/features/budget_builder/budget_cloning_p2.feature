Feature: Budget Cloning P2

  @p2 @APO-1716 @wip
  Scenario:  Clone a budget with operation lines more than 5000 and itemized entries
    When I am logged into harfordmd as an entity_admin
    And I go to budgets from reports page
    And I visit the budget 'FY 18 Approved Budget'
    And I search for the proposal 'golf'
    And I select the proposal 'Dogwood Trace Golf Course'
    And I select proposal Revenues tab
    And I select 'Golf Course Fees' operation
    And I add itemized entry
    And I done proposal
    And I clone a budget with 'Updated Zero Based Budget' and ''
    And I wait 240 seconds
    And I search for the clone budget
    Then the clone budget appears in the budget list

  @p2 @APO-1707 @wip
  Scenario: Clone a budget with attachment
    When I am logged into lawrenceks as an entity_admin
    And I go to budgets from reports page
    And I visit the budget '2018 Working Budget'
    And I have created a proposal via UI
    And I view the proposal
    And I add 'CoA_Cerritos_v0.xlsx' as support document
    And I done proposal
    And I clone a budget with '2018 Working Budget' and ''
    And I wait 240 seconds
    And I search for the clone budget
    Then the clone budget appears in the budget list

