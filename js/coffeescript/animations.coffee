$(document).ready (e) ->
  quotesAnimation = (localStorage or {}).quotesAnimation or "fadeInUp"
  $(".main-quote [class*=line]").each (index, elem) ->
    setTimeout (->
      $(elem).addClass quotesAnimation + " animated"
      return
    ), index * 250
    return

  fillWithSVG = (element) ->
    $elem = $(element)
    $elem.css "position", "relative"
    snap = new Snap($elem.width(), $elem.height())
    snap.attr
      position: "absolute"
      top: 0
      left: 0

    $elem.append snap.node
    snap

  $("a.red").each (index, elem) ->
    snap = fillWithSVG(elem)
    return

  return


# rect = snap.rect(0, 0, '100%', '100%');
