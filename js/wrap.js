// may seems complex, but it's just for changing the title and
// prevent the right font awesome quote to breack the title flow

$(function(){
  $(".the-wrapped-title").each(function() {
    var html = $(this).html();
    var lastIndex = html.lastIndexOf(" ");
    var lessLast = html.substring(0, lastIndex);

    var last = html.split(" ").pop();
    var lastPlus = ' <span class="nospace">' + last + ' <i class="fa fa-quote-right article-sign"></i></span>';
    var completeString = lessLast + lastPlus;

    $(this).after(completeString);
    $(this).remove();

  });
});
