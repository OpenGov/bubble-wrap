Feature: Grid Report Total Amount

 
  @REP-1502 @assignee:sghosh_at_opengov.com @COMPLETED @v1 @ie
  Scenario: For monetary value, total amount is displayed with currency symbol_OpenGovAdmin

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I select the 'gr' report
    When I select amount option 'InvoiceAmount ($)' from show dropdown
    Then I should see total amount with currency symbol


  @REP-1502 @assignee:sghosh_at_opengov.com @COMPLETED @v1 @ie
  Scenario: For nonmonetary value ,total amount is displayed without currency symbol_OpenGovAdmin

    Given I am logged as an 'OpenGov Admin' in 'Tobolsk' entity
    And I select the 'gr' report
    When I select amount option 'Fin Period' from show dropdown
    Then I should see total amount without currency symbol


  @REP-1502 @assignee:sghosh_at_opengov.com @COMPLETED @v1
  Scenario: For monetary value, total amount is displayed with currency symbol_EntityAdmin

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I select the 'gr' report
    When I select amount option 'InvoiceAmount ($)' from show dropdown
    Then I should see total amount with currency symbol


  @REP-1502 @assignee:sghosh_at_opengov.com @COMPLETED @v1
  Scenario: For nonmonetary value ,total amount is displayed without currency symbol_EntityAdmin

    Given I am logged as an 'Entity Admin' in 'Tobolsk' entity
    And I select the 'gr' report
    When I select amount option 'Fin Period' from show dropdown
    Then I should see total amount without currency symbol

