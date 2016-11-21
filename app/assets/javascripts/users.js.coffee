jQuery ->
    $('#user_first_name').autocomplete
        source: ['UC Berkeley', 'UC SD', 'UCLA', "abcs"]
    
    $('form').on 'click', '.remove_fields', (event) ->
    	$(this).closest('.field').remove()
    	event.preventDefault()

    $('form').on 'click', '.add_fields', (event) ->
    	time = new Date().getTime()
    	regexp = new RegExp($(this).data('id'), 'g')
    	$(this).before($(this).data('fields').replace(regexp, time))
    	event.preventDefault()
