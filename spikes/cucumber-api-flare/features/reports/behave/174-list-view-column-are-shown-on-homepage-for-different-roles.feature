Feature: List view column are shown on homepage for different roles

 
  @REP-1459 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1 @ie
  Scenario Outline: Report Name column is displayed 

    Given I am logged <step_details> in 'Tobolsk' entity
    And I am in report homepage
    When I open list view
    Then I should see Report Name column
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1459 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1 @ie
  Scenario Outline: Last Updated column is displayed

    Given I am logged <step_details> in 'Tobolsk' entity
    And I am in report homepage
    When I open list view
    Then I should see Last Updated column
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1459 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1 @ie
  Scenario Outline: Report Owner column is displayed

    Given I am logged <step_details> in 'Tobolsk' entity
    And I am in report homepage
    When I open list view
    Then I should see report Owner column
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1459 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1 @ie
  Scenario Outline: Visibility column is displayed

    Given I am logged <step_details> in 'Tobolsk' entity
    And I am in report homepage
    When I open list view
    Then I should see Visibility column
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1459 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1 @ie
  Scenario Outline: Keywords column is displayed 

    Given I am logged <step_details> in 'Tobolsk' entity
    And I am in report homepage
    When I open list view
    Then I should see Keywords column
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1459 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1 @ie
  Scenario Outline: User should be taken to a report from Listview

    Given I am logged <step_details> in 'Tobolsk' entity
    And I am in report homepage
    When I open list view
    And I select a report from list
    Then It should take the user to a report
        
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |

