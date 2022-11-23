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
  </head>
  <body>
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
        <a href="${R}admin/index" class="btn">목록으로</a>
      </div>
    </form:form>
  </body>
</html>
