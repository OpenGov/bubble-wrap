@view
Feature: Entity user can see saved view

 
  @ORPHAN @ie
  Scenario: Saved views are available for the user

    Given I am logged into sausalitoca as an entity_user
    And I select the 'Annual Balance Sheets' report
    When I go to Views
    And I select view - 'Statement of Assets'
    Then I should see this view

