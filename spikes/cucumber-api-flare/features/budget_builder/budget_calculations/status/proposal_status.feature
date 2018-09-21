@accurate
Feature: Budget Calculations

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal

  @bvt
  Scenario: Proposal summary sanity check - expense
    When I create expense operation ''
    Then summary base 'expenses' amount equals table base amount

  @bvt
  Scenario: Proposal summary sanity check - revenues
    When I create revenue operation
    Then summary base 'revenues' amount equals table base amount

  @p1
  Scenario: Proposal status for a proposal with - expense operation
    When I create expense operation ''
    And I view this operation
    And I see default status values on 'new_proposal' page
    And I make a bulk adjustment of -1
    Then I should see updated status values on 'new_proposal' page

  @p1
  Scenario: Proposal status for a proposal with + expense operation
    When I create expense operation ''
    And I view this operation
    And I see default status values on 'new_proposal' page
    And I increase bulk adjustment 1
    Then I should see updated status values on 'new_proposal' page

  @p2
  Scenario: Proposal status for a proposal with - revenue operation
    When I create revenue operation
    And I view this operation
    And I see default status values on 'new_proposal' page
    And I make a bulk adjustment of -1
    Then I should see updated status values on 'new_proposal' page

  @p2
  Scenario: Proposal status for a proposal with + revenue operation
    When I create revenue operation
    And I view this operation
    And I see default status values on 'new_proposal' page
    And I increase bulk adjustment 1
    Then I should see updated status values on 'new_proposal' page
