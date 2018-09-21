@p1 @grid_report @v1
Feature: Grid Report Search for different roles

 
  @REP-1505 @assignee:sghosh_at_opengov.com @COMPLETED @v1 @grid_report
  Scenario Outline: Search Textbox is shown

    Given I am logged <step_details> in 'Tobolsk' entity
    When I select the 'gr' report
    Then I should see Search textbox on grid report
        
        Examples:
          | step_details          |
          | as an 'OpenGov Admin' |
          | as 'OpenGov Engineer' |
          | as an 'Entity Admin'  |
          | as 'Entity User'      |


  @REP-1505 @assignee:sghosh_at_opengov.com @COMPLETED @v1 @grid_report
  Scenario Outline: Search button is shown

    Given I am logged <step_details> in 'Tobolsk' entity
    When I select the 'gr' report 
    Then I should see Search option on grid report
            
        Examples:
          | step_details          |
          | as an 'OpenGov Admin' |
          | as 'OpenGov Engineer' |
          | as an 'Entity Admin'  |
          | as 'Entity User'      |


  @REP-1505 @assignee:sghosh_at_opengov.com @COMPLETED @v1 @grid_report
  Scenario Outline: Back button is shown

    Given I am logged <step_details> in 'Tobolsk' entity
    When I select the 'gr' report 
    Then I should see Back option on grid report
            
        Examples:
          | step_details          |
          | as an 'OpenGov Admin' |
          | as 'OpenGov Engineer' |
          | as an 'Entity Admin'  |
          | as 'Entity User'      |


  @REP-1505 @assignee:sghosh_at_opengov.com @COMPLETED @p1 @grid_report @fix
  Scenario Outline: Reset button is shown

    Given I am logged <step_details> in 'Tobolsk' entity
    When I select the 'gr' report 
    Then I should see Reset option on grid report
            
        Examples:
          | step_details          |
          | as an 'OpenGov Admin' |
          | as 'OpenGov Engineer' |
          | as an 'Entity Admin'  |
          | as 'Entity User'      |


  @REP-1505 @assignee:sghosh_at_opengov.com @COMPLETED @p1 @grid_report
  Scenario Outline: Search result is displayed correctly

    Given I am logged <step_details> in 'Tobolsk' entity
    When I select the 'gr' report 
    And I search for 'Theater' from search bar
    Then I should see filter bubble created with 'Theater'
    And  I should see 'Theater' in search result
          
          Examples:
          | step_details          |
          | as an 'OpenGov Admin' |
          | as 'OpenGov Engineer' |
          | as an 'Entity Admin'  |
          | as 'Entity User'      |

