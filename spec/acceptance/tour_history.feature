Feature: On Tour History
  In order to member the history of tours
  As a user
  I want to be able to check where I have been

  Scenario: Guest user lists matches
    Given I am guest user
    And some matches has been reported
    When I visit on tour page
    Then I should not see a column about being on tour

  Scenario: Regular user lists matches
    Given I am signed in user
    And some matches has been reported
    When I visit on tour page
    Then I should see a column about being on tour
