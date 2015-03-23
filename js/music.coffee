---
---
writeResults = (data, element) ->
  $(".album-title", element).html data.album.name
  $(".album-artist", element).html data.album.artist

  $(".album-cover", element).css
    "background": "url(#{data.album.image[3]['#text']})"
    "background-size": "cover"
    "background-position": "center center"

  trackName = data.album.tracks.track
  trackNameLength = trackName.length
  if trackName.length <= 12
    $(".album-tracks", element).append("<li>#{track.name}</li>") for track in trackName
  else
    cutTrackNameLenght = trackNameLength - 12
    trackName.splice(- cutTrackNameLenght)
    trackName.push({"name": "...and more!"})
    $(".album-tracks", element).append("<li>#{track.name}</li>") for track in trackName

  $(".album-summary", element).html data.album.wiki.summary
  return

$ ->
  $music = $(".music")
  countIterations = 0

  $music.each ->
    $main = $(this)
    albumTitle = $(this).attr "data-music"
    albumArtist = $(this).attr "data-artist"

    $.getJSON("http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=4e44a8d0d650b86af1212f2b5b2f2f4b&artist=#{albumArtist}&album=#{albumTitle}&format=json").done (data, status) ->
      writeResults(data, $main)
      $main.attr "data-complete", "true"

      countIterations += 1

      if checkElements($music, countIterations)
        $(".loading-gear").fadeOut 120
        $music.animate
          "opacity": '1'
        , 200

      return
    return
  return
