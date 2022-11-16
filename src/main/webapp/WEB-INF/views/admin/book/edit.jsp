<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${R}res/common.js"></script>
    <link rel="stylesheet" href="${R}res/index.css" />
    <link rel="stylesheet" href="${R}res/form.css" />
  </head>
  <body>
    <div class="top">
      <span>
        <a target="_blank" href="https://github.com/gwonkim" class="top_link">깃허브</a>
        |
        <a target="_blank" href="https://github.com/gwonkim" class="top_link">유튜브설명영상</a>
      </span>
    </div>
    <div class="nav">
      <span class="nav_left" id="navL">
        <img src="${R}image/library2.png" class="nav_img" />
      </span>
      <a class="nav_title" href="${R}">지원도서관</a>
    </div>
    <form:form method="post" modelAttribute="book">
      <h1 class="title">자료 ${ book.id > 0 ? "수정" : "등록" }</h1>
      <div>
        <p>자료명</p>
        <form:input path="title" />
      </div>

      <div>
        <p>저자</p>
        <form:input path="author" />
      </div>
      <div>
        <p>출판사</p>
        <form:input path="publisher" />
      </div>
      <div>
        <p>ISBN:</p>
        <form:input path="isbn" />
      </div>
      <div>
        <p>청구기호:</p>
        <form:input path="callNum" />
      </div>
      <div>
        <p>상태:</p>
        <form:select
          path="state.id"
          itemValue="id"
          itemLabel="state"
          items="${ staties }"
        />
      </div>
      <div>
        <p>분류:</p>
        <form:select
          path="category.id"
          itemValue="id"
          itemLabel="name"
          items="${ categories }"
        />
      </div>
      <div>
        <button type="submit">등록</button>
        <c:if test="${ book.id > 0 }">
          <a href="delete?id=${ book.id }" class="btn" data-confirm-delete
            >삭제</a
          >
        </c:if>
        <a href="list" class="link">목록으로</a>
      </div>
    </form:form>
  </body>
</html>
