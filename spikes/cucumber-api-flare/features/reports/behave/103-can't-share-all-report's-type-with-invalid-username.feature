@sharing
Feature: Can't share all report's type with invalid username

 
  @ORPHAN
  Scenario Outline: Can't add invalid users to report

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I select the '<type>' report
    And I search invalid user by 'Vlad Vladov'
    Then I shouldn't invite 'Vlad Vladov' as a user
    Examples:
      | type |
      | std  |
      | mn   |
      | gr   |
      | bl   |

