$(document).on("turbolinks:load", function() {
  $("#a-new-skill").on("mfpOpen", function(e) {
    $("#new-skill-submit").click(function(e) {
      e.preventDefault()
      $.ajax({
	url: window.location.pathname,
	type: "GET",
	error: function(e) {
	  console.log("Update failed");
	  return null
	},
	success: function(data) {
	  console.log(data.id)
	  var new_skill_hash = { value: data.id, text: data.name, index: 0 }
	  $("#skills-select").multiSelect("addOption", new_skill_hash)
	  $.magnificPopup.close()
	},
	data: { "new_skill": $("#new_skill").val() },
	contentType: "application/json",
      })
    })
  })
})
