function update_accounts_list(e) {
  $.get(location.href, { search: $('#search_text_field').val(), order_by: $('#order_by_select').val() }, null, 'script');
}

$(function() {
  $('#order_by_select').change(update_accounts_list);
  $('#search_text_field').keyup(update_accounts_list);
});
