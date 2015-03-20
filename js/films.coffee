---
---

# Write the right content
writeResults = (data, element) ->
  $(".film-title", element).html data.Title
  $(".film-year", element).html data.Year
  $(".film-genre", element).html data.Genre
  $(".film-director", element).html data.Director
  $(".film-actors", element).html data.Actors
  $(".film-rating", element).html "IMDB: #{data.imdbRating}"
  $(".film-plot", element).html data.Plot

$ ->
  $film = $(".film")
  $filmWrapper = $(".film-wrapper")

  $film.each ->
    main = this
    filmName = $(this).attr "data-film"

    $.getJSON("http://www.omdbapi.com/?t=" + filmName + "&plot=short&r=json").done (data, status) ->
      writeResults(data, main)
      $(main).attr "data-complete", "true"
      $(main).attr "data-year", data.Year

      if checkElements($film)
        $filmWrapper.append $film.sort((a, b) ->
          return $(a).data("year") - $(b).data("year")
        )

        # RECACHE after the reordering
        $film = $(".film")

        writeGrid($film)

        $film.animate
          "opacity": '1'
        , 200

        $(".loading-films").fadeOut 100

        return
    return
  return

checkElements = (element) ->
  result = null
  elementLength = $(element).length
  howMany = 0
  $(element).each ->
    if $(this).attr "data-complete"
      howMany++
      if howMany is elementLength
        result = true
    else
      result = false
  return result

writeGrid = (element) ->
  # write grid wrapper
  indexGWrapper = 0
  while indexGWrapper < element.length
    element.slice(indexGWrapper, indexGWrapper + 2).wrapAll '<div class="film-grid"></div>'
    indexGWrapper += 2

  # than write correct grid classes
  theIndex = 0
  $(element).each ->
    theIndex++
    if theIndex is 1
      $(this).addClass "film-left"
    else if theIndex is 2
      $(this).addClass "film-right"
      theIndex = 0
      return
  return
