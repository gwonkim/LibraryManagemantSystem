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
      <h1>대출 도서 목록</h1>
      <table class="borrow list">
        <thead>
          <tr>
            <th>ISBN</th>
            <th>자료명</th>
            <th>대출 날짜</th>
            <th>반납 날짜</th>
            <th>사용자 ID</th>
            <th>사용자 이름</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="borrows" items="${ bookBorrows }">
            <tr>
              <td>${ borrows.book.isbn }</td>
              <td>${ borrows.book.title }</td>
              <td>${ borrows.borrowDate }</td>
              <td>${ borrows.returnDate }</td>
              <td>${ borrows.user.borrowId }</td>
              <td>${ borrows.user.name }</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <h1>반납 도서 목록</h1>
      <table class="return list">
        <thead>
          <tr>
            <th>ISBN</th>
            <th>자료명</th>
            <th>대출 날짜</th>
            <th>반납 날짜</th>
            <th>사용자 ID</th>
            <th>사용자 이름</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="returns" items="${ bookReturns }">
            <tr>
              <td>${ returns.book.isbn }</td>
              <td>${ returns.book.title }</td>
              <td>${ returns.borrowDate }</td>
              <td>${ returns.returnDate }</td>
              <td>${ returns.user.borrowId }</td>
              <td>${ returns.user.name }</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </body>
</html>
