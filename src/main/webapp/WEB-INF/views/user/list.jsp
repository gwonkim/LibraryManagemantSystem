<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="${R}common.js"></script>
  <link rel="stylesheet" type="text/css" href="${R}common.css" />
  <style>
    a.btn { float: right; margin: -20px 0 5px 0; }
    td:nth-child(1), td:nth-child(5) { text-align: center; }
  </style>
</head>
<body>
<div class="container">
  <h1>회원 목록</h1>
  <a href="create" class="btn">회원 등록</a>
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
      <c:forEach var="user" items="${ users }">
        <tr data-url="edit?id=${ user.id }">
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
</div>
</body>
</html>
