$(document).ready(function(e){

  quotesAnimation = (localStorage || {}).quotesAnimation || 'fadeInUp';

  $('.main-quote [class*=line]').each(function(index, elem){
    setTimeout(function(){
      $(elem).addClass( quotesAnimation + ' animated' );
    }, index * 250);
  });
});