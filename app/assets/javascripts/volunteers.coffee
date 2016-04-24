$(document).on 'page:load', ->
  $('#volunteer_join_project_team').change ->
    if @checked
      $('#join_team_details').removeClass 'hidden'
    else
      $('#join_team_details').addClass 'hidden'
