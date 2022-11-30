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
    <form method="post" action="${R}login_processing" class="box">
      <h1>로그인</h1>
      <input
        type="hidden"
        name="${_csrf.parameterName}"
        value="${_csrf.token}"
      />
      <div>
        <p>ID</p>
        <input type="text" name="userId" />
      </div>
      <div>
        <p>비밀번호</p>
        <input type="password" name="password" />
      </div>

      <c:if test="${ param.error != null }">
        <div class="error">아이디 또는 비밀번호가 일치하지 않습니다.</div>
      </c:if>
      <div class="submit">
        <button type="submit">로그인</button>
        <a href="${R}" class="link">홈</a> |
        <a href="${R}signup" class="link">회원가입</a>
      </div>
    </form>
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
