@auth
Feature: Assure that all authentication features are working as expected

  Background: User is on Login Page
    Given I am on "teachable"
    And I click on "login_link"

  @valid_user
  Scenario: Access account with valid data
    Given I input my data login
    Then I expect to see My Courses list

  @invalid_user
  Scenario: Try to access account with invalid data
    Given I input an invalid user data
    Then I expect to see the message "Your email or password is incorrect."