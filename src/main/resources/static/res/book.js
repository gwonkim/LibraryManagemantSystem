const bookResponsive = function () {
  let form = $("form");
  let content = $("section").children("#content");
    if ($(window).width() < 901) {
      content.addClass("contentsM");
      content.removeClass("contents");
    } else {
      content.addClass("contents");
      content.removeClass("contentsM");
    }
};

$(bookResponsive);
$(window).resize(bookResponsive);
