<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${R}res/index.css">
<link rel="stylesheet" href="${R}res/admin.css">
</head>
<body>
	<div class="top">
		<span class="top"> <a target="_blank"
			href="https://github.com/gwonkim" class="top_link">깃허브</a> | <a
			target="_blank" href="https://github.com/gwonkim" class="top_link">유튜브설명영상</a>
		</span>
	</div>
	<div class="nav">
		<span class="nav_left"> <img src="${R}image/library2.png"
			class="nav_img" />
		</span>
		<a href="${R}" class="nav_text">
		지원도서관
		</a>
		<sec:authorize access="not authenticated">
			<span class="nav_right"> <a href="${R}login" class="nav_link">로그인</a>
				| <a href="signup" class="nav_link">회원가입</a>
			</span>
		</sec:authorize>
		<sec:authorize access="authenticated">
			<span class="nav_right"> <a href="${R}logout_processing"
				class="nav_link">로그아웃</a> | <a class="top_link"
				href="${R}user/index">뒤로</a></span>
		</sec:authorize>
	</div>
	<div class="container">
		<div class="info">
			<span class="title">관리자 페이지</span>
			<div class="userInfo">
			<div> 로그인ID | 
				<sec:authentication property="name" />
			</div>
			<div>
				사용자 | 
				<sec:authentication property="principal.name" />
			</div>
			<div>
				권한 | 
				<sec:authentication property="principal.department.name" />
			</div>
			</div>
		</div>
		<div class="menu">
		<button onclick="location.href='${R}admin/book/list'" class="custom-btn btn box">자료관리</button>
		<button onclick="location.href='${R}admin/user/list'" class="custom-btn btn box">사용자관리</button>
		<button onclick="location.href='${R}admin/department/list'" class="custom-btn btn box">그룹관리</button>
		<button onclick="location.href='${R}admin/return/list'" class="custom-btn btn box">대출/반납</button>
		</div>
	</div>
</body>
</html>
