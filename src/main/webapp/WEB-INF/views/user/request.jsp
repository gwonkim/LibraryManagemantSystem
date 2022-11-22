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
    <form:form method="post" modelAttribute="requestBookRegistration">
      <div class="title">
        희망도서(사용자용) ${ requestBookRegistration.id > 0 ? "수정" : "신청" }
      </div>
      <c:if test="${ userRegistration.id > 0 }">
        <div>
          <p>신청ID</p>
          <form:input path="id" readonly="true" />
        </div>
      </c:if>
      <div>
        <p>신청자</p>
        <sec:authentication property="principal.name" />
      </div>
      <div>
        <p>자료명</p>
        <form:input path="title" />
        <form:errors path="title" class="error" />
      </div>
      <div>
        <p>저자</p>
        <form:input path="author" />
        <form:errors path="author" class="error" />
      </div>
      <div>
        <p>발행자</p>
        <form:input path="publisher" />
        <form:errors path="publisher" class="error" />
      </div>
      <div>
        <p>ISBN</p>
        <form:input path="isbn" required="true" />
        <form:errors path="isbn" class="error" />
      </div>
      <div>
        <button type="submit" class="btn">저장</button>
        <a href="${R}user/index" class="btn">목록으로</a>
      </div>
    </form:form>
  </body>
</html>
