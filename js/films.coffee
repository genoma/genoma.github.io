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
  countIterations = 0

  $film.each ->
    $main = $(this)
    $filmName = $(this).attr "data-film"

    $.getJSON("http://www.omdbapi.com/?t=" + $filmName + "&plot=short&r=json").done (data, status) ->
      writeResults(data, $main)
      $main.attr "data-complete", "true"
      $main.attr "data-year", data.Year

      countIterations += 1

      if checkElements($film, countIterations)

        $filmWrapper.append $film.sort((a, b) ->
          return $(a).data("year") - $(b).data("year")
        )

        # RECACHE after the reordering
        $film = $(".film")

        giveMeDatas($film, ".results")

        writeGrid($film)

        $(".loading-gear").fadeOut 100

        $film.animate
          "opacity": '1'
        , 200

        return
    return
  return

@checkElements = (element, countIterations) ->
  elementLength = $(element).length
  if elementLength is countIterations
    return true
  else
    return false

writeGrid = (element) ->
  # write grid wrapper
  indexGWrapper = 0
  while indexGWrapper < element.length
    element.slice(indexGWrapper, indexGWrapper + 2).wrapAll '<div class="film-grid"></div>'
    indexGWrapper += 2

  # than write correct grid classes
  theIndex = 0
  $(element).each ->
    theIndex += 1
    if theIndex is 1
      $(this).addClass "film-left"
    else if theIndex is 2
      $(this).addClass "film-right"
      theIndex = 0
      return
  return


giveMeDatas = (element, eleToWrite) ->
  totalRatings = 0
  totalLoops = 0
  $(element).each ->
    ratings = parseInt($(".film-rating", this).html().slice( - 3))
    totalRatings += ratings
    totalLoops += 1
    mediumValue = Math.round((totalRatings / totalLoops) * 100) / 100
    $(eleToWrite).html("Average Votes: #{mediumValue}")
    return
