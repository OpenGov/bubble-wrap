Feature: Edit a chart of accounts
  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'ankenyia' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click edit CoA

  @bvt @phantom
  Scenario: User can select column element
    When I go to 'Expenses' tab
    And I click on 'Personal Services' column item
    Then I should see '1 selected' message

  @p1 @phantom @release_run
  Scenario: User can surf through history
    When I go to 'Uncategorized' tab
    And I add new level
    And I choose '(Last saved state)' history
    Then I shouldn't see 'New item' column name
    And I shouldn't see 'New Level' column element

  @p2 @phantom @release_run
  Scenario: User can go to Legacy Editor
    When I click on link 'Go to Legacy Editor'
    Then I should be on 'GLEditor' page

  @p2 @phantom
  Scenario Outline: User can highlight items using category
    When I go to 'Funds' tab
    And I click on '<category>' column item
    Then I should see highlighted elements

    Examples:
      | category     |
      | Governmental |
      | Fiduciary    |

  @p2 @phantom
  Scenario Outline: User can highlight words in reverse mode
    When I go to 'Departments' tab
    And I click on '<item>' column item
    Then I should see highlighted items in '<column>'

    Examples:
      | item                  | column      |
      | Police Operations     | Departments |
      | Police Administration | Function    |