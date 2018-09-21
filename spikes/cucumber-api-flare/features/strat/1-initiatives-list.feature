Feature: Initiatives list


  Background:
    Given I am an entity admin
    And there are several departments
    And there is a structure with departments setup

 
  @STRAT-109 @STRAT-42 @assignee:aducworth_at_opengov.com @assignee:smcleod @COMPLETED
  Scenario: No initiatives

    Given there are no initiatives
    When I visit strategic initiatives
    Then I see the no initiatives found message


  @STRAT-109 @STRAT-42 @assignee:aducworth_at_opengov.com @assignee:smcleod @COMPLETED
  Scenario: Several initiatives

    Given there are several initiatives
    When I visit strategic initiatives
    Then I see all of the initiatives listed


  @STRAT-9 @COMPLETED
  Scenario: Delete confirmation modal

    Given there is an initiative
    And I am on the strategic initiatives page
    When I delete the initiative
    Then I see the delete initiative confirmation


  @STRAT-10 @COMPLETED
  Scenario: Delete initiative including confirmation

    Given there is an initiative
    And I am on the strategic initiatives page
    When I delete the initiative
    And I confirm the initiative delete prompt
    Then I do not see the initiative listed
    And the initiative is deleted


  @ORPHAN
  Scenario: Initiative Link

    Given there is an initiative
    And I am on the strategic initiatives page
    When I follow the initiative link
    Then I should be on the initiative page
    And I should see the initiative heading

