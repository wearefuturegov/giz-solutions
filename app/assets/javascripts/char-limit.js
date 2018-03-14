$.fn.handleCharCount = function() {

  $(this).find("textarea").each(function() {
    $(this).siblings("span.char_count").text("Remaining characters: " + (parseInt($(this).attr('maxlength')) - $(this).val().length));
  });
  $(this).find("input").each(function() {
    $(this).siblings("span.char_count").text("Remaining characters: " + (parseInt($(this).attr('maxlength')) - $(this).val().length));
  });

  $(this).find("textarea").bind('change keyup paste', textareaChange);
  $(this).find("input").bind('change keyup paste', textareaChange);

  function textareaChange() {
    if($(this).siblings("span.char_count").length){
      limitText($(this), $(this).siblings("span.char_count"), parseInt($(this).attr('maxlength')));
    }
  }

  function limitText(limitField, limitCount, limitNum) {
    if (limitField.val().length > limitNum) {
      limitField.val(limitField.val().substring(0, limitNum));
    } else {
      limitCount.text("Remaining characters: " + (limitNum - limitField.val().length));
    }
  }
};
