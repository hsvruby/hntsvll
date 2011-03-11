// Don't Stop Believing... Hold on to that feeling.
// Just because I thought that was a good name for this.  Don't fight it.
// http://www.youtube.com/watch?v=2NQIPVqLMUg

var currentPage = 1;

// We need to check the scroll as soon as the page loads.
$(function(){
  checkScroll();
});

function checkScroll() {
  if (nearBottomOfPage()) {
    currentPage++;
     $.get('/accounts.js?page=' + currentPage);
  } else {
    setTimeout("checkScroll()", 250);
  }
}

function nearBottomOfPage() {
  return scrollDistanceFromBottom() < 150;
}

function scrollDistanceFromBottom(argument) {
  return pageHeight() - (window.pageYOffset + self.innerHeight);
}

function pageHeight() {
  return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}
