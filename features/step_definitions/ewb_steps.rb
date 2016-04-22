Given /the following volunteers exist/ do |volunteers_table|
  volunteers_table.hashes.each do |volunteer|
    Volunteer.create(volunteer)
  end
end

# :nocov:
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
# :nocov:
