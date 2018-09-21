@sharing
Feature: Can make invited user as a report owner

 
  @ORPHAN @ie
  Scenario Outline: Can make invited user as a owner for Standard/Monthly report

    Given I have a <type> report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I share report with 'Tim Timin' user
    And I click on 'Can View' button
    And I grant 'Assign as report owner' access
    And I confirm make owner
    And I logged out from reports page
    And I am logged as 'Entity User' in 'Tobolsk' entity
    And I select the '<created>' report
    Then I should see share button
    Examples:
      | type          | name            | description | created         |
      | Standard      | Standard_A      | owner       | Standard_A      |
      | Monthly       | Monthly_A       | owner       | Monthly_A       |
      | Balance Sheet | Balance Sheet_A | owner       | Balance Sheet_A |


  @ORPHAN
  Scenario Outline: Can make invited user as a owner for Grid-based/Balance Sheet report

    Given I have a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I share report with 'Tim Timin' user
    And I click on 'Can View' button
    And I grant 'Assign as report owner' access
    And I confirm make owner
    And I logged out from reports page
    And I am logged as 'Entity User' in 'Tobolsk' entity
    And I select the '<created>' report
    Then I should see share button
    Examples:
      | type       | step_details                  | name         | description | created      |
      | Grid-based | 'Test999' Transaction dataset | Grid-based_A | owner       | Grid-based_A |

