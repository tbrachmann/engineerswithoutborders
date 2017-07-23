var checked_skills = [];
var users_to_skills;

var checked_certs=[];
var users_to_certs;

var all_checked_boxes=[];

$(document).ready(function(){
  $.ajax({type: "GET",
	    url: "/users",
	    error: function(e) {
		console.log("failed!");
		return null
	    },
	    success: function(data) {
	    users_to_skills = data['skills'];
	    users_to_certs = data['certs'];
	    }
  });
});

function change(id_class) {
	var id = id_class.split('_')[0];
	var klass = id_class.split('_')[1];
	var checkbox = $('#' + id_class);
	switch(klass) {
		case 'skill': 
			processBoxes(checkbox, checked_skills, id);
		case 'cert':
			processBoxes(checkbox, checked_certs, id);
		default:
		    processBoxes(checkbox, all_checked_boxes, id);
	}
    filterUsers();
}


function filterUsers() {
	var user_rows = $("div[klass='user_row']");
	for (i=0; i < user_rows.length; i++) {
		shouldShow(parseInt(user_rows[i].id));
	}
}

//returns true if arr1 includes any element in arr2
function includesAny(arr1, arr2) {
    return arr2.some(function (a) {
        return arr1.indexOf(a) >= 0;
    });
}

function shouldShow(user_id) {
	if (all_checked_boxes.length === 0 || includesAny(users_to_skills[user_id], checked_skills) || includesAny(users_to_certs[user_id], checked_certs)) {
		$('#' + user_id).show();
	} else {
		$('#' + user_id).hide();
	}
}

function processBoxes(new_check, already_checked, id) {
    if (new_check.is(':checked')) {
    	already_checked.push(id);
    } else if (!new_check.is(':checked')) {
    	already_checked.splice(already_checked.indexOf(id), 1);
    }
	
}
