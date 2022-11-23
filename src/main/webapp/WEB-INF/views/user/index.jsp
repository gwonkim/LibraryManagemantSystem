<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://www.springframework.org/security/tags"
prefix="sec"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Lato"
      rel="stylesheet"
      type="text/css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
      type="text/javascript"
      src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
    ></script>
    <script src="${R}res/slide.js"></script>
    <script src="${R}res/contents.js"></script>
    <script src="${R}res/calendar.js"></script>
    <link rel="stylesheet" type="text/css" href="${R}res/calendar.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/tab.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/admin.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/slide.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/table.css" />
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
          <img src="${R}image/library2.png" class="nav_img" />
        </span>
        <a class="nav_title" href="${R}">지원도서관</a>
        <sec:authorize access="not authenticated">
          <span class="nav_right" id="navR">
            <a href="${R}login" class="nav_link">로그인</a> |
            <a href="${R}signup" class="nav_link">회원가입</a>
          </span>
        </sec:authorize>

        <sec:authorize access="authenticated">
          <span class="nav_right" id="navR">
            <a href="${R}logout_processing" class="nav_link">로그아웃</a>
          </span>
        </sec:authorize>
      </nav>
    </header>

    <main class="contents" id="content">
      <aside class="left_contents">
        <div class="info">
          <div class="title">
            <sec:authentication property="principal.name" />&nbsp;님
          </div>
          <div class="userInfo">
            <div>
              <p class="info_text">권한</p>
              <sec:authentication property="principal.department.name" />
            </div>
            <div>
              <p class="info_text">로그인ID</p>
              <sec:authentication property="name" />
            </div>
            <div>
              <p class="info_text">이메일</p>
              <sec:authentication property="principal.email" />
            </div>
            <div class="setting">
              <span class="material-symbols-outlined"> settings </span>
              설정
            </div>
          </div>
        </div>
        <hr />
        <ul class="menu">
          <li onclick="location.href='${R}book/list'" class="menu_btn">
            <span class="material-symbols-outlined">
              collections_bookmark
            </span>
            도서검색
          </li>
          <li onclick="location.href='${R}user/request'" class="menu_btn">
            <span class="material-symbols-outlined"> comment_bank </span>
            희망도서신청
          </li>
        </ul>
      </aside>

      <!-- 오른쪽 콘텐츠 -->
      <section class="right_contents">
        <div class="tab_menu">
          <ul>
            <li id="tab1" class="btnCon">
              <input type="radio" checked name="tab_menu" id="tab_menu1" />
              <label for="tab_menu1">대출 도서</label>
              <div class="tabContents">
                <c:if test="${ bookBorrow.isEmpty() == true }">
                  <p>최근 대출된 도서가 없습니다.</p>
                </c:if>
                <c:if test="${ bookBorrows.isEmpty() == false }">
                  <table class="borrow list">
                    <thead>
                      <tr>
                        <th>ISBN</th>
                        <th>자료명</th>
                        <th>대출일</th>
                        <th>반납예정일</th>
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
                </c:if>
              </div>
            </li>
            <li id="tab2" class="btnCon">
              <input type="radio" name="tab_menu" id="tab_menu2" />
              <label for="tab_menu2">반납 도서</label>
              <div class="tabContents">
                <c:if test="${ bookReturns.isEmpty() == true}">
                  <p>최근 반납된 도서가 없습니다.</p>
                </c:if>
                <c:if test="${ bookReturns.isEmpty() == false }">
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
                </c:if>
              </div>
            </li>
            <li id="tab2" class="btnCon">
              <input type="radio" name="tab_menu" id="tab_menu3" />
              <label for="tab_menu3">희망도서</label>
              <div class="tabContents">
                <c:if test="${ requestBooks.isEmpty() == true}">
                  <p>최근 신청된 희망도서가 없습니다.</p>
                </c:if>
                <c:if test="${ requestBooks.isEmpty() == false }">
                  <table class="return list">
                    <thead>
                      <tr>
                        <th>자료명</th>
                        <th>저자</th>
                        <th>출판사</th>
                        <th>ISBN</th>
                        <th>상태</th>
                        <th>기타</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="request" items="${ requestBooks }">
                        <tr>
                          <td>${ request.title }</td>
                          <td>${ request.author }</td>
                          <td>${ request.publisher }</td>
                          <td>${ request.isbn }</td>
                          <td>${ request.state.state }</td>
                          <td>${ request.etc }</td>
                          <c:if test="${ request.state.id == 6 }">
                            <td style="cursor: pointer;" onclick="location.href='${R}user/requestEdit?id=${ request.id }'">수정</td>
                          </c:if>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </c:if>
              </div>
            </li>
          </ul>
        </div>

        <br />
        <br />
        <br />
        <br />
        <br />
      </section>
    </main>

    <footer>
      <nav>지원도서관</nav>
      <p>Copyright © 2022 jiwonKim. All rights reserved.</p>
    </footer>
  </body>
</html>
