@sharing
Feature: Checking of accessibility of share option for all types of report


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity

 
  @ORPHAN @ie
  Scenario Outline: Share button is present

    When I select the '<type>' report
    Then I should see share button
    Examples:
      | type          |
      | standard      |
      | monthly       |
      | grid-based    |
      | balance sheet |


  @ORPHAN
  Scenario Outline: Share option is shown on clicking

    When I select the '<type>' report
    And I click on Share tab
    Then I should see share option by clicking
    Examples:
      | type          |
      | standard      |
      | monthly       |
      | grid-based    |
      | balance sheet |


  @ORPHAN
  Scenario Outline: Share option is hidden (default value)

    When I select the '<type>' report
    Then I should see share option as a hidden
    Examples:
      | type          |
      | standard      |
      | monthly       |
      | grid-based    |
      | balance sheet |

