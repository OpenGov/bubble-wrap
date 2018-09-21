Feature: Initiatives structure

 
  @STRAT-109 @STRAT-38 @assignee:aducworth_at_opengov.com @assignee:smcleod @COMPLETED
  Scenario: Entity user does not see setup structure CTA

    Given I am an entity user
    And there is no structure setup
    When I visit strategic initiatives
    Then I do not see the setup structure CTA


  @STRAT-109 @STRAT-38 @assignee:aducworth_at_opengov.com @assignee:smcleod @COMPLETED
  Scenario: Entity admin setup structure CTA

    Given I am an entity admin
    And there is no structure setup
    When I visit strategic initiatives
    And I follow the setup structure CTA
    Then I am on the setup structure page


  @STRAT-109 @STRAT-38 @assignee:aducworth_at_opengov.com @assignee:smcleod @COMPLETED
  Scenario: OpenGov admin setup structure CTA

    Given I am an OpenGov admin
    And there is no structure setup
    When I visit strategic initiatives
    And I follow the setup structure CTA
    Then I am on the setup structure page


  @STRAT-104 @STRAT-110 @STRAT-43 @STRAT-44 @STRAT-45 @STRAT-46 @assignee:aducworth_at_opengov.com @assignee:smcleod @OPEN
  Scenario: Setup initiative structure

    Given I am an entity admin
    And there is no structure setup
    When I setup the initiative structure
    Then the initiative structure is saved fully


  @ORPHAN
  Scenario: Setup departments within structure

    Given I am an entity admin
    And there are no departments
    And there is a structure setup
    When I setup the initiative structure departments
    Then the departments are saved fully

