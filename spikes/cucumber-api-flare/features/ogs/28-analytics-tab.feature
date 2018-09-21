Feature: Analytics tab

  Analytics tab on stories page accessible by admins-only

 
  @OGS-395 @OGS-422 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: OpenGov admin can see analytics tab

    Given I am an OpenGov admin
    And there is a Google Analytics tracking ID set
    When I go to the stories dashboard
    Then I see the analytics tab


  @OGS-395 @OGS-422 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Entity admin can see analytics tab

    Given I am an entity admin
    And there is a Google Analytics tracking ID set
    When I go to the stories dashboard
    Then I see the analytics tab


  @OGS-395 @OGS-422 @assignee:nappel_at_opengov.com @COMPLETED
  Scenario: Entity user cannot see analytics tab

    Given I am an entity user
    And there is a Google Analytics tracking ID set
    When I go to the stories dashboard
    Then I do not see the analytics tab


  @OGS-422 @COMPLETED
  Scenario: OpenGov admin cannot see analytics tab if there is no tracking ID

    Given I am an OpenGov admin
    And there is no Google Analytics tracking ID set
    When I go to the stories dashboard
    Then I do not see the analytics tab


  @OGS-422 @COMPLETED
  Scenario: Entity admin cannot see analytics tab if there is no tracking ID

    Given I am an entity admin
    And there is no Google Analytics tracking ID set
    When I go to the stories dashboard
    Then I do not see the analytics tab

