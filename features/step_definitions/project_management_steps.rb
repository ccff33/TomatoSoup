Given /^I am authenticated$/ do
  steps %Q{
    Given I am a registered user
    When I submit my login data
    Then I should be logged in
  }
end

Given /^I have a project "([^"]*)" with description "([^"]*)"$/ do |name, description|
  @project = Project.new(:name => name, :description => description)
  @project.user_id = @user.id
  @project.save!
end 

Then /^I should see "([^"]*)" and "([^"]*)" on the projects page$/ do |name, description|
  visit projects_path
  (page.should have_content(name)) && (page.should have_content(description))
end 

When /^I add a project "([^"]*)" with description "([^"]*)"$/ do |name, description| 
  visit new_project_path
  fill_in 'Name', :with => name
  fill_in 'Description', :with => description
  click_button 'Save'
end

When /^I edit the project to "([^"]*)" with description "([^"]*)"$/ do |name, description|
  visit edit_project_path(@project)
  fill_in 'Name', :with => name
  fill_in 'Description', :with => description
  click_button 'Save'
end

When /^I delete the project$/ do
  Capybara.current_session.driver.delete project_path(@project)
end

Then /^the projects page should be empty$/ do
  visit projects_path
  page.should_not have_css("div.item")
end

