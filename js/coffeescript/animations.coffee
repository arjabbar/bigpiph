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
