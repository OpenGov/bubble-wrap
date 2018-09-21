Feature: Positions test
  Background:
    Given I turn on workforce feature for 'gotham' entity
    And I am logged into cloudcity as an entity_admin
    And I go to data manager from reports page
    And I click on 'Workforce Plans' on Tools panel
    And I created a workforce plan
    And I select the workforce plan
    And I upload a completed template

  Scenario: Verify a position details
    When I select a position
    Then I see poistion detail is correct

  Scenario: Verify a position's cost elements
    When I select a positon
    Then the position has all cost elements belongs to it listed

  Scenario: Proposed Personnel cost total
    When I select 'Position' tab in workforce
    Then the proposed total is sum of all positions

  Scenario: Verify a position's projected total cost
    When I select a positon
    Then I see Projected Total Cost is sum of all cost elements

  Scenario: Verify a position details
    When I select a position
    Then I see poistion detail is correct