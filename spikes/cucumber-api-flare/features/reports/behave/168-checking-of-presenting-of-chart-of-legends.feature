@graphs
Feature: Checking of presenting of chart of legends


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity

 
  @ORPHAN @ie
  Scenario Outline: Chart legends are navigable

    When I select the '<report_type>' report
    And I see default list of legend items
    And I click on first legend item
    Then I should see <step_details>
    Examples:
      | report_type | step_details                 |
      | mn          | updated list of legend items |
      | std         | updated list of legend items |
      | gr          | updated list of legend items |
      | bl          | updated list of legend items |


  @ORPHAN
  Scenario Outline: Chart Assets and Liabilities legends are navigable

    When I select the '<report_type>' report
    Then I should see <step_details>
    Examples:
      | report_type | step_details                    |
      | mn          | 'Assets' legend                 |
      | std         | 'Assets' legend                 |
      | bl          | 'Assets' legend                 |
      | mn          | 'Liabilities & Equities' legend |
      | std         | 'Liabilities & Equities' legend |
      | bl          | 'Liabilities & Equities' legend |

