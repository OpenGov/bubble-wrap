@table
Feature: Checking expand all element


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity

 
  @ORPHAN @ie
  Scenario Outline: Expand all element is present

    When I select the '<type>' report
    Then I should see that grid is expandible
    Examples:
      | type          |
      | standard      |
      | monthly       |
      | balance sheet |

