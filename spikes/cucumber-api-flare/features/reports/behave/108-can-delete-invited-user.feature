@sharing
Feature: Can delete invited user

 
  @ORPHAN @ie
  Scenario Outline: Can delete invited user fom Standard/Monthly report

    Given I have a Standard report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I share report with 'Tim Timin' user
    And I remove this user
    And I close Share tab
    And I click on Share tab
    Then I shouldn't see 'Tim Timin' as a invited user
    Examples:
      | type          | name       | description |
      | Standard      | Standard_A | owner       |
      | Monthly       | Monthly_A  | owner       |
      | Balance Sheet | BS_A       | owner       |


  @ORPHAN
  Scenario: Can delete invited user from Grid-based/Balance Sheet report

    Given I have a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I share report with 'Tim Timin' user
    And I remove this user
    And I close Share tab
    And I click on Share tab
    Then I shouldn't see 'Tim Timin' as a invited user

