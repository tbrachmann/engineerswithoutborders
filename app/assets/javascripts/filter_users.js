$(document).ready(function(){
  $.ajax({type: "GET",
	    url: "/users",
	    error: function(e) {
		console.log("failed!");
		return null
	    },
	    success: function(data) {
	    users_to_skills = data;
		console.log(data);
	    }
  });

    //$('input[type=checkbox]').click(function() {
      //  console.log('click');
      //if ($(this).is(':checked')) {
    //    $(this).siblings('label').html('checked');
      //} else {
        //$(this).siblings('label').html(' not checked');
      //}
    //});

});

var checked_skills = [];
var users_to_skills;

function change(id) {
    var skill_checkbox = $("#" + id);
    if (skill_checkbox.is(':checked')) {
    	checked_skills.push(id);
    } else if (!skill_checkbox.is(':checked')) {
    	checked_skills.splice(checked_skills.indexOf(id), 1);
    }
    
    filterUsers();
    
    $.ajax({type: "GET",
	    url: "/users",
	    data: {skill_name: id},
	    error: function(e) {
		console.log("failed!");
		return null
	    },
	    success: function(data) {
	    users_to_skills = data;
		console.log(data);
		//for (var i in data) {
	//		ids.push(data[i].id);
	//	}
		//var user_rows = $("div[klass='user_row']");
		//for (i=0; i < user_rows.length; i++) {
			//check if user does not have current skill
		 //   if (ids.indexOf(parseInt(user_rows[i].id)) === -1) {
		    	//if checkbox is checked, hide them
		//    	if (skill_checkbox.is(':checked')) {
	//	    	  checked_skills.push(id);
	//		      $('#' + user_rows[i].id).hide();
		    	//if checkbox is unchecked, show them
		//    	} else if (!skill_checkbox.is(':checked')){
	//	    	  $('#' + user_rows[i].id).show();
	//	    	} 
	//	   }
	//	}
	    }
	   });


}

function filterUsers() {
	var user_rows = $("div[klass='user_row']");
	for (i=0; i < user_rows.length; i++) {
		user_id = parseInt(user_rows[i].id);
		if (includesAny(users_to_skills[user_id], checked_skills) || checked_skills.length === 0) {
			$('#' + user_rows[i].id).show();
		} else {
			$('#' + user_rows[i].id).hide();
		}
	}
}

//returns true if arr1 includes any element in arr2
function includesAny(arr1, arr2) {
    return arr2.some(function (a) {
        return arr1.indexOf(a) >= 0;
    });
};
