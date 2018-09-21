Feature: Create Story CTA for OG admins

  Dashboard header CTA enhanced for OpenGov admins

 
  @OGS-118 @COMPLETED
  Scenario: OpenGov admin sees new story dropdown

    Given I am an OpenGov admin
    When I visit stories
    Then I see the create new story admin CTA


  @OGS-118 @COMPLETED @fix
  Scenario: OpenGov admin follows new story -> blank

    Given I am an OpenGov admin
    When I visit stories
    And I follow Start with a blank page
    Then I am on the new story page


  @OGS-118 @COMPLETED @fix
  Scenario: OpenGov admin follows new story -> template

    Given I am an OpenGov admin
    And there are several templates
    When I visit stories
    And I follow Start from an existing template
    And I choose the first template
    Then I am on the new story page


  @OGS-118 @COMPLETED
  Scenario: Entity user does not see story dropdown

    Given I am an entity user
    When I visit stories
    Then I do not see the create new story admin CTA


  @OGS-118 @COMPLETED
  Scenario: Entity admin does not see story dropdown

    Given I am an entity admin
    When I visit stories
    Then I do not see the create new story admin CTA

