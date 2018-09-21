Feature: Sub-initiatives CRUD


  Background:
    Given I am an entity admin
    And there are several departments
    And there is a structure with departments setup

 
  @STRAT-25 @STRAT-50 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Create sub-initiative

    Given there is an initiative
    And I am on the strategic initiative page
    When I add a sub-initiative
    Then I see the new sub-initiative
    And the sub-initiative is saved correctly


  @STRAT-26 @STRAT-50 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Update sub-initiative

    Given there is an initiative with a sub-initiative
    And I am on the strategic initiative page
    When I update the sub-initiative details
    Then I see the updated sub-initiative
    And the sub-initiative is updated correctly


  @STRAT-27 @STRAT-49 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Delete sub-initiative

    Given there is an initiative with a sub-initiative
    And I am on the strategic initiative page
    When I remove the sub-initiative
    Then I should be on the initiative page
    And I should not see the sub-initiative

