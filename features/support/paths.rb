# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned

# :nocov:
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
  
    when /^the home\s?page$/
       '/'
    
    when /^the Volunteer page$/
       '/volunteers/new'
       
    when /^the list volunteers page$/
       '/volunteers'
       
    when /^the "Find Volunteers" page$/
      '/users'

    when /^the Successfully Created page$/
      'volunteers/' + Volunteer.id

    when /^the "Edit Project" page$/
      '/projects/:id/edit'

    when /^the "Project Listings" page$/
      '/projects'
      
    when /^the sign up page$/
      '/users/sign_up'

    when /^the admin page$/
      '/admin'
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
# :nocov:
