@graphs
Feature: OpenGov Admin can check reset and back button

 
  @ORPHAN
  Scenario Outline: Checking disable status back button for all reports

    When I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I select the '<report_name>' report
    Then I should see disable back button
    Examples:
      | report_name   |
      | standard      |
      | monthly       |
      | grid-based    |
      | balance sheet |


  @ORPHAN @ie
  Scenario Outline: Select legend item then check status back button for all reports

    When I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I select the '<report_name>' report
    And I click legend first item
    And I see enable back button
    And I click back button
    Then I should see disable back button
    Examples:
      | report_name   |
      | standard      |
      | monthly       |
      | grid-based    |
      | balance sheet |


  @ORPHAN @ie @copy
  Scenario Outline: Checking status back button by going forward twice for all reports

    When I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I select the '<report_name>' report
    And I click legend first item
    And I see enable back button
    And I click legend first item
    And I see enable back button
    And I click back button
    And I click back button
    Then I should see disable back button
    Examples:
      | report_name   |
      | standard      |
      | monthly       |
      | grid-based    |
      | balance sheet |

