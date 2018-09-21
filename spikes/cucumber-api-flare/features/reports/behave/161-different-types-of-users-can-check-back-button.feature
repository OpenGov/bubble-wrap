@roles @wip
Feature: Different types of users can check back button

 
  @ORPHAN @ie
  Scenario Outline: Checking disable status back button for all types of reports

    When I am logged <step_details> in 'Tobolsk' entity
    And I select the 'mn' report
    Then I should see disable back button
    Examples:
      | step_details          |
      | as an 'OpenGov Admin' |
      | as 'OpenGov Engineer' |
      | as an 'Entity Admin'  |
      | as 'Entity User'      |

