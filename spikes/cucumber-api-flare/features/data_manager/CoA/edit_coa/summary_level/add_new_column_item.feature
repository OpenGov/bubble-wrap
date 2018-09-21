@release_run
Feature: Edit CoA - Add New Column Item
  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA

  @bvt
  Scenario Outline: User can add new column element
    When I go to 'Departments' tab
    And I click on 'Health and Social Services' column item
    And I add new '<item>' item to the column
    Then I should see '<item>' column element

    Examples:
      | item                         |
      | __+++##R$-9-0-000k\\\`       |
      | Некий элемент                |
      | AGhgjgkjhy@@@@Iugiuuc___2080 |

  @bvt
  Scenario: User can create new program category (defined place)
    When I go to 'Departments' tab
    And I click on 'Health and Social Services' column item
    And I add new 'Test Category' item to the column
    Then I should see 'Test Category' column element
    And I should see the following
      | Public Safety                      |
      | Health and Social Services         |
      | Test Category ?                    |
      | Culture and Recreation             |
      | Public Works                       |
      | Community and Economic Development |
      | General Government                 |
      | Debt Service                       |
      | Business Type Activities           |
      | Capital Projects                   |
      | Non-Program                        |
      | Non-Departmental                   |

  @bvt
  Scenario Outline: User can create new column item (undefined place)
    When I add new '<item>' item to the column
    Then I should see '<item>' column element

    Examples:
      | item	       |
      | New department |
      | NEWDEPARTMENT  |
      | 1DEPARTMENT    |
