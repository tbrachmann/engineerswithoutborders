var checked_skills = [];
var users_to_skills;

var checked_certs=[];
var users_to_certs;

var checked_fields =[];
var users_to_fields;

var all_checked_boxes=[];

document.addEventListener("turbolinks:load", function() {
  $.ajax({type: "GET",
	    url: "/users",
	    error: function(e) {
		console.log("failed!");
		return null
	    },
	    success: function(data) {
	    users_to_skills = data['skills'];
	    users_to_certs = data['certs'];
	    users_to_fields = data['fields'];
	    }
  });
  
  function toggle(toggle_icon, field_to_toggle) {
    if (field_to_toggle.is(":visible")) {
      toggle_icon.attr("src", "/assets/plus_icon.png");
    } else {
      toggle_icon.attr("src", "/assets/minus-icon.svg");
    }
    field_to_toggle.toggle();
  }  
  
  $("#skills_div").click(function() {
  	toggle($("#skills_toggle"), $("#skill_checkboxes"))
  	});
    
  $("#cert_div").click(function() {
  	toggle($("#cert_toggle"), $("#cert_checkboxes"))
  	});
    
  $("#field_div").click(function() {
  	toggle($("#field_toggle"), $("#field_checkboxes"))
  	});
  	
  $("#logistics_toggle").click(function() {
  	toggle($("#logistics_toggle"), $("#log_dropdown"))
  	});
  	
  $("#qualities_toggle").click(function() {
  	toggle($("#qualities_toggle"), $("#quality_dropdown"))
  	});
  	
  $("#availability_toggle").click(function() {
  	toggle($("#qualities_toggle"), $("#availability_chart"))
  	});
  	
  $("#pm_toggle").click(function() {
  	toggle($("#pm_toggle"), $("#pm_dropdown"))
  	});

  $("#vol_toggle").click(function() {
  	toggle($("#vol_toggle"), $("#vol_dropdown"))
  	});
  	
  $('#basic_info_div').click(function() {
  	toggle($('#basic_info_toggle'), $('#basic_info_dropdown'))
  });
  
  $('#education_div').click(function() {
  	toggle($('#education_toggle'), $('#education_dropdown'))
  });
  
  $('#users_cert_div').click(function() {
  	toggle($('#users_cert_toggle'), $('#users_cert_dropdown'))
  });
  
  $('#outreach_div').click(function() {
  	toggle_and_pull_down('#outreach_toggle', '#outreach_dropdown', '.outreach-cols');
  });
  
  $('#language_div').click(function() {
  	toggle_and_pull_down('#language_toggle', '#language_dropdown', '.lang-cols');
  });
  
  $('#avail_div').click(function() {
  	toggle($('#avail_toggle'), $('#avail_dropdown'))
  });
  
  $('#users_skill_div').click(function() {
  	toggle($('#users_skill_toggle'), $('#users_skill_dropdown'))
  });
  
  $('#construction_div').click(function() {
  	toggle($('#construction_toggle'), $('#construction_dropdown'))
  });
  
  $('#design_div').click(function() {
  	toggle($('#design_toggle'), $('#design_dropdown'))
  });
  
  $('#role_div').click(function() {
  	toggle($('#role_toggle'), $('#role_dropdown'))
  });
  
  $('#about_div').click(function() {
  	toggle($('#about_toggle'), $('#about_dropdown'))
  });
  
  function pull_down(columns) {
  	$(columns).each(function() {
  		var $this = $(this);
  		$this.css('margin-top', $this.parent().height() - $this.height());
  	});
  }
  
  function toggle_and_pull_down(tog, dropdown, columns) {
  	toggle($(tog), $(dropdown));
  	pull_down(columns);
  }


});

function change(id_class) {
	var id = id_class.split('_')[0];
	var klass = id_class.split('_')[1];
	var checkbox = $('#' + id_class);
	switch(klass) {
		case 'skill': 
			processBoxes(checkbox, checked_skills, id);
			break;
		case 'cert':
			processBoxes(checkbox, checked_certs, id);
			break;
		case 'field':
			processBoxes(checkbox, checked_fields, id);
			break;
		default:
	}
    processBoxes(checkbox, all_checked_boxes, id);
    filterUsers();
}


function filterUsers() {
	var user_rows = $("div[klass='user_row']");
	for (i=0; i < user_rows.length; i++) {
		shouldShow(parseInt(user_rows[i].id));
	}
}

/* Returns true if arr1 includes all elements in arr2. */
function includesAll(arr1, arr2) {
	arr1.forEach(function (b, index, arr1) {
		if (b) {
		  arr1[index] = b.replace(/[^A-Z0-9]/ig, '');
		}
	});
    return arr2.every(function (a) {
        return arr1.indexOf(a) >= 0;
    });
}

function shouldShow(user_id) {
	if (all_checked_boxes.length === 0 || (includesAll(users_to_skills[user_id], checked_skills) && includesAll(users_to_certs[user_id], checked_certs) && includesAll(users_to_fields[user_id], checked_fields))) {
	    $('#' + user_id).show();
	    $('#' + user_id).next("hr").show()
	} else {
	    $('#' + user_id).hide();
	    $('#' + user_id).next("hr").hide()
	}
}

function processBoxes(new_check, already_checked, id) {
    if (new_check.is(':checked')) {
    	already_checked.push(id);
    } else if (!new_check.is(':checked')) {
    	already_checked.splice(already_checked.indexOf(id), 1);
    }
	
}