(function() {
  $(document).on("turbolinks:load", function() {
    $('#user_first_name').autocomplete({
      source: ['UC Berkeley', 'UC SD', 'UCLA', "abcs"]
    });
    $('form').on('click', '.remove_fields', function(event) {
      $(this).closest('.field').next('br').remove();
      $(this).closest('.field').remove();
      return event.preventDefault();
    });
    return $('form').on('click', '.add_fields', function(event) {
      var regexp, time;
      time = new Date().getTime();
      regexp = new RegExp($(this).data('id'), 'g');
      $(this).before($(this).data('fields').replace(regexp, time));
      return event.preventDefault();
    });
  });

}).call(this);
