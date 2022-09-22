<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${R}common.css" />
</head>
<body>
	<div class="container">
		<h1>그룹별 사용자 목록</h1>
		<a href="group" class="btn">그룹 목록</a>
		<c:forEach var="department" items="${ departments }">
			<h3>${ department.id }-${ department.name }</h3>
			<table class="list">
				<thead>
					<tr>
						<th>대출ID</th>
						<th>이름</th>
						<th>ID</th>
						<th>성별</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>그룹</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${ department.users }">
						<tr>
							<td>${ user.borrow_id }</td>
							<td>${ user.name }</td>
							<td>${ user.user_id }</td>
							<td>${ user.sex }</td>
							<td>${ user.phone }</td>
							<td>${ user.email }</td>
							<td>${ user.department.name }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:forEach>
	</div>
</body>
</html>
