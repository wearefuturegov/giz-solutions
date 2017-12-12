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

  $('.single_solution').solutions();

  $('.auto_fit_image').autoFitImage();
});
