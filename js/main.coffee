$(document).ready ->

  SLIDE_DOWN_THRESHOLD = window.screen.height / 10
  log = (msg)-> console.log(msg)

  $(document).foundation();

  $footer = $('.footer-container')

  $('.show-video-button, .hide-video-button').on 'click', ->
    $('.front-page-container').toggleClass 'active'
    $footer.toggleClass 'active'

  fingerY = null
  distanceMoved = 0

  moveDown = (distance) ->
    $footer.css 'top', "+#{distance}px"
    distanceMoved += distance

  showTopPage = ->
    $('.hide-video-button').trigger('click')
    $footer.removeAttr('style')
    setTimeout -> 
      $footer.removeAttr('style')
    , 250
    resetDragValues()

  resetBottomPage = ->
    $footer.removeAttr('style')
    resetDragValues()

  pastDragThreshold = ->
    distanceMoved > SLIDE_DOWN_THRESHOLD

  Hammer($footer[0]).on 'swipedown', (e)-> 
    showTopPage()

  $('.logo').on 'click', showTopPage

  resetDragValues = ->
    fingerY = null
    distanceMoved = 0
    mouseY = 0