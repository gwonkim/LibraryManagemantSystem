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
<style>
a.btn {
	float: right;
	margin: -20px 0 5px 0;
}

td:nth-child(1), td:nth-child(5) {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h1>자료 목록</h1>
		<a href="register" class="btn">자료 등록</a>

		<form:form method="get" modelAttribute="pagination">
			<form:hidden path="pg" value="1" />
			<form:hidden path="sz" />
			<span>청구기호:</span>
			<form:select path="di" class="form-control">
				<form:option value="0">전체</form:option>
				<form:options itemValue="id" itemLabel="name" items="${ category }" />
			</form:select>
			<button type="submit" class="btn">검색</button>
			<a href="create?${pagination.queryString}" class="btn">학생등록</a>
		</form:form>

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
		<my:pagination pageSize="${ pagination.sz }"
			recordCount="${ pagination.recordCount }" queryStringName="pg" />




	</div>
</body>
</html>
