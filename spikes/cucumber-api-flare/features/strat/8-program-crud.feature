Feature: Program CRUD


  Background:
    Given I am an entity admin
    And there are several departments
    And there is a structure with departments setup
    And there is an initiative with a sub-initiative

 
  @STRAT-25 @STRAT-50 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Create program

    Given I am on the strategic initiative page
    When I add a program
    Then I see the new program
    And the program is saved correctly


  @STRAT-26 @STRAT-50 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Update program

    Given there is a program
    And I am on the strategic initiative page
    When I update the program details
    Then I see the updated program
    And the program is updated correctly


  @STRAT-27 @STRAT-49 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Delete program

    Given there is a program
    And I am on the strategic initiative page
    When I remove the program
    Then I should be on the initiative page
    And I should not see the program

