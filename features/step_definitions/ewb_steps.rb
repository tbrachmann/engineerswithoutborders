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
    test_project = Project.create(name: project_name,
                                  description: "Creating a large-scale water filter system",
                                  volunteer_capacity: 25, location: "Remba Island, Kenya")
  end
  skill = Skill.new(name: "Ruby")
  if Skill.exists?(:name => "Ruby")
    test_project.skills << Skill.find_by_name(skill.name)
  else
    test_project.skills << skill
  end
  cert = Certification.new(name: "Microsoft Excel")
  if Certification.exists?(:name => "Microsoft Excel")
    test_project.certifications << Certification.find_by_name(cert.name)
  else
    test_project.certifications << cert
  end
  construction_exp = ConstructionExperience.new(name: "Well")
  if ConstructionExperience.exists?(:name => "Well")
    test_project.construction_experiences << ConstructionExperience
                                               .find_by_name(construction_exp.name)
  else
    test_project.construction_experiences << construction_exp
  end
  design_exp = DesignExperience.new(name: "Road")
  if DesignExperience.exists?(:name => "Road")
    test_project.design_experiences << DesignExperience.find_by_name(design_exp.name)
  else
    test_project.design_experiences << design_exp
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

Given /^the following volunteers are on "(.+)":$/ do |project_name, table|
  if(!Project.exists?(name: project_name))
    Project.create(name: project_name,
                   description: "Creating a large-scale water filter system",
                   volunteer_capacity: 25, location: "Remba Island, Kenya")
  end
  project = Project.find_by_name(project_name)
  table.hashes.each do |table_hash|
    user = User.create(:email => table_hash[:email], 
	               :password => "asdfghjk",
	               :first_name => table_hash[:first_name],
	               :last_name => table_hash[:last_name])
    user.projects << project
  end
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
  skill = Skill.new(name: "Ruby")
  if Skill.exists?(:name => "Ruby")
    test_project.skills << Skill.find_by_name(skill.name)
  else
    test_project.skills << skill
  end
  cert = Certification.new(name: "Microsoft Excel")
  if Certification.exists?(:name => "Microsoft Excel")
    test_project.certifications << Certification.find_by_name(cert.name)
  else
    test_project.certifications << cert
  end
  construction_exp = ConstructionExperience.new(name: "Well")
  if ConstructionExperience.exists?(:name => "Well")
    test_project.construction_experiences << ConstructionExperience
                                               .find_by_name(construction_exp.name)
  else
    test_project.construction_experiences << construction_exp
  end
  design_exp = DesignExperience.new(name: "Road")
  if DesignExperience.exists?(:name => "Road")
    test_project.design_experiences << DesignExperience.find_by_name(design_exp.name)
  else
    test_project.design_experiences << design_exp
  end
end

Given(/^the following volunteers exist:$/) do |volunteer_table|
  volunteer_table.hashes.each do |volunteer|
    User.create!(volunteer)
  end
end

Given(/^the following skill table exists:$/) do |skill_table|
  skill_table.hashes.each do |skill|
    Skill.create!(skill)
  end
end

Given(/^"([^"]*)" is available on "([^"]*)"$/) do |arg1, arg2|
  fail
  # Write code here that turns the phrase above into concrete actions
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
  name = arg1.split(/\s+/)
  if page.respond_to? :should
    page.should have_content(name[0])
    page.should have_content(name[1])
  else
    assert page.has_content?(text)
  end
end

Then(/^I should not see "([^"]*)" \#A user that does not$/) do |arg1|
  #Pending
end

Then /^the "([^"]*)" field(?: within (.*))? should contain "([^"]*)"$/ do |field, parent, value|
  case field
  when "attribute"
    locator = "q_c_0_a_0_name"
  when "predicate"
    locator = "q_c_0_p"
  else
    locator = field
  end
  expect(page).to have_select(locator, :with_options => [value])
end

Then /^the "([^"]*)" field(?: within (.*))? should not contain "([^"]*)"$/ do |field, parent, value|
  case field
  when "attribute"
    locator = "q_c_0_a_0_name"
  when "predicate"
    locator = "q_c_0_p"
  else
    locator = field
  end
  expect(page).not_to have_select(locator, :with_options => [value])
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

Given(/^the following users exist with the given qualities:$/) do |table|
  puts table
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)"'s qualities$/) do |arg1|
  puts arg1
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see "([^"]*)"'s qualities$/) do |arg1|
  puts arg1
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see everyone$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see noone$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see everyone's qualities$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I click "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I type in "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am a volunteer$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I enter "([^"]*)" into "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  expect(page).to have_link(link)
  first(:link, link).click
end

Then /^the number of attribute fields should be (\d+)$/ do |arg1|
  expect(page).to have_selector("p div.field", wait: 60)
  expect(page.all(".field").count).to eq 2
end

