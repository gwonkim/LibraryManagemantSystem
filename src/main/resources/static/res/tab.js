const sizes = () => {
    let tabContents = $(".tabContents").outerHeight(true);
    $(".tab_footer").css("margin-top", `${tabContents + 300}px`);
  };

$(sizes);
$(window).resize(sizes);
