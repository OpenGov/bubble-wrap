Feature: Pagination

  As a user I can navigate through pages of Stories using the controls at the bottom of the list.


  Background:
    Given I am an entity user

 
  @OGS-125 @COMPLETED
  Scenario: When there are more than x stories they will be broken up into pages

    Given there are pages of published stories
    When I visit stories
    Then I see the pagination UI
    And I see at least 2 pages


  @OGS-125 @COMPLETED @fix
  Scenario: The pagination UI will only be shown if there are multiple pages of results

    Given there are several stories
    When I visit stories
    Then I do not see the pagination UI


  @OGS-125 @COMPLETED
  Scenario: Different pages should have different cards (and still sorted)

    Given there are pages of published stories
    When I visit stories
    And I visit page "2" sorted by name
    Then the stories continue from page 1 to 2

