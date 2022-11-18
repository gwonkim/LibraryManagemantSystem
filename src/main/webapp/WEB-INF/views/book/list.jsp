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
    <link rel="stylesheet" type="text/css" href="${R}res/common.css" />
    <!-- <link rel="stylesheet" type="text/css" href="${R}res/table.css" /> -->
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/book.css" />
    <!--   <link rel="stylesheet" type="text/css" href="${R}res/admin.css" /> -->
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

    <div class="container">
      <!-- CONTENTS -->
      <h1>자료 목록</h1>
      <br />
      <form:form method="get" modelAttribute="pagination">
        <form:hidden path="pg" value="1" />
        <form:hidden path="sz" />
        <span>분류:</span>
        <form:select path="ci" class="form-control">
          <form:option value="-1">전체</form:option>
          <form:options
            itemValue="id"
            itemLabel="name"
            items="${ categories }"
          />
        </form:select>
        <button type="submit" class="btn">검색</button>
      </form:form>

      <!-- <table class="list">
        <thead>
          <tr>
            <th>아이디</th>
            <th>자료명</th>
            <th>저자</th>
            <th>출판사</th>
            <th>ISBN</th>
            <th>청구기호</th>
            <th>대출상태</th>
            <th>분류</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="book" items="${ books }">
            <tr data-url="edit?id=${book.id}">
              <td>${ book.id }</td>
              <td>${ book.title }</td>
              <td>${ book.author }</td>
              <td>${ book.publisher }</td>
              <td>${ book.isbn }</td>
              <td>${ book.callNum }</td>
              <td>${ book.state.state }</td>
              <td>${ book.category.id }</td>
            </tr>
          </c:forEach>
        </tbody>
      </table> -->

      <c:forEach var="book" items="${ books }">
        <div class="contents" id="content">
          <!-- 책 이미지 -->
          <div class="bookImgContent">
            <img
              class="bookImg"
              src="${R}image/book/${book.id}.jpg"
              alt="${book.title}의 이미지"
            />
          </div>
          <!-- 책 정보 -->
          <div class="bookInfoContent">
            <ul class="menu">
              <h2 class="bookTitle">${ book.title }</h2>
              <li class="bookInfo">${ book.author }</li>
              <li class="bookInfo">${ book.publisher }</li>
              <li class="bookInfo">${ book.isbn }</li>
              <li class="bookInfo">${ book.callNum }</li>
              <li class="bookInfo">${ book.state.state }</li>
              <li class="bookInfo">
                ${ book.category.id } : ${ book.category.name }
              </li>
            </ul>
          </div>
        </div>
      </c:forEach>

      <!-- Pagination Num -->
      <my:pagination
        pageSize="${ pagination.sz }"
        recordCount="${ pagination.recordCount }"
        queryStringName="pg"
      />
    </div>
  </body>
</html>
