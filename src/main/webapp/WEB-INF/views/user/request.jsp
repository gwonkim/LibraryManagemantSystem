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
    <link rel="stylesheet" type="text/css" href="${R}res/form.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/footer.css" />
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
          <a target="_blank" href="https://youtu.be/WIbRvyn0lQo" class="top_link"
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
          <sec:authorize access="hasRole('ROLE_USER') || hasRole('ROLE_HONOR')">
            <a class="nav_link" href="${R}user/index">나의 공간</a>
            <a href="${R}logout_processing" class="nav_link">로그아웃</a>
          </sec:authorize>
        </span>
      </nav>
    </header>

    <form:form method="post" modelAttribute="requestBookRegistration">
      <div class="title">
        희망도서 ${ requestBookRegistration.id > 0 ? "수정" : "신청" }
      </div>
      <c:if test="${ requestBookRegistration.id > 0 }">
        <div>
          <p>신청ID</p>
          <form:input path="id" readonly="true" />
        </div>
      </c:if>
      <div>
        <p>신청자</p>
        <sec:authentication property="principal.name" />
      </div>
      <div>
        <p>자료명</p>
        <form:input path="title" />
        <form:errors path="title" class="error" />
      </div>
      <div>
        <p>저자</p>
        <form:input path="author" />
        <form:errors path="author" class="error" />
      </div>
      <div>
        <p>발행자</p>
        <form:input path="publisher" />
        <form:errors path="publisher" class="error" />
      </div>
      <div>
        <p>ISBN</p>
        <form:input path="isbn" required="true" />
        <form:errors path="isbn" class="error" />
      </div>
      <div>
        <button type="submit" class="btn">저장</button>
        <c:if test="${ requestBookRegistration.id > 0 }">

          <a href="requestDelete?id=${ requestBookRegistration.id }" class="link" data-confirm-delete
          >삭제</a
          >
        </c:if>
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
