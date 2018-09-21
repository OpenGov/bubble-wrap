Feature: Proposal's table

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget

  @p1
  Scenario: show status 'In Progress'
    Then proposal has status 'In Progress'

  @p1
  Scenario: show status 'Submitted'
    When I view the proposal
    And I submit proposal
    Then proposal has status 'Submitted'

  @p1
  Scenario: show status 'Rejected'
    When I view the proposal
    And I submit proposal
    And I reject this proposal
    And I done proposal
    Then proposal has status 'Rejected'

  @p2
  Scenario: show status 'Resubmitted'
    When I view the proposal
    And I submit proposal
    And I reject this proposal
    And I resubmit this proposal
    Then proposal has status 'Resubmitted'

  @p1
  Scenario: show proposal's author
    When I have created a proposal via UI
    Then proposal created by default_subdomain entity_admin

  @p2
  Scenario: show 'Expense Proposal'
    When I view the proposal
    And I create expense operation ''
    And I view this operation
    And I increase bulk adjustment 1
    And I done proposal
    Then I should see this expense proposed amount in the table

  @p2
  Scenario: show 'Revenue Proposal'
    When I view the proposal
    And I create revenue operation
    And I view this operation
    And I increase bulk adjustment 1
    And I done proposal
    Then I should see this revenue proposed amount in the table
