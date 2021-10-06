@register
Feature: Assure that all register features are working as expected

  Background: User is on Register Page
    Given I am on "teachable"
    And I click on "sign_up_link"

  @register_valid
  Scenario: Register a new valid user with success
    Given I fill the form with valid data
    And I click on "consent_checkbox"
    And I click on "sign_up_button"
    Then I expect to see the message "Please confirm your email to fully activate your account. You can do this by clicking the link in the email confirmation we sent you."

  @registered_user
  Scenario: Try to register an already registered user
    Given I fill the form with registered e-mail data
    And I click on "consent_checkbox"
    And I click on "sign_up_button"
    Then I expect to see the message "Email is already in use. Please log in to your account."

  @invalid_pass
  Scenario: Try to register with an invalid password
    Given I fill the form with an invalid password
    And I click on "sign_up_button"
    Then I expect to see the message "Password must be at least 6 characters"