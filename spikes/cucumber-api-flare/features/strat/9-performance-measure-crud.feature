Feature: Performance Measure CRUD


  Background:
    Given I am an entity admin
    And there are several departments
    And there is a structure with departments setup
    And there is an initiative with a sub-initiative and a program

 
  @STRAT-55 @STRAT-57 @STRAT-58 @COMPLETED
  Scenario: Create measure

    Given I am on the strategic initiative page
    When I add a measure
    Then I see the new measure
    And the measure is saved correctly


  @STRAT-56 @STRAT-57 @STRAT-58 @COMPLETED
  Scenario: Update measure

    Given there is a measure
    And I am on the strategic initiative page
    When I update the measure details
    Then I see the updated measure
    And the measure is updated correctly


  @STRAT-27 @STRAT-61 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Delete measure

    Given there is a measure
    And I am on the strategic initiative page
    When I remove the measure
    Then I should be on the initiative page
    And I should not see the measure


  @STRAT-65 @COMPLETED
  Scenario: Existing measures listed

    Given there are several existing measures
    And I am on the strategic initiative page
    When I go to add a measure
    Then I see the existing measures listed as options


  @STRAT-65 @COMPLETED
  Scenario: Existing measure linked

    Given there are several existing measures
    And I am on the strategic initiative page
    When I connect to an existing measure
    Then I see the existing measure

