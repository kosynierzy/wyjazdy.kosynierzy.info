@javascript
Feature: Private history
  In order to record my own tour history
  As a user
  I want to be able to check where I have been

  Background:
    Given there are following trips:
      | Season  | Date       | Home  | Away  | Score | Type | Number | Visitor |
      | 2001/02 | 2002-02-10 | Team1 | Team5 | 50:60 | PLK  | 30     | user1   |
      | 2001/02 | 2001-10-10 | Team1 | Team4 | 70:60 | PLK  | 20     |         |
      | 2000/01 | 2001-01-15 | Team1 | Team3 | 60:50 | PLK  | 10     | user1   |
      | 2000/01 | 2001-01-10 | Team1 | Team3 | 60:50 | PLK  | 10     | user2   |
    And I am signed in as user1

  Scenario: User lists matches
    When I navigate to on tour page
    Then I should see a column about being on tour

  Scenario: User sees his tour count
    When I navigate to on tour page
    Then I should see how many times I have been on tour

  Scenario: User browses his records
    When I navigate to on tour page
    Then I should have registered presence

  Scenario: User marks presence
    When I navigate to on tour page
    And I say that I have been at game
    Then I should see a smile to that game
    And I should increase number of trips

  Scenario: User marks absence
    When I navigate to on tour page
    And I say that I have not been at game
    Then I should see a sad smile to that game
    And I should decrease number of trips
