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
		    for (var i=0; i < user_rows.length; i++) {
			if(data.id != $(user_rows[i]).attr('id')) {
			    $(user_rows[i]).hide()
			    $(user_rows[i]).next("hr").hide()
			}
		    }
		}
	       });
}

function filter(user, id) {
    var skills = user.skills;
    
    console.log(skills);
}
