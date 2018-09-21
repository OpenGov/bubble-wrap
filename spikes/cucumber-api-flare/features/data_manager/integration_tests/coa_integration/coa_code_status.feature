Feature: CoA codes status Integration test

  Background:
    Given I am logged on as an OpenGov admin
    And Create entity by api
    And I upload a 'CoA_Cerritos_v0.xlsx' CoA file
    And I complete a map for CoA columns
    And I click New Dataset
    And I create a New linked DataSet Test
    And Upload 'dataset_upl.csv' dataset file
    And I click 'Continue' Mapping button
    And I map a Date Format to Financial Year & Period
    And I map required fields for dataset file
      | Financial Year   | Fiscal Year     |
      | Financial Period | Fiscal Period   |
      | Amount           | Amount          |
      | Funds            | Fund Code       |
      | Departments      | Department Code |
      | Object           | Object Code     |
    And I map optional fields for dataset file
      | Funds       | Fund Description       |
      | Departments | Department Description |
      | Object      | Object Description     |
    And I click 'Continue' Mapping button
    And I map required fields for dataset file
      | Amount | Currency |
    And I click 'Setup & Add' Mapping button
    And I see dataset file status as a Added

  Scenario: CoA codes in my import file should be marked used in the CoA
    When I wait 30 seconds
    And I go to CoA page from data manager page
    And I click edit CoA
    And I go to 'Funds' tab
    Then I see used code in 'Funds' column
      | item1  | 214 |
      | item2  | 510 |
      | item3  | 550 |
      | item4  | 570 |
      | item5  | 410 |
      | item6  | 931 |
      | item7  | 932 |
      | item8  | 951 |
      | item9  | 952 |
      | item10 | 922 |
    And I go to 'Departments' tab
    And I see used code in 'Departments' column
      | item1  | 511 |
      | item2  | 521 |
      | item3  | 531 |
      | item4  | 532 |
      | item5  | 541 |
      | item6  | 551 |
      | item7  | 552 |
      | item8  | 553 |
      | item9  | 561 |
      | item10 | 571 |
    And I go to 'Expenses' tab
    And I see used code in 'Object' column
      | item1  | 61010 |
      | item2  | 61020 |
      | item3  | 61050 |
      | item4  | 65010 |
      | item5  | 67085 |
      | item6  | 67190 |
      | item7  | 69010 |
      | item8  | 69011 |
      | item9  | 69012 |
      | item10 | 69013 |
    And I go to 'Revenues' tab
    And I see used code in 'Object' column
      | item1 | 41361 |
      | item2 | 41362 |
      | item3 | 41363 |
      | item4 | 41364 |
      | item5 | 41366 |
      | item6 | 41367 |
      | item7 | 41368 |
      | item8 | 41410 |

  Scenario: CoA codes should be marked unused after deletion dataset file
    When I open a Dataset property panel
    And I click Delete dataset file via property panel
    And I see dataset file status as a Deleting
    And I wait 60 seconds
    And I go to CoA page from data manager page
    And I click edit CoA
    And I go to 'Funds' tab
    Then I see unused code in 'Funds' column
      | item1  | 214 |
      | item2  | 510 |
      | item3  | 550 |
      | item4  | 570 |
      | item5  | 410 |
      | item6  | 931 |
      | item7  | 932 |
      | item8  | 951 |
      | item9  | 952 |
      | item10 | 922 |
    And I go to 'Departments' tab
    And I see unused code in 'Departments' column
      | item1  | 511 |
      | item2  | 521 |
      | item3  | 531 |
      | item4  | 532 |
      | item5  | 541 |
      | item6  | 551 |
      | item7  | 552 |
      | item8  | 553 |
      | item9  | 561 |
      | item10 | 571 |
    And I go to 'Expenses' tab
    And I see unused code in 'Object' column
      | item1  | 61010 |
      | item2  | 61020 |
      | item3  | 61050 |
      | item4  | 65010 |
      | item5  | 67085 |
      | item6  | 67190 |
      | item7  | 69010 |
      | item8  | 69011 |
      | item9  | 69012 |
      | item10 | 69013 |
    And I go to 'Revenues' tab
    And I see unused code in 'Object' column
      | item1 | 41361 |
      | item2 | 41362 |
      | item3 | 41363 |
      | item4 | 41364 |
      | item5 | 41366 |
      | item6 | 41367 |
      | item7 | 41368 |
      | item8 | 41410 |
