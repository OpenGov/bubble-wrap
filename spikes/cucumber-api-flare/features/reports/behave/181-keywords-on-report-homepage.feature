Feature: Keywords on Report HomePage

 
  @REP-1465 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario: Manage Keywords option is avalable for Entity Admin

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I am in report homepage
    When I open filter by keyword dropdown
    Then I should see  Manage Keywords option


  @REP-1465 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario: Entity Admin has access to Manage Keywords option

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I am in report homepage
    When I open filter by keyword dropdown
    And I open Manage Keywords option
    Then It should take to edit keyword mode


  @REP-1465 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario: Entity Admin can see EDIT link from list view

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I am in report homepage
    When I open list view
    Then I should see keywords Edit link


  @REP-1465 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario: Entity Admin from list view has access to Manage Keywords option

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I am in report homepage
    And I open list view
    When I open filter by keyword dropdown
    And I open Manage Keywords option
    Then It should take to edit keyword mode


  @REP-1465 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario: Keyword in EDIT mode is opened for entity Admin

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I am in report homepage
    And I open list view
    When I open EDIT link
    Then It should take to edit keyword mode


  @REP-1465 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario: Entity Admin can add keywords

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I am in report homepage
    And I open list view
    When I open EDIT link
    And I add a random keyword to '1K Rows Report' report
    And I save keyword
    Then I should be able to see the added keyword in '1K Rows Report' report


  @REP-1465 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario: Entity Admin can delete keywords 

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I am in report homepage
    And I open list view
    And I open EDIT link 
    And I add a random keyword to '1K Rows Report' report
    And I save keyword
    When I open EDIT link to delete a keyword of '1K Rows Report' report
    And I delete keywords of '1K Rows Report' report
    And I save keyword
    Then keyword should be deleted successfully from '1K Rows Report' report


  @REP-1465 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario: Manage Keywords option is not avalable for Entity User

    Given I am logged as 'Entity User' in 'Tobolsk' entity
    And I am in report homepage
    When I open filter by keyword dropdown
    Then I should not see Manage Keywords option


  @REP-1465 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario: Entity User should not see keywords EDIT link from list view

    Given I am logged as 'Entity User' in 'Tobolsk' entity
    And I am in report homepage
    When I open list view
    Then I should not see keywords Edit link


  @REP-1465 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario: Entity User from list view doesn't have access to Manage Keywords option

    Given I am logged as 'Entity User' in 'Tobolsk' entity
    And I am in report homepage
    And I open list view
    When I open filter by keyword dropdown
    Then I should not see Manage Keywords option

