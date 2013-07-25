@javascript
Feature: Private history
  In order to record my own tour history
  As a user
  I want to be able to check where I have been

  Background:
    Given there are following trips:
      | Season  | Date       | Home  | Away  | Score | Type | Number | Visitor |
      | 2000/01 | 2001-01-10 | Team1 | Team2 | 50:60 | PLK  | 15     | user1   |
      | 2000/01 | 2001-01-15 | Team1 | Team3 | 60:50 | PLK  | 10     | user2   |
      | 2001/02 | 2001-10-10 | Team1 | Team4 | 70:60 | PLK  | 20     |         |
      | 2001/02 | 2002-02-10 | Team1 | Team5 | 50:60 | PLK  | 30     | user1   |

  Scenario: Guest user lists matches
    Given I am guest user
    When I visit on tour page
    Then I should not see a column about being on tour

  Scenario: Regular user lists matches
    Given I am signed in as user1
    When I visit on tour page
    Then I should see a column about being on tour
