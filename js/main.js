// Generated by CoffeeScript 1.7.0
(function() {
  $(document).ready(function() {
    $(document).foundation();
    return $('.show-video-button, .hide-video-button').on('click', function() {
      $('.front-page-container').toggleClass('active');
      return $('.footer-container').toggleClass('active');
    });
  });

}).call(this);
