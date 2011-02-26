$(function() {
  $('#filter_form').bind('ajax:beforeSend', function() {
    $('#accounts_list').fadeOut('fast');
  });

  $('#order_by_select').change(function() { $('#filter_form').submit(); });
  $('#search_text_field').keyup(function() { $('#filter_form').submit(); });

  $('#search_text_field').autocomplete({
    source: '/accounts/autocomplete',
    minLength: 2
  });
});
