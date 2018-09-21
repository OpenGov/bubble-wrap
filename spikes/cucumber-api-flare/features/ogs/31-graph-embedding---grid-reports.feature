@wip
Feature: Graph Embedding - Grid Reports


  Background:
    Given I am an entity admin
    And there is a "draft" story

 
  @OD-649 @OGS-171 @OGS-217 @OGS-220 @OGS-221 @OGS-223 @assignee:svalaer @WIP
  Scenario: Add grid reports - multi year

    Given I am on the edit story page
    When I add "Grid Report Embed Testing" reports:
      | title | description | update       |saved_view               | visualization| target_status |
      | Grid 1| line        | snapshot     | Incremental, No Target  | line         | No Target     |
      | Grid 1| bar         | snapshot     | Incremental, No Target  | bar          | No Target     |
      | Grid 1| stacked bar | snapshot     | Incremental, No Target  | stacked bar  | No Target     |
      | Grid 1| table       | snapshot     | Incremental, No Target  | table        | No Target     |
      | Grid 1| pie         | snapshot     | Incremental, No Target  | pie          | No Target     |
      | Grid 2| line        | snapshot     | Incremental, On Target  | line         | On Target     |
      | Grid 2| bar         | snapshot     | Incremental, On Target  | bar          | On Target     |
      | Grid 2| stacked bar | snapshot     | Incremental, On Target  | stacked bar  | No Target     |
      | Grid 2| table       | snapshot     | Incremental, On Target  | table        | No Target     |
      | Grid 2| pie         | snapshot     | Incremental, On Target  | pie          | No Target     |
      | Grid 3| line        | snapshot     | Incremental, Off Target | line         | Off Target    |
      | Grid 3| bar         | snapshot     | Incremental, Off Target | bar          | Off Target    |
      | Grid 3| stacked bar | snapshot     | Incremental, Off Target | stacked bar  | No Target     |
      | Grid 3| table       | snapshot     | Incremental, Off Target | table        | No Target     |
      | Grid 3| pie         | snapshot     | Incremental, Off Target | pie          | No Target     |
      | Grid 4| line        | snapshot     | Incremental, On Track   | line         | On Track      |
      | Grid 4| bar         | snapshot     | Incremental, On Track   | bar          | On Track      |
      | Grid 4| stacked bar | snapshot     | Incremental, On Track   | stacked bar  | No Target     |
      | Grid 4| table       | snapshot     | Incremental, On Track   | table        | No Target     |
      | Grid 4| pie         | snapshot     | Incremental, On Track   | pie          | No Target     |
      | Grid 5| line        | snapshot     | Cumulative, No Target   | line         | No Target     |
      | Grid 5| bar         | snapshot     | Cumulative, No Target   | bar          | No Target     |
      | Grid 5| stacked bar | snapshot     | Cumulative, No Target   | stacked bar  | No Target     |
      | Grid 5| table       | snapshot     | Cumulative, No Target   | table        | No Target     |
      | Grid 5| pie         | snapshot     | Cumulative, No Target   | pie          | No Target     |
      | Grid 6| line        | snapshot     | Cumulative, On Target   | line         | On Target     |
      | Grid 6| bar         | snapshot     | Cumulative, On Target   | bar          | On Target     |
      | Grid 6| stacked bar | snapshot     | Cumulative, On Target   | stacked bar  | No Target     |
      | Grid 6| table       | snapshot     | Cumulative, On Target   | table        | No Target     |
      | Grid 6| pie         | snapshot     | Cumulative, On Target   | pie          | No Target     |
      | Grid 7| line        | snapshot     | Cumulative, Off Target  | line         | Off Target    |
      | Grid 7| bar         | snapshot     | Cumulative, Off Target  | bar          | Off Target    |
      | Grid 7| stacked bar | snapshot     | Cumulative, Off Target  | stacked bar  | No Target     |
      | Grid 7| table       | snapshot     | Cumulative, Off Target  | table        | No Target     |
      | Grid 7| pie         | snapshot     | Cumulative, Off Target  | pie          | No Target     |
      | Grid 8| line        | snapshot     | Cumulative, On Track    | line         | On Track      |
      | Grid 8| bar         | snapshot     | Cumulative, On Track    | bar          | On Track      |
      | Grid 8| stacked bar | snapshot     | Cumulative, On Track    | stacked bar  | No Target     |
      | Grid 8| table       | snapshot     | Cumulative, On Track    | table        | No Target     |
      | Grid 8| pie         | snapshot     | Cumulative, On Track    | pie          | No Target     |
    Then I should see all the report graphs
    And all the reports details should match


  @OD-649 @assignee:svalaer @WIP
  Scenario: add grid reports- single period

    Given I am on the edit story page
    When I add "Grid Report Embed Testing" reports:
      | title | description| update       |saved_view              | visualization    |
      | Grid 1| number     | snapshot     | Single Time Period     | number           | 
      | Grid 1| stacked bar| snapshot     | Single Time Period     | stacked bar      |
      | Grid 1| table      | snapshot     | Single Time Period     | table            |
      | Grid 1| pie        | snapshot     | Single Time Period     | pie              |
    Then I should see all the report graphs
    And all the reports details should match

