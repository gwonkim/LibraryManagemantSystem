<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://www.springframework.org/security/tags"
prefix="sec"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Lato"
      rel="stylesheet"
      type="text/css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
    ></script>
    <script src="${R}res/slide.js"></script>
    <script src="${R}res/contents.js"></script>
    <script src="${R}res/calendar.js"></script>
    <link rel="stylesheet" type="text/css" href="${R}res/calendar.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/tab.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/admin.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/slide.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
  </head>
  <body>
    <header>
      <nav class="top">
        <span>
          <a target="_blank" href="https://github.com/gwonkim" class="top_link"
            >깃허브</a
          >
          |
          <a target="_blank" href="https://github.com/gwonkim" class="top_link"
            >유튜브설명영상</a
          >
        </span>
      </nav>
      <nav class="nav">
        <span class="nav_left" id="navL">
          <img src="${R}image/library2.png" class="nav_img" />
        </span>
        <a class="nav_title" href="${R}">지원도서관</a>
        <sec:authorize access="not authenticated">
          <span class="nav_right" id="navR">
            <a href="${R}login" class="nav_link">로그인</a> |
            <a href="${R}signup" class="nav_link">회원가입</a>
          </span>
        </sec:authorize>

        <sec:authorize access="authenticated">
          <span class="nav_right" id="navR">
            <a href="${R}logout_processing" class="nav_link">로그아웃</a>
          </span>
        </sec:authorize>
      </nav>
    </header>

    <main class="contents" id="content">
      <aside class="left_contents">
        <div class="info">
          <span class="title">Admin</span>
          <div class="userInfo">
            <div>
              <p class="info_text">권한</p>
              <sec:authentication property="principal.department.name" />
            </div>
            <div>
              <p class="info_text">로그인ID</p>
              <sec:authentication property="name" />
            </div>
            <div>
              <p class="info_text">사용자</p>
              <sec:authentication property="principal.name" />
            </div>
            <div>
              <p class="info_text">이메일</p>
              <sec:authentication property="principal.email" />
            </div>

            <div>
              <span class="material-symbols-outlined"> settings </span>
              설정
            </div>
          </div>
        </div>
        <hr />
        <ul class="menu">
          <li onclick="location.href='${R}admin/book/list'" class="menu_btn">
            <span class="material-symbols-outlined">
              collections_bookmark
            </span>
            자료관리
          </li>
          <li onclick="location.href='${R}admin/user/list'" class="menu_btn">
            <span class="material-symbols-outlined"> manage_accounts </span>
            사용자관리
          </li>
          <li
            onclick="location.href='${R}admin/department/list'"
            class="menu_btn"
          >
            <span class="material-symbols-outlined"> group </span>
            그룹관리
          </li>
          <li onclick="location.href='${R}admin/book/state'" class="menu_btn">
            <span class="material-symbols-outlined"> new_label </span>
            대출/반납
          </li>
        </ul>

        <hr />
        <div id="calendar">
          <div id="calendar_header">
            <i class="icon-chevron-left"></i>
            <h1></h1>
            <i class="icon-chevron-right"></i>
          </div>
          <div id="calendar_weekdays"></div>
          <div id="calendar_content"></div>
        </div>
      </aside>

      <!-- 오른쪽 콘텐츠 -->
      <section class="right_contents">
        <section class="slide">
          <div><img src="${R}image/banner1.png" class="slide_img" /></div>
          <div><img src="${R}image/banner2.png" class="slide_img" /></div>
          <div><img src="${R}image/banner3.png" class="slide_img" /></div>
        </section>

        <div class="tab_menu">
          <ul>
            <li id="tab1" class="btnCon">
              <input type="radio" checked name="tab_menu" id="tab_menu1" />
              <label for="tab_menu1">menu1</label>
              <div class="tabContents">
                Lorem Ipsum is simply dummy text of the printing and typesetting
                industry. Lorem Ipsum has been the industry's standard dummy
                text ever since the 1500s, when an unknown printer took a galley
                of type and scrambled it to make a type specimen book. It has
                survived not only five centuries, but also the leap into
                electronic typesetting, remaining essentially unchanged. It was
                popularised in the 1960s with the release of Letraset sheets
                containing Lorem Ipsum passages, and more recently with desktop
                publishing software like Aldus PageMaker including versions of
                Lorem Ipsum.
              </div>
            </li>
            <li id="tab2" class="btnCon">
              <input type="radio" name="tab_menu" id="tab_menu2" />
              <label for="tab_menu2">menu2</label>
              <div class="tabContents">
                It is a long established fact that a reader will be distracted
                by the readable content of a page when looking at its layout.
                The point of using Lorem Ipsum is that it has a more-or-less
                normal distribution of letters, as opposed to using 'Content
                here, content here', making it look like readable English. Many
                desktop publishing packages and web page editors now use Lorem
                Ipsum as their default model text, and a search for 'lorem
                ipsum' will uncover many web sites still in their infancy.
                Various versions have evolved over the years, sometimes by
                accident, sometimes on purpose (injected humour and the like).
              </div>
            </li>
            <li id="tab3" class="btnCon">
              <input type="radio" name="tab_menu" id="tab_menu3" />
              <label for="tab_menu3">menu3</label>
              <div class="tabContents">
                There are many variations of passages of Lorem Ipsum available,
                but the majority have suffered alteration in some form, by
                injected humour, or randomised words which don't look even
                slightly believable. If you are going to use a passage of Lorem
                Ipsum, you need to be sure there isn't anything embarrassing
                hidden in the middle of text. All the Lorem Ipsum generators on
                the Internet tend to repeat predefined chunks as necessary,
                making this the first true generator on the Internet. It uses a
                dictionary of over 200 Latin words, combined with a handful of
                model sentence structures, to generate Lorem Ipsum which looks
                reasonable. The generated Lorem Ipsum is therefore always free
                from repetition, injected humour, or non-characteristic words
                etc.
              </div>
            </li>
          </ul>
        </div>

        <br />
        <br />
        <br />
        <br />
        <br />
      </section>
    </main>

    <footer>
      <nav>지원도서관</nav>
      <p>Copyright © 2022 jiwonKim. All rights reserved.</p>
    </footer>
  </body>
</html>
