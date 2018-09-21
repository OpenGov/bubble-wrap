@portal
Feature: Transparency Portal - Visitor Analytics


  Background:
    Given I am logged into metropolis as an entity_admin
    And I go to portal from reports page

 
  @ORPHAN
  Scenario: Tooltips display when mousing over Number of Visits

    When I mousing over 'Number of Visits'
    Then I should see a tooltip text:
      """
      Average number of visits across all organizations on the OpenGov platform
      """


  @ORPHAN
  Scenario: Tooltips display when mousing over Average Visit Duration

    When I mousing over 'Average Visit Duration'
    Then I should see a tooltip text:
      """
      Average visit duration across all organizations on the OpenGov platform
      """


  @ORPHAN
  Scenario: Tooltips display when mousing over Visits Per Day

    Then I mousing over Visits Per Day and see tooltips


  @ORPHAN @fix
  Scenario Outline: Tooltips display when mousing over User Behaviour

    When I mousing over '<name>' user behaviour
    Then I should see a tooltip text:
      """
      <text>
      """
    Examples:
      | name             | text                                                                                                                                                                                            |
      | New vs Returning | A new user is a user who has visited the product only once within the time range selected. A returning user is a user who has visited the product multiple times within the time range selected |
      | Actions          | Actions are the number of interactions a user had with the product during one visit. Bounced visits are visits where a user left without any interaction with the product                       |
      | Users' Browsers  | The inner circle shows the different browsers being used by visitors. The outer circle shows a break down of those browsers by their version                                                    |


  @ORPHAN @wip
  Scenario Outline: Different ranges work

    When I press <range> Days statistic button
    Then I should see data of day <range>
    Examples:
      | range |
      | 7     |
      | 30    |
      | 90    |

