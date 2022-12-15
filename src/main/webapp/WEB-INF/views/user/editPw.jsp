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
      </nav>
    </header>
    <form:form method="post" modelAttribute="pwRegistration">
      <div class="title">비밀번호수정</div>
      <div>
        <p>ID</p>
        <form:input path="id" readonly="true" />
      </div>
      <div>
        <p>기존 비밀번호</p>
        <form:input path="password" type="password" />
        <form:errors path="password" class="error" />
      </div>
      <div>
        <p>새로운 비밀번호</p>
        <form:input path="editPassword1" type="password" />
        <form:errors path="editPassword1" class="error" />
      </div>
      <div>
        <p>새로운 비밀번호 확인</p>
        <form:input path="editPassword2" type="password" />
        <form:errors path="editPassword2" class="error" />
      </div>
      <div>
        <button type="submit" class="btn">저장</button>
      </div>
      <a href="${R}user/index" class="link">나의 공간</a>
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
