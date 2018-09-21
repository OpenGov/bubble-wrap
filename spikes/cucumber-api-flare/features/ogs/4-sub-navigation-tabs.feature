Feature: Sub-navigation tabs

  Drafts | Publish | Templates tabs functionality and Templates only visible to OpenGov admins

 
  @OGS-119 @assignee:hadam_at_opengov.com @COMPLETED
  Scenario: "Templates" visible to OpenGov admin

    Given I am an OpenGov admin
    When I visit stories
    Then I see the templates tab


  @OGS-119 @assignee:hadam_at_opengov.com @COMPLETED
  Scenario: "Templates" hidden to entity admin

    Given I am an entity admin
    When I visit stories
    Then I do not see the templates tab


  @OGS-119 @assignee:hadam_at_opengov.com @COMPLETED
  Scenario: "Templates" hidden to entity user

    Given I am an entity user
    When I visit stories
    Then I do not see the templates tab


  @OGS-119 @assignee:hadam_at_opengov.com @COMPLETED
  Scenario: "Drafts" functionality

    Given I am an entity user
    And there are several stories
    When I visit stories
    And I follow the "drafts" tab
    Then I see the story cards


  @OGS-119 @assignee:hadam_at_opengov.com @COMPLETED
  Scenario: "Published" functionality

    Given I am an entity user
    And there are several stories
    When I visit stories
    And I follow the "published" tab
    Then I see the story cards


  @OGS-119 @assignee:hadam_at_opengov.com @COMPLETED @fix
  Scenario: "Templates" functionality

    Given I am an OpenGov admin
    And there are several templates
    When I visit stories
    And I follow the "templates" tab
    Then I see the story cards

