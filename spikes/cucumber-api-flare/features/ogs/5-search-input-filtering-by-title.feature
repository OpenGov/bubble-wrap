Feature: Search input filtering by title

  Stories list filtering by title in search field


  Background:
    Given I am an entity user
    And I have the following stories:
      | title          | state     |
      | fruit and nuts | published |
      | fruit salad    | published |
      | potatoes       | published |
      | sweet potatoes | draft     |

 
  @OGS-120 @COMPLETED
  Scenario: Filter by story title

    When I visit stories
    And I search for "fruit"
    Then I should see cards:
      | title          |
      | fruit and nuts |
      | fruit salad    |
    And I should not see cards:
      | title          |
      | potatoes       |
      | sweet potatoes |


  @OGS-120 @COMPLETED
  Scenario: No search results

    When I visit stories
    And I search for "yoghurt"
    Then I should see the no search results message

