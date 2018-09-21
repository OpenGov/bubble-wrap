Feature: Report Filters

 
  @ORPHAN @filters @ie
  Scenario Outline: Drilling down the filter for all type of reports

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I select the '<report_name>' report
    And I select Filters tab
    And I select '<show_type>' from Account Type filter
    And I see enable back button
    And I click back button
    Then I should see disable back button
    Examples:
      | report_name | show_type         |
      | std         | Revenues          |
      | bl          | Assets            |
      | mn          | Revenues          |


  @ORPHAN @filters @ie
  Scenario: Expenses and Revenues appear in Annual reports

    Given I am logged into sausalitoca as an opengov_admin
    And I go to reports from visitor_analytics page
    When I select the 'Annual Revenues and Expenses' report
    Then I should see 'Revenues vs Expenses'


  @ORPHAN @filters
  Scenario: Expenses and Revenues appear in YTD reports

    Given I am logged into anokacountymn as an opengov_admin
    And I go to reports from visitor_analytics page
    When I select the 'Year to Date (Internal)' report
    Then I should see 'Revenues vs Expenses'


  @ORPHAN @fix
  Scenario Outline: Copy of Drilling down the filter for grid reports

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I select the '<report_name>' report
    And I select Filters tab
    And I select '<show_type>' from Account Type filter
    And I see enable back button
    And I click back button
    Then I should see disable back button
    Examples:
      | report_name | show_type         |
      | gr          | Fin Yr            |

