function MultiSelect(selectableName, selectionName, $multiSelect, $submit) {
  this.selectableName = selectableName;
  this.selectionName = selectionName;
  this.$multiSelect = $multiSelect;
  this.$submit = $submit;
  this.init = function() {
    //Initialize the multi-select
    this.$multiSelect.multiSelect({
      selectableHeader:"<input type='text' class='search-input'" +
	" autocomplete='off' placeholder='Search'>",
      selectionHeader:"<input type='text' class='search-input'" +
	"autocomplete='off' placeholder='Search'>",
      selectableFooter:"<div class='custom-header'>" +
	selectableName + "</div>",
      selectionFooter:"<div class='custom-header'>" +
	selectionName + "</div>",
      afterInit: function(){
	//this.$multiSelect.show()
	var that = this
	var $selectableSearch = that.$selectableUl.prev()
	var $selectionSearch = that.$selectionUl.prev()
	var selectableSearchString = '#' + that.$container.attr('id') +
	    ' .ms-elem-selectable:not(.ms-selected)'
	var selectionSearchString = '#' + that.$container.attr('id') +
	    ' .ms-elem-selection.ms-selected'
	
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
    if(this.$submit) {
      this.bindHandler(this)
    }
  }
  this.bindHandler = function(myMultiSelect) {
    this.$submit.click(function(e) {
      var selected = MultiSelect.prototype.getSelectedIds(myMultiSelect)
      MultiSelect.prototype.sendSelected(selected, myMultiSelect)
    })
  }
  this.onSuccess = function(data) {
    console.log("Success!")
  }
}

MultiSelect.prototype.getSelected = function(myMultiSelect) {
  return myMultiSelect.$multiSelect.find(":selected")
}

MultiSelect.prototype.getSelectedIds = function(myMultiSelect) {
  var selected = []
  var selectedObj = this.getSelected(myMultiSelect)
  for(var i = 0; i < selectedObj.length; i++) {
    selected = selected.concat(selectedObj[i].id)
  }
  return selected
}

MultiSelect.prototype.sendSelected = function(selected, myMultiSelect) {
  $.ajax({
    url: window.location.pathname,
    type: "GET",
    error: function(e) {
      console.log("Update failed");
      return null
    },
    success: function(data) {
      myMultiSelect.onSuccess(data)
    },
    data: { "multi_selected" : JSON.stringify(selected) },
    contentType: "application/json"
  })
}  


$(document).on("turbolinks:load", function() {
  //Add behavior to the Edit Volunteers form.
  var EditVolunteers = new MultiSelect("Eligible Volunteers", "Your Volunteers",
				       $('#volunteers-select'), $("#volunteers-submit"))
  EditVolunteers.onSuccess = function(data) {
    $('#success:hidden').show()
    location.replace(data.new_path)
  }
  //Create new volunteers version
  //Create new skills version
  //etc.
  EditVolunteers.init()

  var EditSkills = new MultiSelect("Eligible Skills", "Your Skills",
				   $('#skills-select'))
  EditSkills.init();
  var EditConstructionExperiences = new MultiSelect("Eligible Construction Experiences",
						    "Your Construction Experiences",
						    $("#const-exp-select"), undefined)
  EditConstructionExperiences.init()
  var EditDesignExperiences = new MultiSelect("Eligible Design Experiences",
					      "Your Design Experiences",
					      $("#des-exp-select"), undefined)
  EditDesignExperiences.init()
})