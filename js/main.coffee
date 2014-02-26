$(document).ready ->

  $(document).foundation();
  
  screen = window.screen
  height = window.innerHeight
  width = window.innerWidth

  $('.front-page-container, .footer-container')
    .height(height)
    .width(width)

  SHOW_VIDEO_BUTTON_MARGIN = 20
  $showVideoButton = $ '.show-video-button'
  $hideVideoButton = $ '.hide-video-button'

  $showVideoButton.css('top', "#{(height - $showVideoButton.height()) - SHOW_VIDEO_BUTTON_MARGIN}px")

  $footer = $('.footer-container')

  window.scrollToTop = $.smoothScroll.bind(window, scrollTarget: $('.front-page-container'))

  $('.show-video-button').on 'click touchdown', (e) ->
    $.smoothScroll scrollTarget: $('.footer-container')

  $('.hide-video-button, .left-off-canvas-toggle').on 'click touchdown', (e) ->
    $.smoothScroll scrollTarget: $('front-page-container')

  $('.logo').on 'click', scrollToTop

  $(@).on 'scroll', (e) ->
    if window.scrollY > (height / 2) 
      $('.footer-container').addClass 'active'
      $('.front-page-container').removeClass 'active'
    else
      $('.footer-container').removeClass 'active'
      $('.front-page-container').addClass 'active'

  window.setTimeout ->
    $('body').css('opacity', 1).css('display', 'initial')
  , 1500