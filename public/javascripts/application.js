$(function() {

  $('#order_by_select').change(function() { $('#filter_form').submit(); });

  $('#search_text_field').keyup(function() {
    var search_field = $(this);

    // Do not fire a search until the user has settled in the field for 1/2 second
    clearTimeout(search_field.data('search_delay'));
    search_field.data('search_delay', setTimeout(function() {
      if (search_field.data('search_value') != search_field.val()) {
        search_field.data('search_value', search_field.val());
        $('#filter_form').submit();
      }
    }, 500));
  });

  $('#search_text_field').autocomplete({
    source: '/accounts/autocomplete',
    minLength: 2
  });
});
