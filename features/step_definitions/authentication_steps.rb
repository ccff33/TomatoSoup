Given /^I am a( not)? registered user$/ do |not_registered|
  @password = 'test'
  @user = User.new(:username => 'smithmachine', :first_name => 'Brian',
                   :last_name => 'Smith', :password => @password)
  if !not_registered
    @user.save!
  end
end

When /submit my registration data$/ do
  visit register_path
  fill_in 'Username', :with => @user.username
  fill_in 'First name', :with => @user.first_name
  fill_in 'Last name', :with => @user.last_name
  fill_in 'Password', :with => @password
  fill_in 'Password confirmation', :with => @password
  click_button 'Register'
end 

Then /^I should( not)? be able to login$/ do |not_able|
  steps %Q{
    When I submit my login data
  }
  step('I should' + (not_able ? ' not ' : ' ') + 'be logged in')
end 

When /submit my login data$/ do 
  visit login_path
  fill_in 'Username', :with => @user.username
  fill_in 'Password', :with => @password
  click_button 'Login'
end

Then /^I should( not)? be logged in$/ do |not_logged|
  visit root_path
  if !not_logged
    page.should have_content 'Logout'
  else
    page.should have_content 'Login'
  end
end 