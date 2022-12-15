$(function() {
  $("[data-url]").click(function() {
    var url = $(this).attr("data-url");
    location.href = url;
  })

  $("[data-confirm-delete]").click(function() {
    return confirm("삭제하시겠습니까?");
  })
})

const responsive = function() {
  let left = $("#navL");
  let right = $("#navR");

  if ($(window).width() < 1001) {
    left.removeClass("nav_left");
    left.addClass("navM_left");
    right.removeClass("nav_right");
    right.addClass("navM_right");
  } else {
    left.removeClass("navM_left");
    left.addClass("nav_left");
    right.removeClass("navM_right");
    right.addClass("nav_right");
  }
};

$(responsive);
$(window).resize(responsive);
