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
		<form:form method="post" modelAttribute="user">
			<h1>회원가입(사용자용)</h1>
			<div>
				<p>이름</p>
				<form:input path="name" />
				<form:errors path="name" class="error" />
			</div>
			<div>
				<p>ID</p>
				<form:input path="userId" />
				<form:errors path="userId" class="error" />
			</div>
			<div>
				<p>비밀번호</p>
				<form:input path="password" type="password" />
				<form:errors path="password" class="error" />
			</div>
			<div class="radio">
				<p>성별</p>
				<form:radiobutton path="sex" value="남" label="남자" />
				<form:radiobutton path="sex" value="여" label="여자" />
				<form:errors path="sex" class="error" />
			</div>
			<div>
				<p>전화</p>
				<form:input path="phone" placeholder="010-1111-2222" />
				<form:errors path="phone" class="error" />
			</div>
			<div>
				<p>이메일</p>
				<form:input path="email" type="email" />
				<form:errors path="email" class="error" />
			</div>
			<br />
			<hr />
			<div class="submit">
				<button type="submit">회원가입</button>
				<a href="/" class="link">홈</a> | <a href="/login" class="link">로그인</a>
			</div>
		</form:form>

	</div>