$(document).ready ->

  SLIDE_DOWN_THRESHOLD = 100
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

  $(@).on 'touchstart', '.footer-container', (e)-> 
    firstFingerDown = e.originalEvent.changedTouches[0]
    fingerY = firstFingerDown.screenY

  $(@).on 'touchmove', '.footer-container', (e)-> 
    fingerDown = e.originalEvent.touches[0]
    distance = Math.abs(fingerDown.screenY - fingerY)
    moveDown(distance) if fingerY and fingerDown.screenY > fingerY
    $(@).trigger('touchend') if pastDragThreshold()

  $(@).on 'touchend', '.footer-container', (e)->
    if pastDragThreshold()
      showTopPage()
    else
      resetBottomPage()

  $(@).on 'scroll', showTopPage

  # Mouse drag touch events

  mouseY = null
  dragging = false

  $(@).on 'mousedown', '.footer-container', (e)->
    mouseY = e.clientY
    dragging = true

  $(@).on 'mousemove', '.footer-container', (e)->
    return unless dragging
    distance = Math.abs(e.clientY - mouseY)
    moveDown(distance) if mouseY and e.clientY > mouseY
    $(@).trigger('mouseup') if pastDragThreshold()

  $(@).on 'mouseup', '.footer-container', (e)->
    dragging = false
    if pastDragThreshold()
      showTopPage()
    else
      resetBottomPage()

  resetDragValues = ->
    fingerY = null
    distanceMoved = 0
    mouseY = 0