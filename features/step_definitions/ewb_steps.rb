Given /the following volunteers exist/ do |volunteers_table|
  volunteers_table.hashes.each do |volunteer|
    Volunteer.create(volunteer)
  end
end

# Add a declarative step here for populating the DB with movies.
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)
    #is it ok to use movie.create here? will it parse movie correctly?
    #do i need to save
  end
  # fail "Unimplemented"
end

Given /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
    all_ratings = Volunteer.all_ratings
    ratings = rating_list.split(", ")
    all_ratings.each do |r|
      field_checked = find_field("ratings_#{r}")['checked']
      if ratings.include?(r)
        uncheck ? uncheck("ratings_#{r}") : check("ratings_#{r}")
      else
        field_checked ? check("ratings_#{r}") : uncheck("ratings_#{r}")
      end
    end
  end
  
