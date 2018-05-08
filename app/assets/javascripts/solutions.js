$.fn.solutions = function() {
  if (this.length === 0) { return false; }

  resizeSolution();

  $( window ).resize(function() {
    resizeSolution();
  });

  function resizeSolution() {
    $('.solution_image').each(function() {
      $(this).height($(this).width()*0.75);
    });
  }
};
