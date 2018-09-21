Feature: Checking of accessibility of download option for all types of report


  Background:
    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity

 
  @ORPHAN @download @ie
  Scenario Outline: Download dropdown is shown on clicking

    When I select the '<type>' report
    And I click on Download button
    Then I should see download option <step_details>
    Examples:
      | type          | step_details                   |
      | standard      | elements                       |
      | monthly       | elements                       |
      | grid-based    | elements for grid-based report |
      | balance sheet | elements                       |


  @ORPHAN @download
  Scenario Outline: Download dropdown is hidden (default value)

    When I select the '<type>' report
    Then I should not see download option <step_details>
    Examples:
      | type          | step_details                   |
      | standard      | elements                       |
      | monthly       | elements                       |
      | grid-based    | elements for grid-based report |
      | balance sheet | elements                       |

