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
  User.create(email: email, password: password, first_name: first_name, last_name: last_name, age: age)
end

skill_list = ["test1", "test2", "test3"]

skill_list.each do |name|
    Skill.create(name: name)
end