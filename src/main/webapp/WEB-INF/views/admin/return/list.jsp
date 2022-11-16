<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="${R}res/common.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/table.css" />
  </head>
  <body>
    <div class="container">
      <h1>반납 도서 목록</h1>
      <table class="list">
        <thead>
          <tr>
            <th>아이디</th>
            <th>자료명</th>
            <th>저자</th>
            <th>출판사</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="return" items="${ bookreturns }">
            <tr>
              <td>${ return.borrowDate }</td>
              <td>${ return.returnDate }</td>
              <td>${ return.book.id }</td>
              <td>${ return.user.id }</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </body>
</html>
