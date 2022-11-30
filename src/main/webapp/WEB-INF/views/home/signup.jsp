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
    <script src="${R}common.js"></script>
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
      </nav>
    </header>
    <form:form method="post" modelAttribute="userRegistration">
      <h1>회원가입</h1>
      <div>
        <p>이름</p>
        <form:input path="name" />
        <form:errors path="name" class="error" />
      </div>
      <div>
        <p>ID</p>
        <form:input path="userId" />
        <form:errors path="userId" class="error" />
      </div>
      <div>
        <p>비밀번호</p>
        <form:input path="password1" type="password" />
        <form:errors path="password1" class="error" />
      </div>
      <div>
        <p>비밀번호 학인</p>
        <form:password path="password2" />
        <form:errors path="password2" class="error" />
      </div>
      <div>
        <p>이메일</p>
        <form:input path="email" type="email" />
        <form:errors path="email" class="error" />
      </div>
      <div class="radio">
        <p>성별</p>
        <form:radiobutton path="sex" value="남" label="남자" />
        <form:radiobutton path="sex" value="여" label="여자" />
        <br />
        <form:errors path="sex" class="error" />
      </div>
      <div>
        <p>전화</p>
        <form:input path="phone" placeholder="010-1111-2222" />
        <form:errors path="phone" class="error" />
      </div>
      <form:hidden path="department" />
      <br />
      <hr />
      <div class="submit">
        <button type="submit">회원가입</button>
        <a href="${R}" class="link">홈</a>
        | <a href="${R}login" class="link">로그인</a>
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
