# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Leaving these unchanged, but I think its better to generate test data using
# Cucumber and step definitions for isolation purposes.

user_list = [["jbarns@berkeley.edu", "password", "Jack", "Barnett", 20],
             ["mikewazoski@gmail.com", "password", "Mike", "Wazoski", 131],
             ["natalie@gmail.com", "password", "Natalie", "Barnett", 17],
             ["benbarns@gmail.com", "password", "Ben", "Barnett", 14]]

user_list.map! do |email, password, first_name, last_name, age|
  User.create(email: email, password: password, first_name: first_name,
              last_name: last_name, age: age)
end

skills = [Faker::Job.key_skill, Faker::Job.key_skill, Faker::Job.key_skill]

skills.map! do |skill|
    Skill.create(name: skill)
end

skills.each do |skill|
  user_num = Faker::Number.between(0, 3)
  user_list[user_num].skills << skill
end
  
test_manager = User.create(first_name: Faker::Name::first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email, password: "asdfghjkl", 
    encrypted_password: "asdf", sign_in_count: 1, 
    created_at: 10.years.ago, 
    updated_at: 10.years.ago)
    
test_manager_two = User.create(first_name: Faker::Name::first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email, password: "asdfghjkl", 
    encrypted_password: "asdf", sign_in_count: 1, 
    created_at: 10.years.ago, 
    updated_at: 10.years.ago)

test_manager_three = User.create(first_name: Faker::Name::first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email, password: "asdfghjkl", 
    encrypted_password: "asdf", sign_in_count: 1, 
    created_at: 10.years.ago, 
    updated_at: 10.years.ago)
    
test_project = Project.create(name: "Remba Island Project", 
    description: "Creating a large-scale water filter system", 
    volunteer_capacity: 25,
    location: "Remba Island, Kenya")

test_project.managers << test_manager
test_project.managers << test_manager_two
test_project.managers << test_manager_three

# Will generate some fake data for Adolfo

User.create(first_name: "Tobias", last_name: "Brachmann",
            email: "tobybrachmann@gmail.com", password: "asdfgh",
            manager: true, admin: true)

adolfo = User.create(first_name: "Adolfo", last_name: "Espino",
                     email: "adolfo.espino@gmail.com", password: "asdfgh")
test_project = FactoryGirl.create(:project)
adolfo.manager = true
adolfo.manages << test_project

5.times do
  FactoryGirl.create(:project)
end

10.times do
  FactoryGirl.create(:user, password: "asdfgh")
end

