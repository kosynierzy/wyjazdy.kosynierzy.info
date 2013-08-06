@javascript
Feature: On Tour History
  In order to remember the history of tours
  I want to be able to check group records

  Background:
    Given there are following trips:
      | Season  | Date       | Home  | Away  | Score | Type | Number |
      | 2000/01 | 2001-01-10 | Team1 | Team2 | 50:60 | PLK  | 15     |
      | 2000/01 | 2001-01-15 | Team1 | Team3 | 60:50 | PLK  | 10     |
      | 2001/02 | 2001-10-10 | Team1 | Team4 | 70:60 | PLK  | 20     |
      | 2001/02 | 2002-02-10 | Team1 | Team5 | 50:60 | PLK  | 30     |

  Scenario: Browse list
    When I navigate to on tour page
    Then I should see tour history list
