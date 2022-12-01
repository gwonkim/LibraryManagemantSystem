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
    <link rel="stylesheet" href="${R}res/index.css" />
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

    <form:form method="post" modelAttribute="userRegistration">
      <h1 class="title">
        관리자 | 회원 ${ userRegistration.id > 0 ? "수정" : "등록" }
      </h1>
      <c:if test="${ userRegistration.id == 0 }">
        <div>
          <p>대출코드</p>
          <form:input path="borrowId" disabled="true" />
        </div>
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
      </c:if>
      <c:if test="${ userRegistration.id > 0 }">
        <div>
          <p>대출코드</p>
          <form:input path="borrowId" readonly="true" />
        </div>
        <div>
          <p>이름</p>
          <form:input path="name" readonly="true" />
        </div>
        <div>
          <p>ID</p>
          <form:input path="userId" readonly="true" />
        </div>
        <div>
          <p>비밀번호</p>
          <form:input path="password" type="password" readonly="true" />
        </div>
      </c:if>
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
      <div>
        <p>그룹</p>
        <form:select
          path="department.id"
          itemValue="id"
          itemLabel="name"
          items="${ departments }"
        />
        <form:errors path="department.id" class="error" />
      </div>
      <div>
        <button type="submit" class="btn">저장</button>
        <c:if test="${ userRegistration.id > 0 }">
          <a
            href="delete?id=${ userRegistration.id }"
            class="link error"
            data-confirm-delete
            >사용자삭제</a
          >
          |
        </c:if>
        <a href="list" class="link">목록</a>
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
