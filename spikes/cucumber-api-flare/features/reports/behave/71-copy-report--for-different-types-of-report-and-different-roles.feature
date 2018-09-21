Feature: Copy Report  for different types of report and different roles

 
  @ORPHAN @copy @view @ie
  Scenario Outline: Create Copy option available_OpenGovAdmin

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I select the '<type>' report
    When I click on create copy button
    Then The create copy option <step_details>
    Examples:
      | type | step_details |
      | std  | is available |
      | mn   | is available |
      | bl   | is available |


  @ORPHAN @copy @ie
  Scenario Outline: Create a copy of  report_OpenGovAdmin

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I select the '<type>' report
    When I create a copy of the report
    And I should see the report has been created
    And I delete created report
    Then I <step_details> deleted report
    Examples:
      | type | step_details |
      | std  | don't see    |
      | mn   | don't see    |
      | bl   | don't see    |


  @ORPHAN @copy
  Scenario Outline: Create Copy option available_EntityAdmin

    Given I am logged into Tobolsk as an entity_admin
    And I select the '<type>' report
    When I click on create copy button
    Then The create copy option <step_details>
    Examples:
      | type | step_details |
      | std  | is available |
      | mn   | is available |
      | bl   | is available |


  @ORPHAN @copy
  Scenario Outline: Create a copy of Report_EntityAdmin

    Given I am logged into Tobolsk as an entity_admin
    And I select the '<type>' report
    When I create a copy of the report
    And I should see the report has been created
    And I delete created report
    Then I <step_details> deleted report
    Examples:
      | type | step_details |
      | std  | don't see    |
      | mn   | don't see    |
      | bl   | don't see    |


  @ORPHAN @copy
  Scenario Outline: Create Copy option not available_EntityUser

    Given I am logged into Tobolsk as an entity_user
    When I select the '<type>' report
    Then The create copy option <step_details>
    Examples:
      | type | step_details     |
      | std  | is not available |
      | mn   | is not available |
      | bl   | is not available |


  @ORPHAN @copy
  Scenario Outline: Create Copy option not available_OpengovEngineer

    Given I am logged as 'OpenGov Engineer' in 'Tobolsk' entity
    When I select the '<type>' report
    Then The create copy option <step_details>
    Examples:
      | type | step_details     |
      | std  | is not available |
      | mn   | is not available |
      | bl   | is not available |

