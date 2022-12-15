<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${R}res/common.js"></script>
    <script src="${R}res/book.js"></script>
    <script src="${R}res/tab.js"></script>
    <!-- <script src="${R}res/map.js"></script> -->
    <script
      type="text/javascript"
      src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dr8e6axke4&submodules=geocoder"
    ></script>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link rel="stylesheet" type="text/css" href="${R}res/tab.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/admin.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/info.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/table.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/footer.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/steps.css" />
  </head>
  <body>
    <header>
      <nav class="top">
        <span>
          <a target="_blank" href="https://github.com/gwonkim" class="top_link"
            >깃허브</a
          >
          |
          <a target="_blank" href="https://youtu.be/WIbRvyn0lQo" class="top_link"
            >유튜브설명영상</a
          >
        </span>
      </nav>
      <nav class="nav">
        <span class="nav_left" id="navL">
          <a class="nav_title" href="${R}">
            <img src="image/icon_library.png" class="nav_img" />
          </a>
        </span>
      </nav>
    </header>

    <main class="contents" id="content">
      <div class="tab_menu">
        <ul>
          <li id="tab1" class="btnCon">
            <input type="radio" name="tab_menu" id="tab_menu1" />
            <label for="tab_menu1">인사말</label>
            <div class="tabContents">
              <div class="info_text">
                <img src="${R}image/front.png" class="info_img" />
                <p class="info_title">안녕하십니까</p>
                <p class="info_con1">
                  지원도서관장 김지원입니다.
                  <br />
                  도서관을 찾아주신 모두를 환영합니다.
                  <br />
                  <br />
                  지원도서관장 <span>김지원</span>
                </p>
                <hr />

                <p class="info_con2">
                  지원의 대표도서관 지원도서관에 오신 것을 환영합니다.
                </p>
                <p class="info_con2">
                  지원도서관은 2022년 개관하여 지원시민이 언제, 어디서나
                  편리하게 이용할 수 있습니다. 통합적 모바일, 웹 서비스 강화로
                  지원시민의 정보 접근권을 확대하고, 꿈과 희망을 실현하기 위해
                  다양한 경험과 지식이 담겨있는 공간입니다.
                </p>
                <p class="info_con2">
                  도서관은 지식과 더불어 사람과 사람 그리고 사람과 지역이 만나는
                  숲입니다. 지원도서관은 단순한 지식 전달을 넘어 자신을 발견하고
                  꿈과 희망이 공존하는 공간으로 지원시민과 함께
                  성장해나가겠습니다.
                </p>
                <p class="info_con2">
                  지원시민이 필요한 정보와 지식을 손쉽게 이용하고 풍부한 자료를
                  구축하도록 노력해 삶과 질의 향상에 기여하도록 최선의 노록을
                  다하겠습니다.
                </p>
                <p class="info_con2">
                  지원도서관은 지원시민 여러분의 성장과 발전에 기여하는 존재가
                  되겠습니다. 여러분의 많은 관심과 지원 부탁드립니다.
                </p>
              </div>
            </div>
          </li>
          <li id="tab2" class="btnCon">
            <!-- checked -->
            <input type="radio" checked name="tab_menu" id="tab_menu2" />
            <label for="tab_menu2">찾아오시는 길</label>
            <div class="tabContents">
              <div id="map" style="width: 100%; height: 450px"></div>
              <script>
                var map = new naver.maps.Map("map", {
                  center: new naver.maps.LatLng(
                    37.4874312533318,
                    126.826108231406
                  ),
                  zoom: 17,
                  minZoom: 6,
                  zoomControl: true,
                  zoomControlOptions: {
                    position: naver.maps.Position.LEFT_BOTTOM,
                  },
                });

                var marker = new naver.maps.Marker({
                  position: new naver.maps.LatLng(
                    37.4874312533318,
                    126.826108231406
                  ),
                  map: map,
                });
              </script>
              <p class="info_title">
                <span class="material-symbols-outlined map_icon">
                  pin_drop </span
                >주소
              </p>
              <p class="info_con1">
                (08359) 서울특별시 구로구 연동로 320 성공회대학교
              </p>
              <p class="info_con2"></p>
              <p class="info_title">
                <span class="material-symbols-outlined map_icon">
                  directions_subway </span
                >지하철
              </p>
              <p class="info_con2">
                1호선 온수역(성공회대입구역) 1번 출구-도보 10분
              </p>
              <p class="info_con2">
                7호선 온수역(성공회대입구역) 2번 출구-도보 10분
              </p>
            </div>
          </li>
          <!-- <li id="tab2" class="btnCon">
            <input type="radio" name="tab_menu" id="tab_menu3" />
            <label for="tab_menu3">연혁</label>
            <div class="tabContents">
              <div class="steps"></div>
              <div class="dot"></div>

            </div>
          </li> -->
        </ul>
      </div>
    </main>

    <footer class="tab_footer">
      <p>지원도서관 | (08359) 서울특별시 구로구 연동로 320 성공회대학교</p>
      <p>졸업작품 | IT융합자율학부 201914126 김지원</p>
      <p>Email | jiwonk427@gmail.com</p>
      <p>
        프로젝트 Github |
        <a href="https://github.com/gwonkim/LibrarySystem" target="_blank"
          >LibrarySystem</a
        >
      </p>
      <br />
      <p>Copyright © 2022 jiwonKim. All rights reserved.</p>
    </footer>
  </body>
</html>
