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
    <link rel="stylesheet" href="${R}res/common.css" />
  </head>
  <body>
    <div class="top">
      <span>
        <a target="_blank" href="https://github.com/gwonkim" class="top_link"
          >깃허브</a
        >
        |
        <a target="_blank" href="https://github.com/gwonkim" class="top_link"
          >유튜브설명영상</a
        >
      </span>
    </div>
    <div class="nav">
      <span class="nav_left" id="navL">
        <img src="${R}image/library2.png" class="nav_img" />
      </span>
      <a class="nav_title" href="${R}">지원도서관</a>
    </div>
    <div class="container">
      <form:form method="post" modelAttribute="department">
        <h1 class="title">그룹 ${ department.id > 0 ? "수정" : "등록" }</h1>
        <div>
          <p>그룹명</p>
          <form:input path="name" />
        </div>
        <div>
          <p>대출기간</p>
          <form:input path="period" />
        </div>
        <div>
          <p>대출권수</p>
          <form:input path="volume" />
        </div>

		<div>
			<button type="submit" class="btn">${ department.id > 0 ? "저장" : "등록" }</button>
			<c:if test="${ department.id > 0 }">
			  <a href="delete?id=${ department.id }" class="link error" data-confirm-delete
				>삭제</a
			  > |
			</c:if>
			<a href="list" class="link">목록으로</a>
		  </div>
      </form:form>
    </div>
  </body>
</html>
