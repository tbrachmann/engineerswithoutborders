# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Leaving these unchanged, but I think its better to generate test data using
# Cucumber and step definitions for isolation purposes.

=begin
user_list = [["jbarns@berkeley.edu", "password", "Jack", "Barnett", 20],
             ["mikewazoski@gmail.com", "password", "Mike", "Wazoski", 131],
             ["natalie@gmail.com", "password", "Natalie", "Barnett", 17],
             ["benbarns@gmail.com", "password", "Ben", "Barnett", 14]]

user_list.map! do |email, password, first_name, last_name, age|
  User.create(email: email, password: password, first_name: first_name,
              last_name: last_name, age: age)
end

=end

test_manager = User.create(first_name: Faker::Name::first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.unique.email, password: "asdfghjkl", 
    encrypted_password: "asdf", sign_in_count: 1, 
    created_at: 10.years.ago, 
    updated_at: 10.years.ago,
    manager: true)
    
test_manager_two = User.create(first_name: Faker::Name::first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.unique.email, password: "asdfghjkl", 
    encrypted_password: "asdf", sign_in_count: 1, 
    created_at: 10.years.ago, 
    updated_at: 10.years.ago,
    manager: true)

test_manager_three = User.create(first_name: Faker::Name::first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.unique.email, password: "asdfghjkl", 
    encrypted_password: "asdf", sign_in_count: 1, 
    created_at: 10.years.ago, 
    updated_at: 10.years.ago,
    manager: true)
    
test_project = Project.create(name: "Remba Island Project", 
    description: "Creating a large-scale water filter system", 
    volunteer_capacity: 25,
    location: "Remba Island, Kenya")

test_project.managers << test_manager
test_project.managers << test_manager_two
test_project.managers << test_manager_three

test_managers = [test_manager, test_manager_two, test_manager_three]

# Will generate some fake data for Adolfo

adolfo = FactoryGirl.create(:user, first_name: "Adolfo", last_name: "Espino",
                            email: "adolfo.espino@gmail.com", password: "asdfgh",
                            manager: true)

test_project = FactoryGirl.create(:project)
adolfo.manages << test_project

toby = FactoryGirl.create(:user, first_name: "Tobias", last_name: "Brachmann",
                          email: "tobybrachmann@gmail.com", password: "asdfgh",
                          manager: true, admin: true)

arman = FactoryGirl.create(:user, first_name: "Arman", last_name: "Jaffer",
                           email: "arman@arman.com", password: "asdfgh",
                           manager: true, admin: true)

claire = FactoryGirl.create(:user, first_name: "Claire", last_name: "Scheele",
                            email: "claire@claire.com", password: "asdfgh",
                            manager: true, admin: true)

jerry = FactoryGirl.create(:user, first_name: "Jerry", last_name: "Wu",
                           email: "jerry@jerry.com", password: "asdfgh",
                           manager: true, admin: true)

bill = FactoryGirl.create(:user, first_name: "Bill", last_name: "Yeo",
                          email: "bill@bill.com", password: "asdfgh",
                          manager: true, admin: true)

sasank = FactoryGirl.create(:user, first_name: "Sasank", last_name: "Schaganty",
                            email: "sasank@sasank.com", password: "asdfgh",
                            manager: true, admin: true)

test_project.managers << [toby, arman, claire, jerry, bill, sasank]


certifications = ["Agricultural and Biological Engineering", "Architectural", "Chemical", 
"Civil: Construction", "Civil: Geotechnical", "Civil: Structural", "Civil: Transportation", 
"Civil: Water Resources and Environmental", "Control Systems", "Electrical and Computer: Computer Engineering", 
"Electrical and Computer: Electrical and Electronics", "Electrical and Computer: Power", 
"Environmental", "Fire Protection", "Industrial and Systems", "Mechanical: HVAC and Refrigeration", 
"Mechanical: Machine Design and Materials", "Mechanical: Thermal and Fluids Systems", "Metallurgical and Materials", 
"Mining and Mineral Processing", "Naval Architecture and Marine", "Nuclear", 
"Petroleum", "Software", "Structural"]
skills = ["Computers", "CAD", "C++", "C", "Ruby", "Rails", "Technical Writing", "Chemicals", "Metals"]
construction_experiences = ["Well", "Road", "Sewer Systems", "Space Shuttle", "Pumps", "Cars"]
design_experiences = ["Well", "Road", "Sewer Systems", "Space Shuttle", "Pumps", "Cars"]
roles = ["Programmer", "Cook", "Engineer", "Gunnery Sergeant", "Spaceship Captain", "Astronaut", "Telephone Sanitizer"]
availabilities = User.preset_time_slots

certifications.map! do |name|
  Certification.create!(name: name)
end

skills.map! do |name|
  Skill.create!(name: name)
end

construction_experiences.map! do |name|
  ConstructionExperience.create!(name: name)
end

design_experiences.map! do |name|
  DesignExperience.create!(name: name)
end

roles.map! do |name|
  Role.create!(name: name)
end

users = []

10.times do
  user = FactoryGirl.create(:user, password: "asdfgh")
  users << user
  cert_num = Faker::Number.between(0, certifications.count-1)
  user.certifications << certifications[cert_num]
  skill_num = Faker::Number.between(0, skills.count-1)
  user.skills << skills[skill_num]
  const_exp_num = Faker::Number.between(0, construction_experiences.count-1)
  user.construction_experiences << construction_experiences[const_exp_num]
  des_exp_num = Faker::Number.between(0, design_experiences.count-1)
  user.design_experiences << design_experiences[des_exp_num]
  role_num = Faker::Number.between(0, roles.count-1)
  user.role = roles[role_num]
  user_availabilities = {}
  availabilities.each do |a|
    user_availabilities[a] = Faker::Boolean.boolean(Faker::Number.between(0, 1))
  end    
  user.update_availability(user_availabilities)
  user.save
end

projects = []

5.times do
  project = FactoryGirl.create(:project)
  projects << project
  project.add_in_demand_quality(skills[Faker::Number.between(0, skills.count-1)])
  manager_num = Faker::Number.between(0, test_managers.count-1)
  project.managers << test_managers[manager_num]
  volunteer_count = Faker::Number.between(2, users.count-1)
  volunteer_count.times do
    project.volunteers << users[Faker::Number.between(0, users.count-1)]
  end
end

test_project.in_demand << InDemand.add_in_demand_quality(test_project.id, Certification.create!(name: "Software Engineering"))
test_project.in_demand << InDemand.add_in_demand_quality(test_project.id, Certification.create!(name: "Naval Engineering"))
test_project.in_demand << InDemand.add_in_demand_quality(test_project.id, Certification.create!(name: "Nuclear Engineering"))
