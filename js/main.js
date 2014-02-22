// Generated by CoffeeScript 1.7.0
(function() {
  $(document).ready(function() {
    var $footer, SLIDE_DOWN_THRESHOLD, distanceMoved, dragging, fingerY, log, mouseY, moveDown, pastDragThreshold, resetBottomPage, resetDragValues, showTopPage;
    SLIDE_DOWN_THRESHOLD = 100;
    log = function(msg) {
      return console.log(msg);
    };
    $(document).foundation();
    $footer = $('.footer-container');
    $('.show-video-button, .hide-video-button').on('click', function() {
      $('.front-page-container').toggleClass('active');
      return $footer.toggleClass('active');
    });
    fingerY = null;
    distanceMoved = 0;
    moveDown = function(distance) {
      $footer.css('top', "+" + distance + "px");
      return distanceMoved += distance;
    };
    showTopPage = function() {
      $('.hide-video-button').trigger('click');
      $footer.removeAttr('style');
      setTimeout(function() {
        return $footer.removeAttr('style');
      }, 250);
      return resetDragValues();
    };
    resetBottomPage = function() {
      $footer.removeAttr('style');
      return resetDragValues();
    };
    pastDragThreshold = function() {
      return distanceMoved > SLIDE_DOWN_THRESHOLD;
    };
    $(this).on('touchstart', '.footer-container', function(e) {
      var firstFingerDown;
      firstFingerDown = e.originalEvent.changedTouches[0];
      return fingerY = firstFingerDown.screenY;
    });
    $(this).on('touchmove', '.footer-container', function(e) {
      var distance, fingerDown;
      fingerDown = e.originalEvent.touches[0];
      distance = Math.abs(fingerDown.screenY - fingerY);
      if (fingerY && fingerDown.screenY > fingerY) {
        moveDown(distance);
      }
      if (pastDragThreshold()) {
        return $(this).trigger('touchend');
      }
    });
    $(this).on('touchend', '.footer-container', function(e) {
      if (pastDragThreshold()) {
        return showTopPage();
      } else {
        return resetBottomPage();
      }
    });
    $(this).on('scroll', showTopPage);
    mouseY = null;
    dragging = false;
    $(this).on('mousedown', '.footer-container', function(e) {
      mouseY = e.clientY;
      return dragging = true;
    });
    $(this).on('mousemove', '.footer-container', function(e) {
      var distance;
      if (!dragging) {
        return;
      }
      distance = Math.abs(e.clientY - mouseY);
      if (mouseY && e.clientY > mouseY) {
        moveDown(distance);
      }
      if (pastDragThreshold()) {
        return $(this).trigger('mouseup');
      }
    });
    $(this).on('mouseup', '.footer-container', function(e) {
      dragging = false;
      if (pastDragThreshold()) {
        return showTopPage();
      } else {
        return resetBottomPage();
      }
    });
    return resetDragValues = function() {
      fingerY = null;
      distanceMoved = 0;
      return mouseY = 0;
    };
  });

}).call(this);
