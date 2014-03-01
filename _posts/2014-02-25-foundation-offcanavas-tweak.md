---
layout: post
title: Foundation Off Canavas 100% Tweak
tags: Foundation
---

Su **Foundation5 v1.0.4** se `body,html{height:100%;}` l'**Offcanavas** menu non copre tutta la pagina - _con footer posizionato sempre sul fondo della pagina con contenuti che non arrivano al 100% dell'altezza del browser_.

## Soulzione

#### Coffeescript
{% highlight coffeescript %}
$ ->
  timer = undefined
  $(window).resize(->
    clearTimeout timer
    timer = setTimeout(->
      $(".inner-wrap").css "min-height", $(window).height() + "px"
      return
    , 40)
    return
  ).resize()
  return
{% endhighlight %}

#### jQuery
{% highlight js %}
$ ->
$(function() {
  var timer;
  timer = void 0;
  $(window).resize(function() {
    clearTimeout(timer);
    timer = setTimeout(function() {
      $(".inner-wrap").css("min-height", $(window).height() + "px");
    }, 40);
  }).resize();
});
{% endhighlight %}
