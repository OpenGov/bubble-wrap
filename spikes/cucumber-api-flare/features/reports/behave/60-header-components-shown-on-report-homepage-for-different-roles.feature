@Homepage_legecy @v1
Feature: Header Components shown on Report HomePage for different roles

 
  @REP-1458 @assignee:sghosh_at_opengov.com @COMPLETED @ie
  Scenario Outline:  Search Textbox is displayed

    Given I am logged <step_details> in 'Tobolsk' entity
    When I am in report homepage
    Then I should see Search textbox
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1458 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario Outline: SORT dropdown is displayed

    Given I am logged <step_details> in 'Tobolsk' entity
    When I am in report homepage    
    Then I should see sort dropdown
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1458 @assignee:sghosh_at_opengov.com @COMPLETED @ie
  Scenario Outline:  FILTER BY KEYWORD dropdown is displayed

    Given I am logged <step_details> in 'Tobolsk' entity
    When I am in report homepage
    Then I should see filter by keyword dropdown
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1458 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario Outline:  Quick Filter-"All|My reports|Shared with me"are displayed

    Given I am logged <step_details> in 'Tobolsk' entity
    When I am in report homepage
    Then I should see Quick Filters option 
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1458 @assignee:sghosh_at_opengov.com @COMPLETED @ie
  Scenario Outline: Toggle view buttons (grid view | list view) is displayed

    Given I am logged <step_details> in 'Tobolsk' entity
    When I am in report homepage
    Then I should see Toggle view buttons 
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |

