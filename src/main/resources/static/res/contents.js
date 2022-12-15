const responsive = function () {
  let con = $("#content");
  let right = $(".right_contents");
  let left = $(".left_contents");
  let adminFooter = $("footer");

  if ($(window).width() < 601) {
    con.addClass("contentsM");
    con.removeClass("contents");
    left.addClass("mobile");
    right.addClass("mobile");
    adminFooter.css("margin-top", "800px");
  } else {
    adminFooter.css("margin-top", "200px");
    con.addClass("contents");
    con.removeClass("contentsM");
    left.removeClass("mobile");
    right.removeClass("mobile");
  }
};

$(responsive);
$(window).resize(responsive);
