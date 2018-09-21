Feature: Graphs Embedding


  Background:
    Given I am an entity admin
    And there is a "draft" story

 
  @OD-649 @OGS-171 @OGS-179 @assignee:svalaer @WIP
  Scenario: Graph modal opens

    Given there is a media section
    And I am on the edit story page
    When I start to add a graph
    Then I should see the graph modal


  @OGS-171 @OGS-225 @WIP @wip
  Scenario: Cancel button closes modal

    Given there is a media section
    And I am on the edit story page
    When I start to add a graph
    And I cancel adding the graph
    Then I should not see the graph modal

