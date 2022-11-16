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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${R}res/common.js"></script>
<link rel="stylesheet" type="text/css" href="${R}res/common.css" />
<link rel="stylesheet" type="text/css" href="${R}res/table.css" />
<link rel="stylesheet" type="text/css" href="${R}res/index.css" />
</head>
<body>
	<div class="top">
		<span>
		  <a target="_blank" href="https://github.com/gwonkim" class="top_link">깃허브</a>
		  |
		  <a target="_blank" href="https://github.com/gwonkim" class="top_link">유튜브설명영상</a>
		</span>
	  </div>
	  <div class="nav">
		<span class="nav_left" id="navL">
		  <img src="${R}image/library2.png" class="nav_img" />
		</span>
		<a class="nav_title" href="${R}">지원도서관</a>
		<sec:authorize access="authenticated">
		  <span class="nav_right" id="navR">
			<a href="register" class="nav_link">자료 등록</a>
			<a href="state" class="nav_link">자료 대출 반납</a>
		  </span>
		</sec:authorize>
	  </div>

	<div class="container">
		<h1>자료 목록</h1>
		<div>
			<form>
				<label>이름</label>
				<input type="text" name="srchText" value="${ srchText }" placeholder="검색조건" />
				<button type="submit">조회</button>
			</form>			
		</div>

		<br />
		<br />
		<br />
		<br />
		<!-- <form:form method="get" modelAttribute="srchText">
			<form:hidden path="pg" value="1" />
			<form:hidden path="sz" />
			<span>청구기호:</span>
			<form:select path="di" class="form-control">
				<form:option value="0">전체</form:option>
				<form:options itemValue="id" itemLabel="name" items="${ category }" />
			</form:select>
			<button type="submit" class="btn">검색</button>
		</form:form> -->

		<table class="list">
			<thead>
				<tr>
					<th>아이디</th>
					<th>자료명</th>
					<th>저자</th>
					<th>출판사</th>
					<th>ISBN</th>
					<th>청구기호</th>
					<th>대출상태</th>
					<th>분류</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${ books }">
					<tr data-url="edit?id=${book.id}&${pagination.queryString}">
						<td>${ book.id }</td>
						<td>${ book.title }</td>
						<td>${ book.author }</td>
						<td>${ book.publisher }</td>
						<td>${ book.isbn }</td>
						<td>${ book.callNum }</td>
						<td>${ book.state.state }</td>
						<td>${ book.category.id }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
<!-- 		<my:pagination pageSize="${ pagination.sz }"
			recordCount="${ pagination.recordCount }" queryStringName="pg" /> -->
	</div>
</body>
</html>
