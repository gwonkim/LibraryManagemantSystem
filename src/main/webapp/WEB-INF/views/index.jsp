<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${R}common.js"></script>
<link rel="stylesheet" type="text/css" href="${R}index.css" />
</head>
<body>
	<div class="top">
		<span class="top"> <a target="_blank"
			href="https://github.com/gwonkim" class="top_link">깃허브</a> | <a
			target="_blank" href="https://github.com/gwonkim" class="top_link">유튜브설명영상</a>
		</span>
	</div>

	<div class="nav">
		<span class="nav_left"> <img src="image/library2.png"
			class="nav_img" />
		</span> <span class="nav_text"> <span class="nav_text">지원도서관</span>
		</span> <span class="nav_right"> <a href="/login" class="nav_link">로그인</a>
			| <a href="/signup" class="nav_link">회원가입</a>
		</span>
	</div>
	
	<div class="container">
		<div class="banner">
			<div class="round">
				<h1>도서관 안내</h1>
				<a class="top_link"> 오시는 길 </a>
			</div>
			<div class="banner_box"></div>
		</div>
		<div class="boxs">
			<button onclick="location.href='/book/list'"
				class="custom-btn btn box">자료검색</button>
			<button onclick="location.href='/book/list'"
				class="custom-btn btn box">희망도서</button>
			<button onclick="location.href='/book/list'"
				class="custom-btn btn box">신규도서</button>
			<button onclick="location.href='/book/list'"
				class="custom-btn btn box">안내정보</button>
		</div>
		<img src="image/banner.jpg" class="banner_img" />
	</div>
</body>
</html>
