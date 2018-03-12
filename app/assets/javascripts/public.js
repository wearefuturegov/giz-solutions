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

  $('.accordion').each(function() { $(this).accordion() });
});

$(window).load(function() {
  $('.auto_fit_image').autoFitImage();
});
