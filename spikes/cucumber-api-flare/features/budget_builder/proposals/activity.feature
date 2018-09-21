Feature: Proposals Activity

  Background:
    Given I have created a budget
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I have created a proposal via UI
    And I view the proposal

  @bvt
  Scenario: Started with proposal creation
    Then I see in proposal activity:
    """
    USERNAME created proposal
    """

  @p1 @APO-2541
  Scenario: Displays creation of operations
    When I create expense operation ''
    Then I see in proposal activity:
    """
    USERNAME created worksheet
    """

  @p1
  Scenario: Displays editing of operations
    When I create expense operation ''
    And I view this operation
    And I increase bulk adjustment 1
    Then I see in proposal activity:
    """
    USERNAME bulk adjusted amounts in
    """

  @p1
  Scenario: Displays deletion of operations
    When I create expense operation ''
    And I delete this operation
    Then I see in proposal activity:
    """
    USERNAME deleted worksheet
    """

  @p2
  Scenario: Display proposal submitted
    When I submit proposal
    And I view the proposal
    Then I see in proposal activity:
    """
    USERNAME submitted this proposal
    """