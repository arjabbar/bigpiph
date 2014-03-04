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

  $('.left-off-canvas-toggle').on 'click', (e) ->
    $('.left-off-canvas-menu').show()

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
  , 500

  $('.inner-wrap').on 'transitionend otransitionend webkitTransitionEnd oTransitionEnd', (e) ->
    if $(e.target).hasClass('inner-wrap out')
      $('.newsletter-signup input').focus()
      $('.left-off-canvas-menu').hide()
    if $(e.target).hasClass('inner-wrap')
      $(e.target).toggleClass('out')

  $("#mc-embedded-subscribe-form").on 'keydown', (e) ->
    if e.keyCode == 13
      $(@).submit()

  $("#mc-embedded-subscribe-form").submit ->
    url = $(@).attr 'action'
    $.ajax
      type: "POST"
      url: url
      data: $(@).serialize()
      success: ->
          alert(data)
    $('#thank-you-message').fadeIn()
    $(@).hide()
    false
