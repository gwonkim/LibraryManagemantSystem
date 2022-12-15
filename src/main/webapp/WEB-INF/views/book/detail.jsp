<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%> <%@ taglib uri="http://www.springframework.org/tags/form"
prefix="form"%> <%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>

<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${R}res/common.js"></script>
    <script src="${R}res/bookDetail.js"></script>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/bookDetail.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/footer.css" />
  </head>
  <body>
    <header>
      <nav class="top">
        <span>
          <a target="_blank" href="https://github.com/gwonkim" class="top_link"
            >깃허브</a
          >
          |
          <a target="_blank" href="https://youtu.be/WIbRvyn0lQo" class="top_link"
            >유튜브설명영상</a
          >
        </span>
      </nav>
      <nav class="nav">
        <span class="nav_left" id="navL">
          <a class="nav_title" href="${R}">
            <img src="${R}image/icon_library.png" class="nav_img" />
          </a>
        </span>
        <span class="nav_right" id="navR">
          <a class="nav_link" href="${R}${bookLink}">도서검색</a>
          <a class="nav_link" href="${R}${homeLink}">나의 공간</a>
        </span>
      </nav>
    </header>

    <main class="container">
      <form:form method="get" modelAttribute="pagination">
        <form:hidden path="pg" value="1" />
        <form:hidden path="sz" />
      </form:form>

      <section class="detailContents" id="content">
        <!-- 책 이미지 -->
        <div class="bookImg_info">
          <div class="bookImgContent">
            <c:if test="${ book.checkImg }">
              <img
                class="bookDetailImg"
                id="bookImgs"
                src="${R}image/book/${book.id}.jpg"
                alt="${book.title}의 이미지"
              />
            </c:if>
            <c:if test="${ !book.checkImg }">
              <img
                class="bookDetailImg"
                id="bookImgs"
                src="${R}image/book/0.jpg"
                alt="이미지 준비 중입니다."
              />
            </c:if>
          </div>
          <!-- 책 정보 -->
          <div class="bookInfoContent">
            <h2 class="bookTitle">${ book.title }</h2>
            <ul>
              <li class="bookInfo"><span>저자</span>${ book.author }</li>
              <li class="bookInfo"><span>발행자</span>${ book.publisher }</li>
              <li class="bookInfo"><span>ISBN</span>${ book.isbn }</li>
              <li class="bookInfo"><span>청구기호</span>${ book.callNum }</li>
              <li class="bookInfo">
                <span>분류</span>
                ${ book.category.id }${ book.category.name }
              </li>
              <li class="bookInfo state">
                ${ book.state.state }
                <c:if test="${ homeLink == 'admin/index' }">
                  <a
                    class="book_link"
                    href="${R}admin/book/edit?id=${ book.id }"
                    >| 수정</a
                  >
                </c:if>
              </li>
            </ul>
          </div>
        </div>

        <div class="bookStoryContent">
          <h1>책 소개</h1>
          <hr />
          <div class="book_storys">
            <c:if test="${ book.story != null }"> ${book.story} </c:if>
            <c:if test="${ book.story == null }">
              <p>준비중입니다. 조금만 기다려주세요.</p>
            </c:if>
          </div>
        </div>
      </section>
    </main>

    <footer>
      <p>지원도서관 | (08359) 서울특별시 구로구 연동로 320 성공회대학교</p>
      <p>졸업작품 | IT융합자율학부 201914126 김지원</p>
      <p>Email | jiwonk427@gmail.com</p>
      <p>
        프로젝트 Github |
        <a href="https://github.com/gwonkim/LibrarySystem" target="_blank"
          >LibrarySystem</a
        >
      </p>
      <br />
      <p>Copyright © 2022 jiwonKim. All rights reserved.</p>
    </footer>
  </body>
</html>
