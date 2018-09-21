Feature: CoA Masking - Sausalito entity
  Background:
    Given I am logged on as an OpenGov admin
    And I am in a 'sausalitoca' entity
    And I go to data manager from visitor_analytics page
    And I go to CoA page from data manager page
    And I click on Manage CoA masks button

  @p1 @release_run
  Scenario: Masked nodes are not used by GL reports
    When I unselect all the funds
    And I go to the 'Budget-to-Actual' preview report
    And I skip welcome tour
    Then I should see the following warning:
    """
    Your Filter Selection has no data.
    """

  @bug @SSR-87
  Scenario: Masked nodes are not used by Grid reports
    When I unselect all the funds
    And I go to the 'Transactions' preview report
    And I skip welcome tour
    Then I should see the following warning:
    """
    Your Filter Selection has no data.
    """

  @p1 @release_run
  Scenario: Masked nodes are not used by views
    When I go to the 'Budget-to-Actual' preview report
    And I skip welcome tour
    And I modify 'Show' filters to 'Revenues'
    Then I should see the masking changes

  @p2
  Scenario: Existing masks still function
    When I create new CoA mask
    And I switch to previous mask
    And I go to the 'Budget-to-Actual' preview report
    And I skip welcome tour
    Then I should see preview report

  @p2
  Scenario: Renamed masks still function
    When I create new CoA mask
    And I rename CoA mask
    And I go to the 'Budget-to-Actual' preview report
    And I skip welcome tour
    Then I should see preview report

  @bvt @release_run
  Scenario: Can hide trees
    When I check 'Enterprise Funds' checkbox
    Then I should see hid trees
      | Enterprise Funds |

  @bvt @release_run
  Scenario: Can hide types
    When I hide 'Fund Type'
    Then I should see hid trees
      | Special Revenue Funds |

  @bvt @release_run
  Scenario: Can hide nodes
    When I hide 'Funds'
    Then I should see hid trees
      | Deposits Fund |

  @bvt
  Scenario: Can roll-up children
    When I expand or collapse all
    Then I should see roll-up children

  @release_run
  Scenario: Impossible to create mask with an empty title
    When I create new CoA mask with an empty title
    Then 'Create Mask' button shouldn't be available

  @bvt
  Scenario: Can rename tree
    When I edit 'Sewer Fund' tree name as 'New Governmental Funds'
    Then I should see 'New Governmental Funds' element in a tree

  @p1 @release_run
  Scenario: Can reset changes
    When I edit 'Sewer Fund' tree name as 'New Governmental Funds'
    And I click on 'Reset' button on Masking page
    Then I should see 'Sewer Fund' element in a tree
    And I shouldn't see 'New Governmental Funds' element in a tree