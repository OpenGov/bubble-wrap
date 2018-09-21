@release_run
Feature: Entity Roles

  Scenario: Entity Admin can edit CoA
    Given I am logged into gotham as an entity_admin
    When I go to data manager from reports page
    Then I should see edit CoA button

  Scenario: Entity Admin has search filed while editing CoA
    Given I am logged into gotham as an entity_admin
    When I go to data manager from reports page
    And I click edit CoA
    Then I should see search toolbar

  Scenario Outline: Admin can open the CoA to edit after uploading a new CoA file
    Given I am logged on as an OpenGov admin
    And Create entity by api
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click edit CoA
    And I go to '<tab>' tab
    Then I should see '<item>' column element

    Examples:
      | tab         | item                           |
      | Departments | Non-Departmental               |
      | Funds       | Capital projects funds         |
      | Expenses    | Transfers Out                  |
      | Equities    | Cash Balance Year-End Fund Tra |

  Scenario: Entity User can't edit CoA
    Given I am logged into gotham as an entity_user
    When I go to data manager from reports page
    Then I should see disabled edit CoA button

  Scenario Outline: User can't delete CoA
    Given I am logged into gotham as an <role>
    When I go to data manager from reports page
    Then I should see disabled Delete CoA button

    Examples:
      | role         |
      | entity_admin |
      | entity_user  |

  Scenario: OG Admin can delete CoA
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    When I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I rename CoA to: 'TEST_COA'
    And I complete a map for CoA columns
    And I delete CoA - 'TEST_COA'
    And I confirm CoA deletion
    Then I should see the following message on data_manager page:
      """
      Deleted CoA Chart of Account TEST_COA was deleted from the system.
      """
    And I shouldn't see CoA name: 'TEST_COA'


  Scenario: Entity Partner can create a CoA
    Given I am logged on as an Entity partner
    When I go to data manager from reports page
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I start CoA mapping
      | funds        | Funds Category, A, Funds, B, Funds Code, C                    |
      | departments  | Departments, E, Departments Code, G                           |
      | expenses     | Expenses, I, Object Type, J, Object, K, Object Code, L        |
      | revenues     | Revenues, N, Object Type, O, Object, P,Object Code, Q         |
      | assets       | Assets, S, Object Type, T, Object, U, Object Code, V          |
      | liabilities  | Liabilities, X, Object Type, Y, Object, Z, Object Code, AA    |
      | equities     | Equities, AC, Object Type, AD, Object, AE, Object Code, AF    |
      | fte_counts   | FTE Counts, AH, Object Type, AI, Object, AJ, Object Code, AK  |
    And I click 'Process'
    Then the upload completes successfully

  Scenario Outline: User can't create CoA
    Given I am logged into gotham as an <role>
    When I go to data manager from reports page
    Then I should see disabled upload CoA button

    Examples:
      | role         |
      | entity_admin |
      | entity_user  |

  @bug @QA-675
  Scenario Outline: Entity Admin can export CoA
    Given I am logged into gotham as an entity_admin
    When I go to data manager from reports page
    And I click '<type> Export' button
    Then the '<type>' export successfully exports a file

    Examples:
    | type    |
    | Flat    |
    | Outline |

  @bug @DSVC-182
  Scenario: Entity User can't export CoA
    Given I am logged into gotham as an entity_user
    When I go to data manager from reports page
    Then export buttons should be disabled