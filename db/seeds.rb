# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user_list = [["jbarns@berkeley.edu", "password", "Jack", "Barnett", 20],
             ["mikewazoski@gmail.com", "password", "Mike", "Wazoski", 131],
             ["natalie@gmail.com", "password", "Natalie", "Barnett", 17],
             ["benbarns@gmail.com", "password", "Ben", "Barnett", 14]]

user_list.each do |email, password, first_name, last_name, age|
  User.create(email: email, password: password, first_name: first_name,
              last_name: last_name, age: age)
end

skill_list = ["test1", "test2", "test3"]

skill_list.each do |name|
    Skill.create(name: name)
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
