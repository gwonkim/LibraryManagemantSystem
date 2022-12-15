const bookResponsive = function () {
  let info = $(".bookInfoContent");
  let img = $(".bookImgContent");
  let story = $(".bookStoryContent");
  let content = $("section").children("#content");
  let bookImg = $("#bookImgs");


  if ($(window).width() < 751) {
      info.css("width", "100%");
      img.css("width", "100%");
      story.css("margin-top", "50px");
      console.log('12222222232344dfdsfsffdddddddddddddddddddddddddd234')
      /*       console.log('12222222232344234')
      content.addClass("contentsM");
      content.removeClass("detailContents");
      content.addClass("bookImg");
      content.removeClass("bookDetailImg"); */
    } else {
      story.css("margin-top", "200px");
      console.log('12222222232344234===============')
      img.css("width", "50%");
      info.css("width", "40%");
      /*       console.log('12222222232344234')
      content.addClass("bookDetailImg");
      content.removeClass("bookImg"); */
    }
};

$(bookResponsive);
$(window).resize(bookResponsive);
