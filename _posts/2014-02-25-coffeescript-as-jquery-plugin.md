---
layout: post
title: jQuery Plugin con CoffeeScript
tags: coffeescript
---

**[CoffeeScript](http://coffeescript.org/)** permette di scrivere in una sintassi elegante e veloce **javascript** con qualsiasi libreria, e si integra alla perfezione con **[jQuery](http://jquery.com/)**.

## Plugin example

Per scrivere un plugin per **jQuery** in **CoffeeScript**:

### CoffeeScript
{% highlight coffeescript %}
# Reference jQuery
$ = jQuery

# Adds plugin object to jQuery
$.fn.extend
  # Change pluginName to your plugin's name.
  pluginName: (options) ->
    # Default settings
    settings =
      option1: true
      option2: false
      debug: false

    # Merge default settings with options.
    settings = $.extend settings, options

    # Simple logger.
    log = (msg) ->
      console?.log msg if settings.debug

    # _Insert magic here._
    return @each ()->
      log "Preparing magic show."
      # You can use your settings in here now.
      log "Option 1 value: #{settings.option1}"
{% endhighlight %}

### [Gist[!]](https://gist.github.com/genoma/9248932)
