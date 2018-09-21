Feature: Initiatives new

 
  @STRAT-7 @COMPLETED
  Scenario: Entity user does not see create CTA

    Given I am an entity user
    And there is a structure setup
    When I visit strategic initiatives
    Then I do not see the create CTA


  @STRAT-7 @COMPLETED
  Scenario: Entity admin create CTA

    Given I am an entity admin
    And there is a structure setup
    When I visit strategic initiatives
    And I follow the create CTA
    Then I am on the new initiative page


  @STRAT-7 @COMPLETED
  Scenario: OpenGov admin create CTA

    Given I am an OpenGov admin
    And there is a structure setup
    When I visit strategic initiatives
    And I follow the create CTA
    Then I am on the new initiative page


  @STRAT-104 @STRAT-11 @STRAT-110 @STRAT-12 @STRAT-14 @STRAT-22 @STRAT-28 @STRAT-67 @assignee:aducworth_at_opengov.com @assignee:smcleod @COMPLETED
  Scenario: Create a new initiative

    Given I am an entity admin
    And there is a structure setup
    And there are several departments
    When I add a new initiative
    Then the initiative is saved fully

