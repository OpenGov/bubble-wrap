Feature: Initiatives sort


  Background:
    Given I am an entity admin
    And there are several departments
    And there is a structure with departments setup
    And there are several initiatives

 
  @STRAT-41 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Sort A-Z

    Given I am on the strategic initiatives page
    When I sort by name a-z
    Then I see initiatives sorted alphabetically


  @STRAT-41 @assignee:aducworth_at_opengov.com @COMPLETED
  Scenario: Sort Z-A

    Given I am on the strategic initiatives page
    When I sort by name z-a
    Then I see initiatives sorted reverse alphabetically

