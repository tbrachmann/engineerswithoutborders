$(document).ready(function(){

    
    //$('input[type=checkbox]').click(function() {
      //  console.log('click');
      //if ($(this).is(':checked')) {
    //    $(this).siblings('label').html('checked');
      //} else {
        //$(this).siblings('label').html(' not checked');
      //}
    //});

});

function change(id) {
    var item = '#' + id;
    var users = gon.users;
    var skills = gon.skills
    for (var i in skills) {
        if (skills[i].name == id) {
            skill = skills[i];
            console.log(skill);
        }
        //console.log(users[i]);
        //filter(users[i], id);
    }
    
    //<% @users.each do |user| %>
      //filter(user, id)
    //<% end %>
    //$.each($('input[type=checkbox'), function(i, val) {
    //    console.log(val);
    //  if ($(val).is(':checked')) {
   //     console.log("yay");
    //  } 
   // });
}

function filter(user, id) {
    var skills = user.skills;
    
    console.log(skills);
    //<% user.skills.each do |skill| %>
     // <% if skill.name == id %>
      //  console.log(<%= user.name %>)
     //   console.log(<%=skill.name%>)
     // <% end %>
  //  <% end %>
}
