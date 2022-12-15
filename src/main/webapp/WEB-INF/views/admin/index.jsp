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
    <script src="${R}res/tab.js"></script>
    <link rel="stylesheet" type="text/css" href="${R}res/calendar.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/tab.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/admin.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/slide.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/table.css" />
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
            <div>
              <a href="${R}user/edit?userId=${userId}" class="setting">
                <span class="material-symbols-outlined setting_icon">
                  settings
                </span>
                <span class="setting_text">설정</span>
              </a>
            </div>
          </div>
        </div>
        <hr />
        <ul class="menu">
          <li onclick="location.href='${R}admin/book/list'" class="menu_btn">
            <span class="material-symbols-outlined">
              collections_bookmark
            </span>
            자료관리
          </li>
          <li onclick="location.href='${R}admin/user/list'" class="menu_btn">
            <span class="material-symbols-outlined"> manage_accounts </span>
            사용자관리
          </li>
          <li
            onclick="location.href='${R}admin/department/list'"
            class="menu_btn"
          >
            <span class="material-symbols-outlined"> group </span>
            그룹관리
          </li>
          <li onclick="location.href='${R}admin/book/state'" class="menu_btn">
            <span class="material-symbols-outlined"> new_label </span>
            대출/반납
          </li>
        </ul>
      </aside>

      <!-- 오른쪽 콘텐츠 -->
      <section class="right_contents">
        <div class="tab_menu">
          <ul>
            <li id="tab1" class="btnCon">
              <input type="radio" checked name="tab_menu" id="tab_menu1" />
              <label for="tab_menu1">희망도서 : 신청</label>
              <div class="tabContents">
                <table class="list">
                  <thead>
                    <tr>
                      <th>신청자명</th>
                      <th>신청자ID</th>
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
                    <c:forEach var="request" items="${ requesbook1 }">
                      <tr>
                        <td>${ request.user.name }</td>
                        <td>${ request.user.userId }</td>
                        <td>${ request.title }</td>
                        <td>${ request.author }</td>
                        <td>${ request.publisher }</td>
                        <td>${ request.isbn }</td>
                        <td>${ request.state.state }</td>
                        <td>${ request.etc }</td>
                        <td
                          style="cursor: pointer"
                          onclick="location.href='${R}admin/book/request?id=${ request.id }'"
                        >
                          수정
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </li>

            <li id="tab3" class="btnCon">
              <input type="radio" name="tab_menu" id="tab_menu3" />
              <label for="tab_menu3">희망도서 : 준비</label>
              <div class="tabContents">
                <table class="list">
                  <thead>
                    <tr>
                      <th>신청자명</th>
                      <th>신청자ID</th>
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
                    <c:forEach var="request" items="${ requesbook2 }">
                      <tr>
                        <td>${ request.user.name }</td>
                        <td>${ request.user.userId }</td>
                        <td>${ request.title }</td>
                        <td>${ request.author }</td>
                        <td>${ request.publisher }</td>
                        <td>${ request.isbn }</td>
                        <td>${ request.state.state }</td>
                        <td>${ request.etc }</td>
                        <td
                          style="cursor: pointer"
                          onclick="location.href='${R}admin/book/request?id=${ request.id }'"
                        >
                          수정
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
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

    <footer class="admin_footer">
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
