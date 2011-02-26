$(function() {
  $('#filter_form').bind('ajax:beforeSend', function() {
    $('#accounts_list').fadeOut('fast');
  });

  $('#order_by_select').change(function() { $('#filter_form').submit(); });

  $('#search_text_field').keyup(function() {
    // Do not fire a search until the user has settled in the field for ~1 second
    clearTimeout($(this).data('search_delay'));
    $(this).data('search_delay', setTimeout(function() {
      if ($(this).data('search_value') != $(this).val()) {
        $(this).data('search_value', $(this).val());
        $('#filter_form').submit();
      }
    }, 700));
  });

  $('#search_text_field').autocomplete({
    source: '/accounts/autocomplete',
    minLength: 2
  });
});
