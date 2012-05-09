Feature: Project Management

	Background:
		Given I am authenticated

	Scenario: View my projects
		Given I have a project "ProjectName" with description "ProjectDesc"
		Then I should see "ProjectName" and "ProjectDesc" on the projects page
		
	Scenario: Add a new project
		When I add a project "PName" with description "PDesc"
		Then I should see "PName" and "PDesc" on the projects page
		
	Scenario: Edit a project
		Given I have a project "ProjectName" with description "ProjectDesc"
		When I edit the project to "EditedName" with description "EditedDesc"
		Then I should see "EditedName" and "EditedDesc" on the projects page

	Scenario: Delete a project
		Given I have a project "ProjectName" with description "ProjectDesc"
		When I delete the project
		Then the projects page should be empty
