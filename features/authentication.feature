Feature: Authentication

	Scenario: Successful registration of a user
		Given I am a not registered user
		When I go to the registration page
		And submit my registration data
		Then I should be able to login
		
	Scenario: Successful login
		Given I am a registered user
		When I go to the login page
		And submit my login data
		Then I should be logged in
		
	Scenario: Not successful login
		Given I am a not registered user
		Then I should not be able to login