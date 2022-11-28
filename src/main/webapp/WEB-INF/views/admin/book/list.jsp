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
      <sec:authorize access="authenticated">
        <span class="nav_right" id="navR">
          <a href="register" class="nav_link">자료 등록</a>
          <a href="state" class="nav_link">자료 대출 반납</a>
        </span>
      </sec:authorize>
    </nav>

    <main class="container">
      <!-- CONTENTS -->
      <br />
      <br />
      <form:form class="bookSearch" method="get" modelAttribute="pagination">
        <form:hidden path="pg" value="1" />
        <form:hidden path="sz" />
        <form:select path="srchTarget" class="form-control">
          <form:option value="total">통합검색</form:option>
          <form:option value="title">제목</form:option>
          <form:option value="author">저자</form:option>
          <form:option value="publisher">발행자</form:option>
        </form:select>
        <form:input type="text" path="keyword" placeholder="검색조건" />
        <button type="submit" class="search_btn">
          <span class="material-symbols-outlined"> search </span>
        </button>
      </form:form>

      <section>
        <c:forEach var="book" items="${ books }">
          <div class="contents" id="content">
            <!-- 책 이미지 -->
            <div class="bookImgContent">
              <c:if test="${ book.checkImg }">
                <img
                  class="bookImg"
                  src="${R}image/book/${book.id}.jpg"
                  alt="${book.title}의 이미지"
                />
              </c:if>
              <c:if test="${ !book.checkImg }">
                <img
                  class="bookImg"
                  src="${R}image/book/0.jpg"
                  alt="이미지 준비 중입니다."
                />
              </c:if>
            </div>
            <!-- 책 정보 -->
            <div class="bookInfoContent">
              <ul class="menu">
                <h2 class="bookTitle">${ book.title }</h2>
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
