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
    <script src="${R}res/book.js"></script>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link rel="stylesheet" type="text/css" href="${R}res/tab.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/admin.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/index.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/info.css" />
    <link rel="stylesheet" type="text/css" href="${R}res/table.css" />
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
            <img src="image/icon_library.png" class="nav_img" />
          </a>
        </span>
      </nav>
    </header>

    <main class="info_contents">
      <h1 class="info_title">도서관 이용 안내</h1>
      <hr />
      <div class="info_con3">
        <div class="info_con_row">
          <h2 class="info_title2">이용안내</h2>
          <ul class="info_ul">
            <li>
              지원도서관은 자료 열람을 원하는 모든 사람이 이용 가능합니다.
            </li>
            <li>
              단, 대출/예약 등의 일부 서비스는 대출증을 발급받은 회원만 사용
              가능합니다.
            </li>
          </ul>
        </div>
        <div class="info_con_row">
          <h2 class="info_title2">이용 시간</h2>
          <table class="info_table">
            <thead>
              <tr>
                <th>자료실</th>
                <th>평일</th>
                <th>주말</th>
                <th>비고</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>종합자료실</td>
                <td rowspan="3">08:30~20:30</td>
                <td rowspan="3">08:30~18:30</td>
                <td></td>
              </tr>
              <tr>
                <td>일반자료실</td>
                <td></td>
              </tr>
              <tr>
                <td>어린이자료실</td>
                <td></td>
              </tr>
              <tr>
                <td>열람실1</td>
                <td>08:30~18:30</td>
                <td>미운영</td>
                <td></td>
              </tr>
              <tr>
                <td>열람실2</td>
                <td>08:30~23:30</td>
                <td>08:30~20:30</td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="info_con_row">
          <h2 class="info_title2">휴관일</h2>
          <ul class="info_ul">
            <li>국경일 및 정부가 지정한 공휴일</li>
            <li>기타 관장이 필요하다고 인정하는 날</li>
          </ul>
        </div>

        <div class="info_con_row">
          <h2 class="info_title2">도서대출회원증 발급</h2>
          <ul class="info_ul">
            <li>지원특별시에 주민등록이 되어 있는 사람</li>
            <li>지원특별시 소재의 학교, 직장에 소속되어 있는 사람</li>
            <li>
              지원특별시에 거주하는 재외동포 국내거소 신고나 외국인 등록을 한
              사람
            </li>
          </ul>
        </div>
        <div class="info_con_row">
          <h2 class="info_title2">도서관외대출</h2>
          <table class="info_table">
            <thead>
              <tr>
                <th>구분</th>
                <th>대출권수</th>
                <th>대출기간</th>
                <th>비고</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="department" items="${ departments }">
                <c:if test="${ department.id > 1 }">
                  <tr>
                    <td>${ department.name }</td>
                    <td>${ department.volume }권</td>
                    <td>${ department.period }일</td>
                    <td></td>
                  </tr>
                </c:if>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <div class="info_con_row">
          <h2 class="info_title2">주의사항</h2>
          <ul class="info_ul">   
            <li>
              회원증은 본인 이외에는 사용 불가합니다.(단 13세 이하의 아동은 부모가 대신
              대출 가능)
            </li>
            <li>반드시 대출기간을 지켜주시기 바랍니다.</li>
            <li>
              대출한 책을 분실하였을 때는 동일도서로 변상, 품절 및 절판시
              전화문의하십시오.
            </li>
            <li>
              회원증 분실 또는 주소, 전화번호 변경 시 반드시 연락주시기
              바랍니다.
            </li>
          </ul>
        </div>
      </div>
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
