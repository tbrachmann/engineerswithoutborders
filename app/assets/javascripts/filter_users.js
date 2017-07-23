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
    var skill_checkbox = $("#" + id);
    $.ajax({type: "GET",
	    url: "/users",
	    data: {skill_name: id},
	    error: function(e) {
		console.log("failed!");
		return null
	    },
	    success: function(data) {
		var ids = [];
		for (var i in data) {
			ids.push(data[i].id);
		}
		var user_rows = $("div[klass='user_row']");
		for (i=0; i < user_rows.length; i++) {
		    if (ids.indexOf(parseInt(user_rows[i].id)) === -1) {
		    	if (skill_checkbox.is(':checked')) {
			      $('#' + user_rows[i].id).hide();
		    	} else {
		    	  $('#' + user_rows[i].id).show();
		    	} 
		   }
		}
	    }
	   });


}
