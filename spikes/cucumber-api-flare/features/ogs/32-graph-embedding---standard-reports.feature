@wip
Feature: Graph Embedding - Standard Reports


  Background:
    Given I am an entity admin
    And there is a "draft" story

 
  @OD-649 @OGS-171 @OGS-217 @OGS-220 @OGS-221 @OGS-222 @assignee:svalaer @WIP
  Scenario: Add standard report with budget - expenses multi period

    Given I am on the edit story page
    When I add “Annual w Budget” reports:
      | title             | description  | update    | saved_view         | visualization |
      | Annual w Budget 1 | bar          | snapshot  | Expenses (Budget)  | bar           |
      | Annual w Budget 2 | stacked bar  | snapshot  | Expenses (Budget)  | stacked bar   |
      | Annual w Budget 3 | pie          | snapshot  | Expenses (Budget)  | pie           |
      | Annual w Budget 4 | table        | snapshot  | Expenses (Budget)  | table         |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP
  Scenario: Add standard report with budget - revenues multi period

    Given I am on the edit story page
    When I add “Annual w Budget” reports:
      | title             | description  | update    | saved_view         | visualization |
      | Annual w Budget 1 | bar          | snapshot  | Revenues (Budget)  | bar           |
      | Annual w Budget 2 | stacked bar  | snapshot  | Revenues (Budget)  | stacked bar   |
      | Annual w Budget 3 | pie          | snapshot  | Revenues (Budget)  | pie           |
      | Annual w Budget 4 | table        | snapshot  | Revenues (Budget)  | table         |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP
  Scenario: Add standard report - expenses multi period

    Given I am on the edit story page
    When I add “Annual” reports:
      | title    | description  | update    | saved_view          | visualization |
      | Annual 1 | bar          | snapshot  | Expenses (No Budget)| bar           |
      | Annual 2 | stacked bar  | snapshot  | Expenses (No Budget)| stacked bar   |
      | Annual 3 | pie          | snapshot  | Expenses (No Budget)| pie           |
      | Annual 4 | table        | snapshot  | Expenses (No Budget)| table         |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP
  Scenario: Add standard report - revenues multi period

    Given I am on the edit story page
    When I add “Annual” reports:
      | title    | description  | update    | saved_view          | visualization |
      | Annual 1 | bar          | snapshot  | Revenues (No Budget)| bar           |
      | Annual 2 | stacked bar  | snapshot  | Revenues (No Budget)| stacked bar   |
      | Annual 3 | pie          | snapshot  | Revenues (No Budget)| pie           |
      | Annual 4 | table        | snapshot  | Revenues (No Budget)| table         |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP
  Scenario: Add standard report - revenues vs expenses multi period

    Given I am on the edit story page
    When I add “Annual” reports:
      | title    | description  | update    | saved_view            | visualization |
      | Annual 1 | bar          | snapshot  | Revenues vs. Expenses | bar           |
      | Annual 2 | stacked bar  | snapshot  | Revenues vs. Expenses | stacked bar   |
      | Annual 3 | pie          | snapshot  | Revenues vs. Expenses | pie           |
      | Annual 4 | table        | snapshot  | Revenues vs. Expenses | table         |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP
  Scenario: Add standard report - assets multi period

    Given I am on the edit story page
    When I add “Annual” reports:
      | title    | description  | update    | saved_view | visualization |
      | Annual 1 | bar          | snapshot  | Assets     | bar           |
      | Annual 2 | stacked bar  | snapshot  | Assets     | stacked bar   |
      | Annual 3 | pie          | snapshot  | Assets     | pie           |
      | Annual 4 | table        | snapshot  | Assets     | table         |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP
  Scenario: Add standard report - liabilities & equities multi period

    Given I am on the edit story page
    When I add “Annual” reports:
      | title    | description  | update    | saved_view            | visualization |
      | Annual 1 | bar          | snapshot  | Liabilites & Equities | bar           |
      | Annual 2 | stacked bar  | snapshot  | Liabilites & Equities | stacked bar   |
      | Annual 3 | pie          | snapshot  | Liabilites & Equities | pie           |
      | Annual 4 | table        | snapshot  | Liabilites & Equities | table         |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP
  Scenario: Add standard report - balance sheet multi period

    Given I am on the edit story page
    When I add “Annual” reports:
      | title    | description  | update    | saved_view    | visualization |
      | Annual 1 | bar          | snapshot  | Balance Sheet | bar           |
      | Annual 2 | stacked bar  | snapshot  | Balance Sheet | stacked bar   |
      | Annual 3 | pie          | snapshot  | Balance Sheet | pie           |
      | Annual 4 | table        | snapshot  | Balance Sheet | table         |
    Then I should see all the report graphs
    And all the reports details should match

