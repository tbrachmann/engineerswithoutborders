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
//    console.log("I've been clicked!!")
    var $skill_checkbox = $("#" + id)
    $.ajax({type: "GET",
	    url: "/users",
	    data: {skill_name: id},
	    error: function(e) {
		console.log("failed!");
		return null
	    },
	    success: function(data) {
		console.log(data);
		var ids = []
		/*
		for (var i in data) {
		    ids.concat(data[i][id])
		}
*/
		/*
		var ids = data.map(function(x) {
		    return x[id]
		});
		*/
		var user_rows = $("div[klass='user_row']")
		console.log(user_rows)
		for (var i in user_rows) {
		    if(data[id] != $(user_rows[i]).attr('id')) {
			$(user_rows[i]).hide()
		    }
		}
	    }
	   });
    /*
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
    */

    
    
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
