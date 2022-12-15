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
    <link rel="stylesheet" href="${R}res/form.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/footer.css" />
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
        <sec:authorize access="authenticated">
          <span class="nav_right" id="navR">
            <sec:authorize access="hasRole('ROLE_ADMIN')">
              <a class="nav_link" href="${R}admin/index">나의 공간</a>
            </sec:authorize>
            <a href="${R}logout_processing" class="nav_link">로그아웃</a>
          </span>
        </sec:authorize>
      </nav>
    </header>
    <form:form method="post" modelAttribute="requestBook">
      <div class="title">희망도서</div>
      <div>
        <p>신청ID</p>
        <form:input path="id" readonly="true" />
      </div>
      <div>
        <p>신청자</p>
        <form:input path="user.name" readonly="true" />
      </div>
      <div>
        <p>신청자ID</p>
        <form:input path="user.userId" readonly="true" />
      </div>
      <div>
        <p>신청일</p>
        <form:input path="date" readonly="true" />
      </div>
      <div>
        <p>자료명</p>
        <form:input path="title" readonly="true" />
      </div>
      <div>
        <p>저자</p>
        <form:input path="author" readonly="true" />
      </div>
      <div>
        <p>출판사</p>
        <form:input path="publisher" readonly="true" />
      </div>
      <div>
        <p>ISBN</p>
        <form:input path="isbn" readonly="true" />
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
        <p>기타</p>
        <form:input path="etc" />
      </div>
      <div>
        <button type="submit" class="btn">수정</button>
        <a href="${R}admin/index" class="link">목록으로</a>
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
