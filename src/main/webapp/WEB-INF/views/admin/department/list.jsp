<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="${R}res/common.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/table.css" />
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
        <span class="nav_right" id="navR">
          <sec:authorize access="hasRole('ROLE_ADMIN')">
            <span class="nav_right" id="navR">
              <a href="group" class="nav_link">그룹 목록</a>
              <a href="create" class="nav_link">그룹 추가</a>
              <a href="${R}logout_processing" class="nav_link">로그아웃</a>
            </span>
          </sec:authorize>
        </span>
      </nav>
    </header>

    <main class="container">
      <h1>그룹별 사용자 목록</h1>
      <c:forEach var="department" items="${ departments }">
        <h3>${ department.id }-${ department.name }</h3>
        <table class="list">
          <thead>
            <tr>
              <th>대출ID</th>
              <th>이름</th>
              <th>ID</th>
              <th>성별</th>
              <th>전화번호</th>
              <th>이메일</th>
              <th>그룹</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="user" items="${ department.users }">
              <tr>
                <td>${ user.borrowId }</td>
                <td>${ user.name }</td>
                <td>${ user.userId }</td>
                <td>${ user.sex }</td>
                <td>${ user.phone }</td>
                <td>${ user.email }</td>
                <td>${ user.department.name }</td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:forEach>
    </main>
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
