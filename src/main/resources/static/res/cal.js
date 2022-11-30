const calendarInit = () => {
  let date = new Date(); // 현재 날짜
  let utc = date.getTime() + date.getTimezoneOffset() * 60 * 1000; // uct 표준
  let kstGap = 9 * 60 * 60 * 1000; // 한국 kst
  let today = new Date(utc + kstGap); // 한국 시간
  let thisMonth = new Date(
    today.getFullYear(),
    today.getMonth(),
    today.getDate()
  );

  let currentYear = thisMonth.getFullYear(); // 년
  let currentMonth = thisMonth.getMonth(); // 월
  let currentDate = thisMonth.getDate(); // 일
  renderCalender(thisMonth);

  function renderCalender(thisMonth) {
    currentYear = thisMonth.getFullYear();
    currentMonth = thisMonth.getMonth();
    currentDate = thisMonth.getDate();

    // 이전 달의 마지막 날짜, 요일
    let startDay = new Date(currentYear, currentMonth, 0);
    let prevDate = startDay.getDate();
    let prevDay = startDay.getDay();

    // 이번 달의 마지막 날짜, 요일
    let endDay = new Date(currentYear, currentMonth + 1, 0);
    let nextDate = endDay.getDate();
    let nextDay = endDay.getDay();

    // 현재 월 표기
    $(".year-month").text(currentYear + "." + (currentMonth + 1));

    calendar = document.querySelector(".dates");
    calendar.innerHTML = "";

    // 지난달
    for (let i = prevDate - prevDay; i <= prevDate; i++) {
      calendar.innerHTML =
        calendar.innerHTML + '<div class="day prev disable">' + i + "</div>";
    }
    // 이번달
    for (let i = 1; i <= nextDate; i++) {
      calendar.innerHTML =
        calendar.innerHTML + '<div class="day current">' + i + "</div>";
    }
    // 다음달
    for (let i = 1; i <= (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
      calendar.innerHTML =
        calendar.innerHTML + '<div class="day next disable">' + i + "</div>";
    }

    // 오늘 날짜 표기
    if (today.getMonth() == currentMonth) {
      todayDate = today.getDate();
      let currentMonthDate = document.querySelectorAll(".dates .current");
      currentMonthDate[todayDate - 1].classList.add("today");
    }
  }

  // 이전달로 이동
  $(".go-prev").on("click", function () {
    thisMonth = new Date(currentYear, currentMonth - 1, 1);
    renderCalender(thisMonth);
  });

  // 다음달로 이동
  $(".go-next").on("click", function () {
    thisMonth = new Date(currentYear, currentMonth + 1, 1);
    renderCalender(thisMonth);
  });
};

const changeStyle = () => {
  let cal = $(".cal_notice");
  let line = $(".v-line");
  let idxN = $(".idx_notice");
  let idxNLi = $(".idx_notice li");

  if ($(window).width() < 985) {
    console.log("12323");
    cal.css("display", "block");
    cal.css("margin-top", "500px");
    line.css("visibility", "hidden");
    idxN.css("width", "100%");
    idxNLi.css("width", "80%");
  } else {
    cal.css("display", "inline-flex");
    cal.css("margin-top", "150px");
    line.css("visibility", "visible");
    idxN.css("width", "70%");
    idxNLi.css("width", "100%");
  }
}


$(calendarInit);
$(changeStyle);
$(window).resize(changeStyle);
