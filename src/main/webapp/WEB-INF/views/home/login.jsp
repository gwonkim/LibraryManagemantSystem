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
<script src="${R}res/common.js"></script>
<link rel="stylesheet" href="${R}res/form.css">
</head>
<body>
	<div>
	<form method="post" action="${R}login_processing" class="box">
   	<h1>로그인</h1>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div>
				<p>ID</p>
				<input type="text" name="userId" />
			</div>
			<div>
				<p>비밀번호</p>
				<input type="password" name="password" />
			</div>

			<c:if test="${ param.error != null }">
				<div class="error">아이디 또는 비밀번호가 일치하지 않습니다.</div>
			</c:if>
			<div class="submit">
				<button type="submit">로그인</button>
				<a href="${R}" class="link">홈</a> | <a href="${R}signup"
					class="link">회원가입</a>
			</div>
		</form>
	</div>
</body>