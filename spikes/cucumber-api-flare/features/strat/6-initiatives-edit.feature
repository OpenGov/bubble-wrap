Feature: Initiatives edit

  An existing initiative can be updated 


  Background:
    Given I am an entity admin
    And there are several departments
    And there is a structure with departments setup

 
  @STRAT-8 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Edit initiative link

    Given there is an initiative
    And I am on the strategic initiatives page
    When I edit the initiative
    Then I am on the edit initiative page


  @STRAT-11 @STRAT-12 @STRAT-14 @STRAT-22 @STRAT-28 @STRAT-67 @STRAT-8 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Edit initiative functionality

    Given there is an initiative
    And I am on the edit strategic initiatives page
    When I update the initiative
    Then the initiative is saved fully

