@tab
Feature: Manipulations with report templates


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity

 
  @ORPHAN @ie
  Scenario Outline: OpenGov Admin can collapse report templates feature

    When I select collapse report templates
    Then I should not see '<type>' report template
    Examples:
      | type                     |
      | Checkbook Report         |
      | Water Consumption Report |
      | Police Runs Report       |


  @ORPHAN
  Scenario Outline: OpenGov Admin can expand report templates feature

    When I select expand report templates
    Then I should see '<type>' report template
    Examples:
      | type                     |
      | Checkbook Report         |
      | Water Consumption Report |
      | Police Runs Report       |

