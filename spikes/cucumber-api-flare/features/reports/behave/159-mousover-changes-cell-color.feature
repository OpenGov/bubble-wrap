@ux @wip
Feature: Mousover changes cell color


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity

 
  @ORPHAN @ie
  Scenario Outline: Mousover changes

    When I select the '<type>' report
    Then I should see changed cell color
    Examples:
      | type |
      | std  |
      | mn   |
      | gr   |
      | bl   |

