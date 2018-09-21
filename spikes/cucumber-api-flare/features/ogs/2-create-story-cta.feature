Feature: Create Story CTA

  Dashboard header CTA for Entity Admins / Users

 
  @OGS-117 @COMPLETED
  Scenario: Entity user does not see create new story button

    Given I am an entity user
    When I visit stories
    Then I do not see the create new story CTA


  @OGS-117 @COMPLETED
  Scenario: Entity admin sees create new story button

    Given I am an entity admin
    When I visit stories
    Then I see the create new story CTA


  @OGS-117 @COMPLETED @fix
  Scenario: Entity admin follows New Story

    Given I am an entity admin
    When I visit stories
    And I follow Create new Story
    Then I am on the new story page

