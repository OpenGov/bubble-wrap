Feature: Checking reset button mode for OpenGov Admin

 
  @ORPHAN @graphs @ie @fix
  Scenario Outline: Checking disable status reset button

    When I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I select the '<report_name>' report
    Then I should see disable reset button
    Examples:
      | report_name   |
      | standard      |
      | monthly       |
      | grid-based    |
      | balance sheet |


  @ORPHAN @graphs
  Scenario Outline: Checking enable status reset button

    When I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I select the '<report_name>' report
    And I click legend first item
    Then I should see enable reset button
    And I click reset button
    Examples:
      | report_name   |
      | standard      |
      | monthly       |
      | grid-based    |
      | balance sheet |


  @ORPHAN @graphs
  Scenario Outline: Checking status reset button by going forward twice

    When I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I select the '<report_name>' report
    And I click legend first item
    And I see enable reset button
    And I click legend first item
    And I should see enable reset button
    And I click reset button
    Then I should see disable back button
    Examples:
      | report_name   |
      | standard      |
      | monthly       |
      | grid-based    |
      | balance sheet |


  @ORPHAN @graphs @ie
  Scenario Outline: Checking enable status reset button by going forward twice

    When I am logged as an 'OpenGov Admin' in 'Ishim' entity
    And I select the '<report_name>' report
    And I click legend first item
    And I click legend first item
    Then I see enable reset button
    And I click reset button
    Examples:
      | report_name   |
      | standard      |
      | monthly       |
      | grid-based    |
      | balance sheet |

