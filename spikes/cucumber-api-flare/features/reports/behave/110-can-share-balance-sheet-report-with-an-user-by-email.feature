@sharing
Feature: Can share Balance Sheet report with an user by email


  Background:
    Given I have a Balance Sheet report in the "Tobolsk" entity
    And I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    When I visit the report

 
  @ORPHAN
  Scenario Outline: Can share by email

    When I share report by 'vladimir.grishau+11@opengov.com' email
    And I <steps>
    Then I <step_details>
    Examples:
      | steps                      | step_details                                                    |
      | click on 'Can View' button | should be able to add this user to report as reader             |
      | click on 'Can View' button | should be able to add this user to report as admin              |
      | click on 'Can View' button | should be able to remove this user from the report              |
      | cancel sending process     | shouldn't see share panel                                       |
      | click on 'Can View' button | should be able to transfer ownership of the report to this user |

