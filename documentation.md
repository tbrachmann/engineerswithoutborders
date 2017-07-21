Documentation on Toby's Changes Week 7/10
===

## I. Updates
* Updated **Rails** to version 4.2.9
* Updated **Ruby** to version 2.4.1

```
bundle update
bundle install
```

I haven't found anything that breaks, but keep a look out.

## II. Database Changes
* `:has_many through` association on Projects and Users
* A user has many projects as `projects` and a project has many users as `volunteers` through `VolunteerRelationship`
* A manager has many projects as `manages` and a project has many managers as `managers` through `ManagerRelationship`
  * A manager is just a user with role set to "manager" - in the future we can either make this a boolean, or check the `ManagerRelationship` table to see if the user manages any projects
* Besides the `user_id` and `project_id`, the `VolunteerRelationship` (table) also holds the role of the volunteer on the project
* A user can have multiple roles on a project, and manager can both be a manager and have a separate role on a project
  * This means that there can be multiple entries in the `VolunteerRelationship` table for the same user on the same project provided that the role is different
* The plan for roles is that the project manager specifies a list of roles, and then can assign them through a dropdown to volunteers

## III. Convenience Methods

#### On the `Project` model:
Getting volunteers:
```ruby
@example_project.volunteers
```
Although there may be many entries for each volunteer in the `VolunteerRelationship` table, this method will return only unique users.

Getting managers:
```ruby
@example_project.managers
```

Assigning volunteers:
```ruby
@example_project.volunteers << @example_volunteer
```

Assigning managers:
```ruby
@example_project.managers << @example_manager
```

Add and assign role:
```ruby
add_with_role(volunteer, role)
```
If user does not exist, or volunteer is already a volunteer on the project, return false. Otherwise, create a new `VolunteerRelationship` associated with user, project, and specified role. 

Assign role:
```ruby
assign_role(volunteer, role)
```
If user is not a part of the project nor a manager, return false. Otherwise, create a new `VolunteerRelationship` associated with user, project, and specified role. 

Get role of user on project:
```ruby
role_of(volunteer)
```
If user is not a part of the project nor a manager, return false. Otherwise return an array of strings of the roles of a user on a project. If the volunteer is also a manger, append "manager" to the array.

#### On the `User` model:
Getting projects the user is assigned to:
```ruby
@example_user.projects
```

Assigning projects to the user:
```ruby
@example_user.projects << @example_project
```

Getting projects that the user manages:
```ruby
@example_user.manages
```

Assigning projects for the user to manage:
```ruby
@example_user.manages << @example_project
```

See more usage examples in `spec/association_spec.rb`.
