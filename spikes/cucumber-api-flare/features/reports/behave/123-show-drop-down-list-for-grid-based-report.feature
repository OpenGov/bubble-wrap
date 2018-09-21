@filters @ie @fix
Feature: Show drop-down list for Grid-based Report

 
  @ORPHAN @filters @ie
  Scenario Outline: Show drop-down list items for Grid-based report

    Given I have a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    Then I should see '<item>'
    Examples:
      | item              |
      | CheckNbr          |
      | Fin Period        |
      | Fin Yr            |
      | InvoiceAmount ($) |


  @ORPHAN @filters
  Scenario Outline: Select Show drop-down list items change data in Standard report

    Given I have a Grid report using the "Test999" transaction dataset in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report
    And I see default report table data
    And I select '<item>' from Amount Type filter
    Then I should see '<item>' data in report
    Examples:
      | item              |
      | CheckNbr          |
      | Fin Period        |
      | Fin Yr            |
      | InvoiceAmount ($) |

