
$(function() {
  $('#order_by_select').change(function() { $('#filter_form').submit(); });
  $('#search_text_field').keyup(function() { $('#filter_form').submit(); });
});
