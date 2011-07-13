// Don't Stop Believing... Hold on to that feeling.
// Just because I thought that was a good name for this.  Don't fight it.
// http://www.youtube.com/watch?v=2NQIPVqLMUg

// We need to check the scroll as soon as the page loads.
$(function(){
  setInterval('checkScroll();', 500);
});

function checkScroll() {
  var totalPages = parseInt($('#total_page_hidden_field').val());
  var currentPage =  parseInt($('#page_hidden_field').val());
  var nextPage = currentPage + 1;
  
  if (nearBottomOfPage() && nextPage <= totalPages) {
    $('#page_hidden_field').val(nextPage);
    $('#filter_form').submit();
  }
}

function nearBottomOfPage() {
  return scrollDistanceFromBottom() < 150;
}

function scrollDistanceFromBottom() {
  return pageHeight() - (window.pageYOffset + self.innerHeight);
}

function pageHeight() {
  return Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight);
}
