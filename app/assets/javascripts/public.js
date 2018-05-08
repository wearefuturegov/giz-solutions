$(function(){
  $.ajaxSetup({
    cache: true,
    beforeSend: function( xhr ) {
      var token = $('meta[name="csrf-token"]').attr('content');
      if (token) xhr.setRequestHeader('X-CSRF-Token', token);
    }
  });
});

$(document).ready(function() {
  $('.simple_form').handleCharCount();

  $('#alerts').alerts();

  $('body').smoothScroll(750);

  $('.single_solution').solutions();

  $('.accordion').each(function() { $(this).accordion(); });

  $('.sticky_cont').sticky();
});

$(window).load(function() {
  $('.auto_fit_image').autoFitImage();
});


$(window).on('scroll', function () {
  var cur_pos = $(this).scrollTop();

  $('.home_sec').each(function() {
    var top = $(this).offset().top - $('.sticky_inner').outerHeight(),
        bottom = top + $(this).outerHeight();

    if (cur_pos >= top && cur_pos <= bottom) {
      $('.sticky_inner .active').removeClass('active');

      $('.sticky_inner').find('a[href="#'+$(this).attr('id')+'"]').addClass('active');
    }
  });
});
