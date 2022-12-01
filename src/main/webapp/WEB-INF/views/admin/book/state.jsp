<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="${R}res/table.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/tab.css" />
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

    <main class="contents" id="content">
      <div class="tab_menu_2">
        <ul>
          <li id="tab1" class="btnCon">
            <input type="radio" checked name="tab_menu_2" id="tab_menu1" />
            <label for="tab_menu1">대출도서목록</label>
            <div class="tabContents">
              <table class="borrow list">
                <thead>
                  <tr>
                    <th>ISBN</th>
                    <th>자료명</th>
                    <th>대출 날짜</th>
                    <th>반납 날짜</th>
                    <th>사용자 ID</th>
                    <th>사용자 이름</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="borrows" items="${ bookBorrows }">
                    <tr>
                      <td>${ borrows.book.isbn }</td>
                      <td>${ borrows.book.title }</td>
                      <td>${ borrows.borrowDate }</td>
                      <td>${ borrows.returnDate }</td>
                      <td>${ borrows.user.borrowId }</td>
                      <td>${ borrows.user.name }</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </li>
          <li id="tab1" class="btnCon">
            <input type="radio" checked name="tab_menu_2" id="tab_menu2" />
            <label for="tab_menu2">반납도서목록</label>
            <div class="tabContents">
              <table class="return list">
                <thead>
                  <tr>
                    <th>ISBN</th>
                    <th>자료명</th>
                    <th>대출 날짜</th>
                    <th>반납 날짜</th>
                    <th>사용자 ID</th>
                    <th>사용자 이름</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="returns" items="${ bookReturns }">
                    <tr>
                      <td>${ returns.book.isbn }</td>
                      <td>${ returns.book.title }</td>
                      <td>${ returns.borrowDate }</td>
                      <td>${ returns.returnDate }</td>
                      <td>${ returns.user.borrowId }</td>
                      <td>${ returns.user.name }</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </li>
        </ul>
      </div>
    </main>
    <footer class="state_footer">
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
