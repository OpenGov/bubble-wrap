@sharing
Feature: Can't share all report's type with invalid email

 
  @ORPHAN
  Scenario Outline: Can't add invalid users to report

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I select the '<type>' report
    And I search invalid user by 'vlad.vladov@opengov.com'
    Then I shouldn't invite user by invalid email - 'vlad.vladov@opengov.com'
    Examples:
      | type |
      | std  |
      | mn   |
      | gr   |
      | bl   |

