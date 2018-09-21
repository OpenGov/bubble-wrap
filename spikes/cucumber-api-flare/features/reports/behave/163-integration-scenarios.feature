@integration @wip
Feature: Integration scenarios

 
  @ORPHAN @serial @ie
  Scenario: User can mask CoA levels in the tree and the report displays only the unmasked data

    Given I am logged on as an OpenGov admin
    When I am in a 'sausalitoca' entity
    And I go to data manager from visitor_analytics page
    And I click on Manage CoA masks button
    And I create new CoA mask
    And I go to the 'Annual Balance Sheets' preview report
    And I skip welcome tour
    Then I should see only the unmasked data


  @ORPHAN @ie
  Scenario: change report data

    Given I have a Standard report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I add a data point to report data
    Then I should see this data point in report

