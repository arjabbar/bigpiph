$(document).ready ->
  $(document).foundation();
  $('.show-video-button, .hide-video-button').on 'click', ->
    $('.front-page-container').toggleClass 'active'
    $('.footer-container').toggleClass 'active'

  $(this).on('touchstart touchmove scroll', 'html, body', (e)-> e.preventDefault();)