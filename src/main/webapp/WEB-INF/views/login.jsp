<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${R}common.js"></script>
<link rel="stylesheet" href="${R}form.css">
</head>
<body>
	<div>
		<form:form method="post" modelAttribute="login">
			<h1>로그인</h1>
			<div>
				<p>ID</p>
				<form:input path="userId" />
			</div>
			<form:errors path="userId" class="error" />
			<div>
				<p>비밀번호</p>
				<form:input path="password" type="password" />
				<form:errors path="password" class="error" />
			</div>
			<hr />
			<div class="submit">
				<button type="submit">로그인</button>
				<a href="/" class="link">홈</a> | <a href="/signup" class="link">회원가입</a>
			</div>
		</form:form>
	</div>
</body>