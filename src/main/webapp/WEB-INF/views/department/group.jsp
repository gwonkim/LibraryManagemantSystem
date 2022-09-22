<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${R}common.js"></script>
<link rel="stylesheet" type="text/css" href="${R}common.css" />
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
		<h1>그룹 목록</h1>
		<a href="create" class="btn">그룹 등록</a>
		<table class="list">
			<thead>
				<tr>
					<th>id</th>
					<th>그룹명</th>
					<th>대출기간</th>
					<th>대출권수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="department" items="${ departments }">
					<tr data-url="edit?id=${ department.id }">
						<td>${ department.id }</td>
						<td>${ department.name }</td>
						<td>${ department.period }</td>
						<td>${ department.volume }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
