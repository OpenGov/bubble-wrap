Feature: Sorting

  As a user I can toggle the sorting patterns of stories


  Background:
    Given I am an entity admin
    And there are several stories

 
  @OGS-121 @COMPLETED
  Scenario: Sort by name a-z

    When I visit stories
    And I sort a-z
    Then stories are sorted alphabetically


  @OGS-121 @COMPLETED
  Scenario: Sort by name z-a

    When I visit stories
    And I sort z-a
    Then stories are sorted reverse alphabetically

