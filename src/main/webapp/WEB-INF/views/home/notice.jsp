<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${R}res/common.js"></script>
    <script src="${R}res/book.js"></script>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link rel="stylesheet" type="text/css" href="${R}res/tab.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/admin.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/info.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/table.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/notice.css" />
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

    <main>
      <div class="notice">
        <h1 class="n_notice_title">공지사항</h1>
        <hr />
        <ul>
          <c:forEach var="noti" items="${ notice }" varStatus="status">
            <c:if test="${ noti.pin }">
              <li>
                <div class="notice_pin_line p_line">
                  <span class="material-symbols-outlined"> push_pin </span>
                  <a href="${R}notice/detail?id=${ noti.id }">
                    <span class="notice_pin_title p_line">${ noti.title }</span>
                    <span class="notice_writer"
                      >${ noti.user.department.name }</span
                    >
                    <span class="notice_date">${ noti.date }</span>
                  </a>
                </div>
              </li>
            </c:if>
          </c:forEach>

          <c:forEach var="noti" items="${ notice }" varStatus="status">
            <c:if test="${ !noti.pin}">
              <li>
                <div class="notice_line p_line">
                  <a href="${R}notice/detail?id=${ noti.id }">
                    <span class="notice_title">${ noti.title }</span>
                    <span class="notice_writer"
                      >${ noti.user.department.name }</span
                    >
                    <span class="notice_date">${ noti.date }</span>
                  </a>
                </div>
              </li>
            </c:if>
          </c:forEach>
        </ul>
      </div>
    </main>
  </body>
</html>
