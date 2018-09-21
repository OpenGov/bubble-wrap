@grid_report @p1
Feature: Check Image Option

 
  @ES-3534 @REP-1174 @assignee:whuang @version:18.4.2 @OPEN
  Scenario: Check Details - Postgres

    Given I am logged into alphatestal as an entity_admin
    And I select the 'Grid transaction linkage' report
    When I enable the check image option
    And I select the check image option
    Then I see an image of a check


  @ES-3534 @REP-1174 @assignee:whuang @version:18.4.2 @OPEN @ie @fix
  Scenario: Check Details - West Virginia

    Given I am logged into aprilreleasetest as an entity_admin
    And I create 'Grid-based' report with 'WV Check Image' dataset
    When I enable the check image option
    And I select the check image option
    Then I see an image of a check


  @ES-3681 @assignee:chad.miller_at_opengov.com @ORPHAN @wip
  Scenario: Questions about this payment

    Given I am logged into alphatestal as an entity_admin
    And I select the 'Grid transaction linkage' report
    When I enable the check image option
    And I select the check image option
    And I select Questions about this payment
    Then I see the contact modal

