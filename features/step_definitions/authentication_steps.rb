Given /^I am a( not)? registered user$/ do |not_registered|
  @user = User.new
  @user.username = 'smithmachine'
  @user.first_name = 'Brian'
  @user.last_name = 'Smith'
  @user.password = 'test'
  if !not_registered
    @user.save!
  end
end

When /^I go to (.*)$/ do |page_name|
  page_path = case page_name
  when 'the registration page' then register_path
  when 'the login page' then login_path
  end
  visit page_path
end

When /submit my registration data$/ do
  fill_in 'Username', :with => @user.username
  fill_in 'First name', :with => @user.first_name
  fill_in 'Last name', :with => @user.last_name
  fill_in 'Password', :with => @user.password
  fill_in 'Password confirmation', :with => @user.password
  click_button 'Register'
end 

Then /^I should( not)? be able to login$/ do |not_able|
  steps %Q{
    When I go to the login page
    When I submit my login data
  }
  step('I should' + (not_able ? ' not ' : ' ') + 'be logged in')
end 

When /submit my login data$/ do 
  fill_in 'Username', :with => @user.username
  fill_in 'Password', :with => @user.password
  click_button 'Login'
end

# TODO: find out why the $%#@ is not working
# determine how much time have I spent staring at 2 lines of $%#$ code
# more of a $#%@
# what am I doing with my life ???
Then /^I should( not)? be logged in$/ do |not_logged|
  visit root_path
  if !not_logged
    page.should have_content 'Logout'
  else
    page.should have_content 'Login'
  end
end 