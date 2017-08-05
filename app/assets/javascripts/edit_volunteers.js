var EditVolunteers = {
    init: function() {
	//Initialize the multi-select
	$('#my-select:hidden').multiSelect({
	    selectableHeader:"<input type='text' class='search-input' autocomplete='off' placeholder='Search'>",
	    selectionHeader:"<input type='text' class='search-input' autocomplete='off' placeholder='Search'>",
	    selectableFooter:"<div class='custom-header'>Eligible Volunteers</div>",
	    selectionFooter:"<div class='custom-header'>Your Volunteers</div>",
	    afterInit: function(){
		$('center#edit_volunteers:hidden').show()
		var that = this,
		    $selectableSearch = that.$selectableUl.prev(),
		    $selectionSearch = that.$selectionUl.prev(),
		    selectableSearchString = '#'+that.$container.attr('id')+' .ms-elem-selectable:not(.ms-selected)',
		    selectionSearchString = '#'+that.$container.attr('id')+' .ms-elem-selection.ms-selected';

		that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
		    .on('keydown', function(e){
			if (e.which === 40){
			    that.$selectableUl.focus();
			    return false;
			}
		    });

		that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
		    .on('keydown', function(e){
			if (e.which == 40){
			    that.$selectionUl.focus();
			    return false;
			}
		    })
	    },
	    afterSelect: function(){
		this.qs1.cache();
		this.qs2.cache();
	    },
	    afterDeselect: function(){
		this.qs1.cache();
		this.qs2.cache();
	    }
	})
	//Bind event to button
	$("#submit").click(function(e) {
	    var selected = EditVolunteers.getSelectedIds()
	    EditVolunteers.sendSelected(selected)
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
		location.replace(data.new_path)
	    },
	    data: { "volunteers" : JSON.stringify(selected) },
	    contentType: "application/json"
	})
    }
}

$(document).on("turbolinks:load", function() {
    EditVolunteers.init()
})
