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
    <link rel="stylesheet" href="${R}res/footer.css" />
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
            <img src="${R}image/icon_library.png" class="nav_img" />
          </a>
        </span>
        <span class="nav_right" id="navR">
          <sec:authorize access="hasRole('ROLE_ADMIN')">
            <a class="nav_link" href="${R}admin/index">나의 공간</a>
            <a href="${R}logout_processing" class="nav_link">로그아웃</a>
          </sec:authorize>
        </span>
      </nav>
    </header>

    <form:form method="post" modelAttribute="book">
      <h1 class="title">자료 ${ book.id > 0 ? "수정" : "등록" }</h1>
      <div>
        <p>자료명</p>
        <form:input path="title" />
      </div>
      <form:hidden path="newBook" value="true" />
      <form:hidden path="checkImg" value="false" />
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
          path="state"
          itemValue="id"
          itemLabel="state"
          items="${ staties }"
        />
      </div>
      <div>
        <p>분류:</p>
        <form:select
          path="category"
          itemValue="id"
          itemLabel="name"
          items="${ categories }"
        />
      </div>
      <div>
        <button type="submit">등록</button>
        <c:if test="${ book.id > 0 }">
          <a href="delete?id=${ book.id }" class="link" data-confirm-delete
            >삭제</a
          >
        </c:if>
        <a href="list" class="link">목록으로</a>
      </div>
    </form:form>
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
