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
    <form:form method="post" modelAttribute="pwRegistration">
      <div class="title">비밀번호 수정</div>
      <div>
        <p>ID</p>
        <form:input path="id" readonly="true" />
      </div>
      <div>
        <p>기존 비밀번호</p>
        <form:input path="password" type="password" />
        <form:errors path="password" class="error" />
      </div>
      <div>
        <p>새로운 비밀번호</p>
        <form:input path="editPassword1" type="password" />
        <form:errors path="editPassword1" class="error" />
      </div>
      <div>
        <p>새로운 비밀번호 확인</p>
        <form:input path="editPassword2" type="password" />
        <form:errors path="editPassword2" class="error" />
      </div>
      <div>
        <button type="submit" class="btn">저장</button>
      </div>
      <a href="${R}user/index" class="link">나의 공간</a>
    </form:form>
  </body>
</html>
