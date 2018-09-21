@wip
Feature: Graph Embedding - Monthly Reports


  Background:
    Given I am an entity admin
    And there is a "draft" story

 
  @OD-649 @OGS-171 @OGS-217 @OGS-218 @OGS-220 @OGS-221 @OGS-222 @assignee:svalaer @WIP
  Scenario: Add monthly budget report tiles - MoM expenses multi period

    Given I am on the edit story page
    When I add "Monthly Budget Report Example" reports:
      | title       | description      | update    | saved_view                            | visualization    |
      | Monthly 1   | gauge            | snapshot  | MoM vs. Budget, Cumulative, Expenses  | gauge            |
      | Monthly 2   | stacked bar      | snapshot  | MoM vs. Budget, Cumulative, Expenses  | stacked bar      |
      | Monthly 3   | pie              | snapshot  | MoM vs. Budget, Cumulative, Expenses  | pie              |
      | Monthly 4   | table            | snapshot  | MoM vs. Budget, Cumulative, Expenses  | table            |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP
  Scenario: Add monthly budget report tiles - YoY expenses multi period

    Given I am on the edit story page
    When I add "Monthly Budget Report Example" reports:
      | title     | description      | update    | saved_view                           | visualization    |
      | Monthly 1 | actuals          | snapshot  | YoY vs. Budget, Cumulative, Expenses | actuals          |
      | Monthly 2 | actuals vs budget| snapshot  | YoY vs. Budget, Cumulative, Expenses | actuals vs budget|
      | Monthly 3 | actuals as %     | snapshot  | YoY vs. Budget, Cumulative, Expenses | actuals as %     |
      | Monthly 4 | stacked bar      | snapshot  | YoY vs. Budget, Cumulative, Expenses | stacked bar      |
      | Monthly 5 | pie              | snapshot  | YoY vs. Budget, Cumulative, Expenses | pie              |
      | Monthly 6 | table            | snapshot  | YoY vs. Budget, Cumulative, Expenses | table            |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP @wip
  Scenario: Add monthly budget report tiles - MoM revenues multi period

    Given I am on the edit story page
    When I add "Monthly Budget Report Example" reports:
      | title     | description      | update    | saved_view                            | visualization    |
      | Monthly 1 | gauge            | snapshot  | MoM vs. Budget, Cumulative, Revenues  | gauge            |
      | Monthly 2 | stacked bar      | snapshot  | MoM vs. Budget, Cumulative, Revenues  | stacked bar      |
      | Monthly 3 | pie              | snapshot  | MoM vs. Budget, Cumulative, Revenues  | pie              |
      | Monthly 4 | table            | snapshot  | MoM vs. Budget, Cumulative, Revenues  | table            |
      | Monthly 5 | gauge            | snapshot  | MoM vs. Budget, Incremental, Revenues | line             |
      | Monthly 6 | stacked bar      | snapshot  | MoM vs. Budget, Incremental, Revenues | stacked bar      |
      | Monthly 7 | pie              | snapshot  | MoM vs. Budget, Incremental, Revenues | pie              |
      | Monthly 8 | table            | snapshot  | MoM vs. Budget, Incremental, Revenues | table            |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP
  Scenario: Add monthly non-budget report tiles - MoM expenses multi period

    Given I am on the edit story page
    When I add "Monthly Report Example" reports:
      | title     | description| update  | saved_view                 | visualization  |
      | Monthly 1 | bar        | snapshot| MoM, Cumulative, Expenses  |  bar           |
      | Monthly 2 | stacked bar| snapshot| MoM, Cumulative, Expenses  |  stacked bar   |
      | Monthly 3 | pie        | snapshot| MoM, Cumulative, Expenses  |  pie           |
      | Monthly 4 | table      | snapshot| MoM, Cumulative, Expenses  |  table         |
      | Monthly 5 | line       | snapshot| MoM, Incremental, Expenses |  line          |
      | Monthly 6 | stacked bar| snapshot| MoM, Incremental, Expenses |  stacked bar   |
      | Monthly 7 | pie        | snapshot| MoM, Incremental, Expenses |  pie           |
      | Monthly 8 | table      | snapshot| MoM, Incremental, Expenses |  table         |
    Then I should see all the report graphs
    And all the reports details should match

