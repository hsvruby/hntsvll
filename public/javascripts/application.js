$(function() {
  // Sort and Filter fields
  $('#filter_form select').change(function() {
    reset_page();
  });


  // Search field
  function fire_search() {
    var search_field = $(this);

    // Do not fire a search until the user has settled in the field for 1/2 second
    clearTimeout(search_field.data('search_delay'));
    search_field.data('search_delay', setTimeout(function() {
      if (search_field.data('search_value') != search_field.val()) {
        search_field.data('search_value', search_field.val());

        reset_page(); 
      }
    }, 500));
  }

  $('#search_text_field').keyup(fire_search);

  $('#search_text_field').autocomplete({
    source: '/accounts/autocomplete',
    minLength: 2,
    select: fire_search
  });
  
  function reset_page() {
    $('#page_hidden_field').val("1");
    $('#filter_form').submit();
  }
});

// history
if (history && history.pushState) {
  window.previousData = "";

  $(function() {
    $('#filter_form').submit(function() {
      action = $(this).attr('action');
      data = $('#search_text_field, div.searchandsort select').serialize();

      // Only change history if data has changed
      if (data != window.previousData) {
        history.pushState(null, document.title, action + '?' + data);
        window.previousData = data;
      }
    });

    $(window).bind('popstate', function() {
      $.getScript(location.href);
    });
  });


}
