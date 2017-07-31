$(document).ready(function() {
    setTimeout(function() {
	$('#my-select').multiSelect()
    }, 1000)
});

//Get selected elements
function getSelected() {
    return $('#my-select').find(":selected")
}

function getSelectedIds() {
    var selected = []
    var selectedObj = getSelected()
    for(var i = 0; i < selectedObj.length; i++) {
	selected = selected.concat(selectedObj[i].id)
    }
    return selected
}

//Send to server
function sendSelected() {

}
