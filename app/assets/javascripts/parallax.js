$(window).scroll(function(pos) {
  var wScroll = $(this).scrollTop();

  $('.parallax').css({
    'transform': 'translate(0px, ' + wScroll / -54 + '%)'
  })
})
