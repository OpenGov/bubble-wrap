@wip
Feature: Select/Deselect All on Configure Columns

 
  @REP-1503 @assignee:pnair @COMPLETED
  Scenario Outline: All button is present

    Given I am logged <step_details> in 'sausalitoca' entity
    And I select the '5 Year Capital Improvement Plan' report
    When I open Columns Panel
    Then I should see All button
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1503 @assignee:pnair @COMPLETED
  Scenario Outline: Deselects all checkbox when all are selected

    Given I am logged <step_details> in 'sausalitoca' entity
    And I select the '5 Year Capital Improvement Plan' report
    When I open Columns Panel
    And I 'check' all the checkboxes
    And I hit All buton
    Then I should see all checkboxes are unchecked
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1503 @assignee:pnair @COMPLETED
  Scenario Outline: Selects all checkbox when anyone is deselected

    Given I am logged <step_details> in 'sausalitoca' entity
    And I select the '5 Year Capital Improvement Plan' report
    When I open Columns Panel
    And Deselect one checkbox
    And I hit All buton
    Then I should see all checkboxes are checked
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1503 @assignee:pnair @COMPLETED
  Scenario Outline: Selects all checkbox when all are deselected

    Given I am logged <step_details> in 'sausalitoca' entity
    And I select the '5 Year Capital Improvement Plan' report
    When I open Columns Panel
    And I 'uncheck' all the checkboxes
    And I hit All buton
    Then I should see all checkboxes are checked
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1503 @assignee:pnair @COMPLETED
  Scenario Outline: Default columns have no effect when deselect all

    Given I am logged <step_details> in 'sausalitoca' entity
    And I select the '5 Year Capital Improvement Plan' report
    When I open Columns Panel
    And I 'check' all the checkboxes
    And I hit All buton
    Then I should see all default columns are checked
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |

