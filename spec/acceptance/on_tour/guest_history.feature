@javascript
Feature: Guest history

  Scenario: Guest lists matches
    Given I am guest user
    And there was recorded a trip
    When I navigate to on tour page
    Then I should not see a column about being on tour
