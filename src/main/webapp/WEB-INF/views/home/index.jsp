<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form" %> <%@ taglib uri="http://www.springframework.org/security/tags"
prefix="sec" %> <%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
    ></script>
    <script src="${R}res/common.js"></script>
    <script src="${R}res/newBooks.js"></script>
    <script src="${R}res/slide.js"></script>
    <script src="${R}res/cal.js"></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/cal.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/slide.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/newBook.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/book.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/notice.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/footer.css" />
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
          <a class="nav_title" href="${R}">
            <img src="image/icon_library.png" class="nav_img" />
          </a>
        </span>
        <sec:authorize access="not authenticated">
          <span class="nav_right" id="navR">
            <a href="${R}login" class="nav_link">로그인</a> |
            <a href="${R}signup" class="nav_link">회원가입</a>
          </span>
        </sec:authorize>

        <sec:authorize access="authenticated">
          <span class="nav_right" id="navR">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <a class="nav_link" href="${R}admin/index">나의 공간</a>
            </sec:authorize>
            <sec:authorize
              access="hasRole('ROLE_USER') || hasRole('ROLE_HONOR')"
            >
              <a class="nav_link" href="${R}user/index">나의 공간</a>
            </sec:authorize>
            <a href="${R}logout_processing" class="nav_link">로그아웃</a>
          </span>
        </sec:authorize>
      </nav>
    </header>

    <main>
      <section class="slide">
        <div><img src="${R}image/banner1.png" class="slide_img" /></div>
        <div><img src="${R}image/christmax.png" class="slide_img" /></div>
        <div><img src="${R}image/contest.png" class="slide_img" /></div>
      </section>

      <section class="btn_link">
        <button onclick="location.href='/book/list'">
          <span class="material-symbols-outlined"> search </span>
          <p>자료 검색</p>
        </button>
        <button onclick="location.href='/useInfo'">
          <span class="material-symbols-outlined"> comment_bank </span>
          <p>도서관 이용</p>
        </button>
        <button onclick="location.href='/book/new'">
          <span class="material-symbols-outlined"> collections_bookmark </span>
          <p>신규 도서</p>
        </button>
        <button onclick="location.href='/intro'">
          <span class="material-symbols-outlined"> lightbulb </span>
          <p>도서관 소개</p>
        </button>
      </section>

      <section class="newBook_Slider">
        <h1>신간도서</h1>
        <!-- 슬라이더 -->
        <div class="slides">
          <div class="active">
            <c:forEach var="book" items="${ newBooks }" varStatus="status">
              <c:if test="${ status.index  < 4}">
                <div class="newbook">
                  <c:if test="${ book.checkImg }">
                    <img
                      class="newBook_Img"
                      src="${R}image/book/${book.id}.jpg"
                      alt="${book.title}의 이미지"
                    />
                  </c:if>
                  <c:if test="${ !book.checkImg }">
                    <img
                      class="newBook_Img"
                      src="${R}image/book/0.jpg"
                      alt="이미지 준비 중입니다."
                    />
                  </c:if>
                  <h3
                    onclick="location.href='/book/detail?title=${book.title}'"
                    class="newBook_Title"
                  >
                    ${ book.title }
                  </h3>
                  <a class="book_link" href="/book/detail?title=${book.title}">
                    <p>${ book.author }</p>
                  </a>
                </div>
              </c:if>
            </c:forEach>
          </div>
          <div>
            <c:forEach var="book" items="${ newBooks }" varStatus="status">
              <c:if test="${ status.index  > 3 && status.index < 8}">
                <div class="newbook">
                  <c:if test="${ book.checkImg }">
                    <img
                      class="newBook_Img"
                      src="${R}image/book/${book.id}.jpg"
                      alt="${book.title}의 이미지"
                    />
                  </c:if>
                  <c:if test="${ !book.checkImg }">
                    <img
                      class="newBook_Img"
                      src="${R}image/book/0.jpg"
                      alt="이미지 준비 중입니다."
                    />
                  </c:if>
                  <h3 class="newBook_Title">${ book.title }</h3>
                  <p>${ book.author }</p>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
        <!-- 버튼 -->
        <div class="newBook_btns">
          <div class="active"></div>
          <div></div>
        </div>
      </section>

      <section class="cal_notice">
        <!-- 달력 -->
        <div class="sec_cal">
          <div class="cal_nav">
            <a href="javascript:;" class="nav-btn go-prev">prev</a>
            <div class="year-month"></div>
            <a href="javascript:;" class="nav-btn go-next">next</a>
          </div>
          <div class="cal_wrap">
            <div class="days">
              <div class="day">SUN</div>
              <div class="day">MON</div>
              <div class="day">TUE</div>
              <div class="day">WED</div>
              <div class="day">THU</div>
              <div class="day">FRI</div>
              <div class="day">SAT</div>
            </div>
            <div class="dates"></div>
          </div>
        </div>

        <div class='v-line'></div>

        <!-- 공지사항 -->
        <div class="idx_notice">
          <h2>
            <a href="${R}notice">공지사항</a>
          </h2>
          <ul>
            <c:forEach var="noti" items="${ notice }" varStatus="status">
              <c:if test="${ noti.pin }">
                <li>
                  <div class="idx_notice_pin_line">
                    <span class="material-symbols-outlined"> push_pin </span>
                    <a href="${R}notice/detail?id=${ noti.id }">
                      <span class="idx_notice_pin_title">${ noti.title }</span>
                      <span class="idx_notice_writer"
                        >${ noti.user.department.name }</span
                      >
                      <span class="idx_notice_date">${ noti.date }</span>
                    </a>
                  </div>
                </li>
              </c:if>
            </c:forEach>

            <c:forEach var="noti" items="${ notice }" varStatus="status">
              <c:if test="${ !noti.pin}">
                <li>
                  <div class="idx_notice_line">
                    <a href="${R}notice/detail?id=${ noti.id }">
                      <span class="idx_notice_title">${ noti.title }</span>
                      <span class="idx_notice_writer"
                        >${ noti.user.department.name }</span
                      >
                      <span class="idx_notice_date">${ noti.date }</span>
                    </a>
                  </div>
                </li>
              </c:if>
            </c:forEach>
          </ul>
        </div>
      </section>
    </main>
    <footer>
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
