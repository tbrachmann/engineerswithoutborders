$(document).on("turbolinks:load", function() {
  $("#a-new-skill").on("mfpOpen", function(e) {
    console.log("mfpopen")
    $("#new-skill-submit").click(function(e) {
      e.preventDefault()
      $.ajax({
	url: window.location.pathname,
	type: "GET",
	error: function(e) {
	  $("#failure:hidden").show()
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
	contentType: "application/json"
      })
    })

    $("#new-const-exp-form1").submit(function(e) {
      $.ajax({
	url: window.location.pathname,
	type: "GET",
	error: function(e) {
	  $("#failure:hidden").show()
	  console.log("Update failed");	    
	  return null
	},
	success: function(data) {
	  console.log(data.id)
	  var new_const_exp_hash = { value: data.id, text: data.name, index: 0 }
	  $("#const-exp-select").multiSelect("addOption", new_const_exp_hash)
	  $.magnificPopup.close()
	},
	data: { "new_const_exp": $("#new_const_exp").val() },
	contentType: "application/json"
      })
      return false
    })

    $("#new-des-exp-form1").submit(function(e) {
      e.preventDefault()
      $.ajax({
	url: window.location.pathname,
	type: "GET",
	error: function(e) {
	  $("#failure:hidden").show()
	  console.log("Update failed");	    
	  return null
	},
	success: function(data) {
	  console.log(data.id)
	  var new_des_exp_hash = { value: data.id, text: data.name, index: 0 }
	  $("#des-exp-select").multiSelect("addOption", new_des_exp_hash)
	  $.magnificPopup.close()
	},
	data: { "new_des_exp": $("#new_des_exp").val() },
	contentType: "application/json"
      })
    })
  })
})
