Feature: Graph Embedding - Balance Sheet Reports


  Background:
    Given I am an entity admin
    And there is a "draft" story

 
  @OD-649 @OGS-171 @OGS-217 @OGS-220 @OGS-221 @OGS-222 @assignee:svalaer @WIP
  Scenario: Add balance sheet reports

    Given I am on the edit story page
    When I add "Balance Sheet" reports:
      | title           | description          | update   |
      | Balance Sheet 1 | first balance sheet  | snapshot |
      | Balance Sheet 2 | second balance sheet | update   |
    Then I should see all the report graphs
    And all the reports details should match

