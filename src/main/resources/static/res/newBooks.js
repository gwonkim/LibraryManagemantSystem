$(function () {
  $(".newBook_Slider > .newBook_btns > div").click(function () {
    let index = $(this).index();

    $(this).addClass("active");
    $(this).siblings(".active").removeClass("active");

    let slider = $(this).parent().parent();
    let current = slider.find(" > .slides > div.active");
    let post = slider.find(" > .slides > div").eq(index);

    current.removeClass("active");
    post.addClass("active");
  });

  let index = 1;
  setInterval(function () {
    $(".newBook_Slider > .newBook_btns > div").eq(index).click();
    index = (index == 1 ? 0 : 1);
  }, 3000);
});
