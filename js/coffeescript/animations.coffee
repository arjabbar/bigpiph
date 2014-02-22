# Hide and Show video Arrows
$(document).ready (e) ->
  snap = Snap('.show-video-button')

  width = parseInt snap.attr('width')
  height = parseInt snap.attr('height')

  arrow = (snap, width, height, arrowWidth = 5) ->
    halfPoint = (width / 2)
    snap.polyline 0, 0,
      halfPoint, height, 
      width, 0, 
      halfPoint, height - arrowWidth,
      0, 0

  arrow(snap, width, height)

  snap2 = Snap(".hide-video-button")

  downArrow = arrow(snap2, width, height)

  $(downArrow.node).css
    transform: 'rotate(180deg)'
    'transform-origin': 'center'

# Main quote slide in effect
$(document).ready (e) ->
  delayBetweenEntrances = 200
  $('.main-quote [class*=line], .newsletter-signup')
    .css
      'margin-top': '0'
      opacity: 1
      transform: 'scale(1)'