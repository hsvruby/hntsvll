$(function() {
  $('#order_by_select').change(function(e) {
    $.get(location.href, { order_by: $(this).val() }, null, 'script');
  });
});
