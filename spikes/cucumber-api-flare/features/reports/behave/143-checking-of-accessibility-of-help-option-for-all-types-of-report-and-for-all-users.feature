Feature: Checking of accessibility of help option for all types of report and for all users

 
  @ORPHAN @help @ie
  Scenario Outline: Help option is shown for OpenGov Admin

    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I select the '<type>' report
    And I click on help drop-down
    Then The help option <step_details>
    Examples:
      | type          | step_details                   |
      | standard      | is shown                       |
      | monthly       | is shown                       |
      | grid-based    | for grid-based report is shown |
      | balance sheet | is shown                       |


  @ORPHAN @help @ie
  Scenario Outline: Help option is hidden (default value) for OpenGov Admin

    Given I am logged as an 'OpenGov Admin' in 'Ishim' entity
    When I select the '<type>' report
    Then The help option <step_details>
    Examples:
      | type          | step_details                    |
      | standard      | is hidden                       |
      | monthly       | is hidden                       |
      | grid-based    | for grid-based report is hidden |
      | balance sheet | is hidden                       |


  @ORPHAN @help
  Scenario Outline: Help option is shown for OpenGov Engineer

    Given I am logged as 'OpenGov Engineer' in 'Ishim' entity
    When I select the '<type>' report
    And I click on help drop-down
    Then The help option <step_details>
    Examples:
      | type          | step_details                   |
      | standard      | is shown                       |
      | monthly       | is shown                       |
      | grid-based    | for grid-based report is shown |
      | balance sheet | is shown                       |


  @ORPHAN @help
  Scenario Outline: Help option is hidden (default value) for OpenGov Engineer

    Given I am logged as 'OpenGov Engineer' in 'Ishim' entity
    When I select the '<type>' report
    Then The help option <step_details>
    Examples:
      | type          | step_details                    |
      | standard      | is hidden                       |
      | monthly       | is hidden                       |
      | grid-based    | for grid-based report is hidden |
      | balance sheet | is hidden                       |


  @ORPHAN @help @ie
  Scenario Outline: Help option is shown for entity_user

    Given I am logged into Ishim as an entity_user
    When I select the '<type>' report
    And I click on help drop-down
    Then The help option <step_details>
    Examples:
      | type          | step_details                   |
      | standard      | is shown                       |
      | monthly       | is shown                       |
      | grid-based    | for grid-based report is shown |
      | balance sheet | is shown                       |


  @ORPHAN @help @ie
  Scenario Outline: Help option is hidden (default value) for entity_user

    Given I am logged into Ishim as an entity_user
    When I select the '<type>' report
    Then The help option <step_details>
    Examples:
      | type          | step_details                    |
      | standard      | is hidden                       |
      | monthly       | is hidden                       |
      | grid-based    | for grid-based report is hidden |
      | balance sheet | is hidden                       |


  @ORPHAN @help @ie
  Scenario Outline: Help option is shown for entity_admin

    Given I am logged into Ishim as an entity_admin
    When I select the '<type>' report
    And I click on help drop-down
    Then The help option <step_details>
    Examples:
      | type          | step_details                   |
      | standard      | is shown                       |
      | monthly       | is shown                       |
      | grid-based    | for grid-based report is shown |
      | balance sheet | is shown                       |


  @ORPHAN @help
  Scenario Outline: Help option is hidden (default value) for entity_admin

    Given I am logged into Ishim as an entity_admin
    When I select the '<type>' report
    Then The help option <step_details>
    Examples:
      | type          | step_details                    |
      | standard      | is hidden                       |
      | monthly       | is hidden                       |
      | grid-based    | for grid-based report is hidden |
      | balance sheet | is hidden                       |

