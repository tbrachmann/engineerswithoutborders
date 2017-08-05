var EditVolunteers = {
    init: function() {
	//Initialize the multi-select
	$('#my-select:hidden').multiSelect({afterInit: function(){
	    $('center#edit_volunteers:hidden').show()
	}})
	//Bind event to button
	$("#submit").click(function(e) {
	    EditVolunteers.sendSelected(EditVolunteers.getSelectedIds())
	})
    },
    getSelected: function() {
	return $('#my-select').find(":selected")
    },
    getSelectedIds: function() {
	var selected = []
	var selectedObj = this.getSelected()
	for(var i = 0; i < selectedObj.length; i++) {
	    selected = selected.concat(selectedObj[i].id)
	}
	return selected
    },
    sendSelected: function(selected) {
	console.log(selected)
	console.log(window.location.pathname)
	$.ajax({
	    url: window.location.pathname,
	    type: "GET",
	    error: function(e) {
		console.log("Update failed");
		return null
	    },
	    success: function(data) {
		$('#success:hidden').show()
	    },
	    data: { "volunteers" : JSON.stringify(selected) },
	    contentType: "application/json"
	})
    }
}

$(document).on("turbolinks:load ready", function() {
    EditVolunteers.init()
})
