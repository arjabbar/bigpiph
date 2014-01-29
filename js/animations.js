$(document).ready(function(e){

  quotesAnimation = (localStorage || {}).quotesAnimation || 'fadeInUp';

  $('.main-quote [class*=line]').each(function(index, elem){
    setTimeout(function(){
      $(elem).addClass( quotesAnimation + ' animated' );
    }, index * 250);
  });

  var fillWithSVG = function(element){
    $elem = $(element);
    $elem.css('position', 'relative');
    snap = new Snap($elem.width(), $elem.height());
    snap.attr({position: 'absolute', top: 0, left: 0});
    $elem.append(snap.node);
    return snap;
  };

  $('a.red').each(function(index, elem){
    snap = fillWithSVG(elem);
    // rect = snap.rect(0, 0, '100%', '100%');
  });


});