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
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link rel="stylesheet" type="text/css" href="${R}res/common.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/book.css" />
  </head>
  <body>
    <div class="top">
      <span>
        <a target="_blank" href="https://github.com/gwonkim" class="top_link"
          >깃허브</a
        >
        |
        <a target="_blank" href="https://github.com/gwonkim" class="top_link"
          >유튜브설명영상</a
        >
      </span>
    </div>
    <div class="nav">
      <span class="nav_left" id="navL">
        <img src="${R}image/library2.png" class="nav_img" />
      </span>
      <a class="nav_title" href="${R}">지원도서관</a>
    </div>
    <main class="container">
      <!-- CONTENTS -->
      <h1>신규도서</h1>
      <br />
      <br />
      <form:form method="get" modelAttribute="pagination">
        <form:hidden path="pg" value="1" />
        <form:hidden path="sz" />
        <form:hidden path="id" value="1" />
      </form:form>

      <section>
        <c:forEach var="book" items="${ newBooks }">
          <div class="contents" id="content">
            <!-- 책 이미지 -->
            <div class="bookImgContent">
              <c:if test="${ book.checkImg }">
                <a class="book_link" href="/book/detail?title=${book.title}">
                  <img
                    class="bookImg"
                    src="${R}image/book/${book.id}.jpg"
                    alt="${book.title}의 이미지"
                  />
                </a>
              </c:if>
              <c:if test="${ !book.checkImg }">
                <a class="book_link" href="/book/detail?title=${book.title}">
                  <img
                    class="bookImg"
                    src="${R}image/book/0.jpg"
                    alt="이미지 준비 중입니다."
                  />
                </a>
              </c:if>
            </div>
            <!-- 책 정보 -->
            <div class="bookInfoContent">
              <ul class="menu">
                <a class="book_link" href="/book/detail?title=${book.title}">
                  <h2 class="bookTitle">${ book.title }</h2>
                </a>
                <li class="bookInfo"><span>저자</span>${ book.author }</li>
                <li class="bookInfo"><span>발행자</span>${ book.publisher }</li>
                <li class="bookInfo"><span>ISBN</span>${ book.isbn }</li>
                <li class="bookInfo"><span>청구기호</span>${ book.callNum }</li>
                <li class="bookInfo">
                  <span>분류</span>
                  ${ book.category.id }${ book.category.name }
                </li>
                <li class="bookInfo state">${ book.state.state }</li>
              </ul>
            </div>
          </div>
        </c:forEach>
      </section>

      <my:pagination
        pageSize="${ pagination.sz }"
        recordCount="${ pagination.recordCount }"
        queryStringName="pg"
      />
    </main>
  </body>
</html>
