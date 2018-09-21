Feature: Smoke tests for edit CoA

  Scenario: User can select column element
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click Edit CoA for 'CoA_Cerritos_v0'
    When I go to 'Expenses' tab
    And I click on 'Personnel Expense' column item
    Then I should see '1 selected' message

  Scenario: User can drag and drop elements
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click Edit CoA for 'CoA_Cerritos_v0'
    When I go to 'Funds' tab
    And I drag 'Drainage Fund' item and drop to 'CCPA Endowment Fund' position
    Then I should see the following order
      |   List                               |
      | 110 General Fund ?                   |
      | 213 Drainage Fund ?                  |
      | 112 CCPA Endowment Fund ?            |
      | 113 Earthquake Preparedness Fund ?   |
      | 115 Art In Public Places Fund ?      |

  Scenario: User can save altered CoA - Add new item
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click Edit CoA for 'CoA_Cerritos_v0'
    When I go to 'FTE Counts' tab
    And I add new 'Test Item' item to the column
    And I save changes
    Then I should see the following message on data_manager page:
      """
      Updated CoA Your CoA has been successfully updated!
      """

  Scenario Outline: User can add new column element
    Given I am logged on as an OpenGov admin
    And I am in a 'test' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click Edit CoA for 'CoA_Cerritos_v0'
    When I go to 'Departments' tab
    And I click on 'Legislative and Admin' column item
    And I add new 1 '<item>' items with '09' codes to the Departments column
    Then I should see '<item>' column element

    Examples:
      | item                         |
      | __+++##R$-9-0-000k\\\`       |
      | Некий элемент                |
      | AGhgjgkjhy@@@@Iugiuuc___2080 |