Given /^I am not authenticated$/ do
  visit('/users/sign_out') # ensure that at least
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@user.net'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit new_user_session_path
  fill_in "Email", :with => email
  fill_in "Password", :with => password
  click_button "Log in"
end

Given /^I am a project manager on "(.+)"/ do |project_name|
  email = "testing@man.net"
  password = "asdfghjkl"
  if(!User.exists?(email: email))
    manager = User.create(email: email, password: password, manager: true)
  else
    manager = User.find_by email: email
  end
  if(!Project.exists?(name: project_name))
    Project.create(name: project_name,
                   description: "Creating a large-scale water filter system",
                   volunteer_capacity: 25, location: "Remba Island, Kenya")
  end
  project = Project.find_by name: project_name
  project.managers << manager

  visit new_user_session_path
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
end


Given /^I am a project manager$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  User.create(:email => email, :password => password, :manager => true)

  visit new_user_session_path
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
end


Given /^the following users exist:$/ do |table|
	table.hashes.each do |table_hash|
		User.new(:email => table_hash[:email], 
				 :password => table_hash[:password],
				 :first_name => table_hash[:first_name],
				 :last_name => table_hash[:last_name]).save!
	end
end

Given /^the following volunteers exist: $/ do |table|
  puts table
  pending
end

When /^I follow the project link for "(.+)"$/ do |project_name|
  click_link(project_name)
end

When(/^I select the "([^"]*)" option from the "([^"]*)" drop\-down field$/) do |arg1, arg2|
  select(arg1, from: arg2)
end

Given /^there exists a project "([^"]*)"$/ do |arg1|
  test_project = Project.create(name: arg1,
                                description: "Creating a large-scale water filter system", 
                                volunteer_capacity: 25,
                                location: "Remba Island, Kenya")
  test_project_manager = User.create(first_name: "Luke",
                                     last_name: "Skywalker",
                                     email: 'not_current@man.net',
                                     password: "asdfghjkl",
                                     manager: true)
  test_project.managers << test_project_manager
end

Given(/^the following volunteers exist:$/) do |table|
  puts table
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |arg1, arg2|
  puts arg1
  puts arg2
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I select "([^"]*)"$/) do |arg1|
  puts arg1
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I press the "([^"]*)" button$/) do |arg1|
  puts arg1
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" \#A user that meets these specified qualifications$/) do |arg1|
  puts arg1
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see "([^"]*)" \#A user that does not$/) do |arg1|
  puts arg1
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I select attribute field$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I select predicate field$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the number of attibute fields should be (\d+)$/) do |arg1|
  puts arg1
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the number of predicate fields should be (\d+)$/) do |arg1|
  puts arg1
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^Volunteer (\d+) exists$/) do |arg1|
  puts arg1
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I press the checkbox next to the first volunteer$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^press the checkbox next to the second volunteer$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the number of checked boxes should be (\d+)$/) do |arg1|
  puts arg1
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^there will be no checked box for the first volunteer$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see that the page headings, font styles, and text sizes are uniform across the website$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see that the page theme and colors are consistent with the main EWB website$/) do
  pending # Write code here that turns the phrase above into concrete actions
end