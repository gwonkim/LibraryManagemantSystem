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
    <link rel="stylesheet" type="text/css" href="${R}res/slide.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/newBook.css" />
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
          <img src="image/library2.png" class="nav_img" />
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
        <div><img src="${R}image/banner2.png" class="slide_img" /></div>
        <div><img src="${R}image/banner3.png" class="slide_img" /></div>
      </section>

      <section class="btn_link">
        <button onclick="location.href='/book/list'">
          <span class="material-symbols-outlined"> search </span>
          <p>자료검색</p>
        </button>
        <button onclick="location.href='/book/list'">
          <span class="material-symbols-outlined"> comment_bank </span>
          <p>희망도서</p>
        </button>
        <button onclick="location.href='/book/new'">
          <span class="material-symbols-outlined"> collections_bookmark </span>
          <p>신규도서</p>
        </button>
        <button onclick="location.href='/info'">
          <span class="material-symbols-outlined"> lightbulb </span>
          <p>안내정보</p>
        </button>
      </section>

      <section class="newBook_Slider">
        <div class="slides">
          <div class="active">
            <c:forEach var="book" items="${ newBooks }" varStatus="status">
              <c:if test="${ status.index  < 4}">
                <div class="newbook">
                  <c:if test="${ book.isImg == true }">
                    <img
                      class="bookImg"
                      src="${R}image/book/${book.id}.jpg"
                      alt="${book.title}의 이미지"
                    />
                  </c:if>
                  <c:if test="${ book.isImg == false }">
                    <img
                      class="bookImg"
                      src="${R}image/book/0.jpg"
                      alt="${book.title}의 이미지"
                    />
                  </c:if>
                  <h3 class="newBook_Title">${ book.title }</h3>
                  <p>${ book.author }</p>
                </div>
              </c:if>
            </c:forEach>
          </div>
          <div>
            <c:forEach var="book" items="${ newBooks }" varStatus="status">
              <c:if test="${ status.index  > 3 && status.index < 8}">
                <div class="newbook">
                  <img
                    class="newBook_Img"
                    src="${R}image/book/${book.id}.jpg"
                    alt="${book.title}의 이미지"
                  />
                  <h3 class="newBook_Title">${ book.title }</h3>
                  <p>${ book.author }</p>
                </div>
              </c:if>
            </c:forEach>
          </div>
        </div>
        <div class="newBook_btns">
          <div class="active"></div>
          <div></div>
        </div>
        <h1>신간도서</h1>
      </section>
    </main>

    <footer>
      <nav>지원도서관</nav>
      <p>Copyright © 2022 jiwonKim. All rights reserved.</p>
    </footer>
  </body>
</html>
