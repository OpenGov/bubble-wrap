Feature: Sorting reports on homepage for different roles

 
  @REP-1469 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario Outline: Sort report ascending alphabatically (A-Z)

    Given I am logged <step_details> in 'Tobolsk' entity
    And I am in report homepage
    When I sort report 'A-Z'
    Then I should see reports are sorted in 'A-Z' order
        
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1469 @assignee:sghosh_at_opengov.com @COMPLETED @Homepage_legecy @v1
  Scenario Outline: Sort report  descending alphabatically (Z-A)

    Given I am logged <step_details> in 'Tobolsk' entity
    And I am in report homepage
    When I sort report 'Z-A'
    Then I should see reports are sorted in 'Z-A' order
    
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |

