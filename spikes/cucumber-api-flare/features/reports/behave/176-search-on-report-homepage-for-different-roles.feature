Feature: Search on Report HomePage for different roles

 
  @REP-1460 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario Outline: Search by report name  in search bar

    Given I am logged <step_details> in 'sausalitoca' entity    
    And I am in report homepage
    When I search '5 Year Capital Improvement Plan' report in search bar
    Then I should see '5 Year Capital Improvement Plan' report displayed
        
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1460 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario Outline: Case insensitivity for search text

    Given I am logged <step_details> in 'sausalitoca' entity    
    And I am in report homepage
    When I search '5 YEAR CAPITAL IMPROVEMENT PLAN' report in search bar
    Then I should see '5 Year Capital Improvement Plan' report displayed
        
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1460 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario Outline: Search  report with visibility as public

    Given I am logged <step_details> in 'sausalitoca' entity    
    And I am in report homepage
    When I open list view  
    And I search for visibility option as 'Public'   
    Then I should see visibility option for report displayed as 'Public'    
        
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1460 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario Outline: Search  report with visibility as private

    Given I am logged <step_details> in 'sausalitoca' entity    
    And I am in report homepage
    When I open list view  
    And I search for visibility option as 'Private'   
    Then I should see visibility option for report displayed as 'Private'    
        
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |


  @REP-1460 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario Outline: Search  report with visibility as my organization

    Given I am logged <step_details> in 'sausalitoca' entity    
    And I am in report homepage
    When I open list view  
    And I search for visibility option as 'My Organization'   
    Then I should see visibility option for report displayed as 'My Organization'    
        
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1460 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario Outline: Search  report with visibility as network

    Given I am logged <step_details> in 'sausalitoca' entity    
    And I am in report homepage
    When I open list view  
    And I search for visibility option as 'Network'   
    Then I should see visibility option for report displayed as 'Network'    
        
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1460 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario Outline: Search  report with report owner name

    Given I am logged <step_details> in 'sausalitoca' entity    
    And I am in report homepage
    When I open list view  
    And I search for report owner as 'Charlie Francis'   
    Then I should see report owner name displayed as 'Charlie Francis'    
        
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |


  @REP-1460 @assignee:sghosh_at_opengov.com @COMPLETED
  Scenario Outline: Searching non-existent report

    Given I am logged <step_details> in 'sausalitoca' entity    
    And I am in report homepage
    When I open list view  
    When I search 'Non existing report' report in search bar
    Then I should see message:
          """
          No reports found
          """    
        
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |

