@sharing
Feature: Can change access type for Monthly report


  Background:
    Given I have a Monthly report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report

 
  @ORPHAN @ie
  Scenario Outline: Can change access type

    When I edit access link
    And I select '<selected_type>' type
    Then I should see '<visible_type>' type selected
    Examples:
      | selected_type   | visible_type    |
      | Private         | Private         |
      | My organization | My organization |
      | Network         | Network         |

