const responsive = function() {
  let con = $("#content");
  let right = $(".right_contents");
  let left = $(".left_contents");
  
  if ($(window).width() < 601) {
    con.addClass("contentsM");
    con.removeClass("contents");
    left.addClass("mobile");
    right.addClass("mobile");
  } else {
    con.addClass("contents");
    con.removeClass("contentsM");
    left.removeClass("mobile");
    right.removeClass("mobile");
  }
};

$(responsive);
$(window).resize(responsive);
