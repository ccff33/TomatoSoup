Feature: Authentication

	Scenario: Successful registration of a user
		Given I am a not registered user
		When I submit my registration data
		Then I should be able to login
		
	Scenario: Successful login
		Given I am a registered user
		When I submit my login data
		Then I should be logged in
		
	Scenario: Not successful login
		Given I am a not registered user
		Then I should not be able to login