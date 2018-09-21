Feature: Entity user can't create a copy of report

 
  @ORPHAN @copy @ie
  Scenario: Create copy button is not available for entity user

    Given I am logged into sausalitoca as an entity_user
    When I select the 'Annual Revenues and Expenses' report
    Then I shouldn't see cloning tool button

