Feature: Budget Calculations - Account Strings

  Background:
    Given I have created a budget
    And I have created a proposal
    And I am logged into default_subdomain as an entity_admin
    And I go to budgets from reports page
    And I visit the new budget
    And I view the proposal
    And I create expense operation for 'Water Purchases' expenses
    And I view this operation

  @bvt @ci-smoke
  Scenario: can add new account string
    When I add new account string to the top
    Then I see this string in the table

  @bvt
  Scenario: can remove account string
    When I remove the 1th account string
    Then I don't see this string in the table

  @p1
  Scenario: can't add the same new account string
    When I add new account string to the middle
    Then I see warning message

  @p2
  Scenario: can sort account strings by increase
    When I sort account strings by increase
    Then I see account strings sorted by increase

  @p2 @bug @qa462
  Scenario: can sort account strings by decrease
    When I sort account strings by decrease
    Then I see account strings sorted by decrease

  @p1 @wip
  Scenario: can add itemized entry description
    When I add an itemized entry description
    Then I see this itemized entry description in the table

  @p1
  Scenario: adding an itemized entry amount
    When I add an itemized entry amount 88729
    Then I see the amount is set in the field
    And I see the amount in adjustment field
    And I see the amount in proposed field

  @p1
  Scenario: can add new account string to the top
    When I add some description to account strings in the top:
      | 1th | line 1 |
      | 2th | line 2 |
      | 3th | line 3 |
    And I add new account string to the top
    Then I see this string in the table
    And the description of the top account string is empty
    And previous description of account strings still present:
      | 1th |        |
      | 2th | line 1 |
      | 3th | line 2 |
      | 4th | line 3 |

  @p2
  Scenario: can add new account string to the middle
    When I remove the 2th account string
    And I add some description to account strings in the top:
      | 1th | line 1 |
      | 2th | line 2 |
      | 3th | line 3 |
    And I add new account string to the middle
    Then I see this string in the table
    And the description of the middle account string is empty
    And previous description of account strings still present:
      | 1th | line 1 |
      | 2th |        |
      | 3th | line 2 |
      | 4th | line 3 |

  @p2
  Scenario: can add new account string to the bottom
    When I add some description to account strings in the bottom:
      | 1th | line 1 |
      | 2th | line 2 |
      | 3th | line 3 |
    And I add new account string to the bottom
    Then I see this string in the table
    And the description of the bottom account string is empty
    And previous description of account strings still present:
      | 1th | line 3 |
      | 2th | line 2 |
      | 3th | line 1 |
      | 4th |        |

  @p1
  Scenario: show account string segment info
    When I hover over an account string
    Then The account string segment info is not empty

