
# 프로젝트
- 지원도서관

# 프로젝트 소개
- 도서관 프로젝트
- LS(Library System)으로 지원시라는 가상의 도시에 있는 도서관의 홈페이지를 제작하는 프로젝트입니다. 
- 프로젝트 주제 선정 이유
  - 도서관 근로를 총 8개월동안 하면서 보았던 도서 시스템에 대해 직접 구현해보고 싶다는 생각이 들었기 때문입니다. 

# 사용 기술
- JAVA
- Spring
- JPA
- MySQL
- JSP
- CSS
- jquery

# 배포 방식
- [지원도서관 바로가기](http://13.209.88.2:8088/)
- AWS 사용
  - 인스턴스 구성 - 기본 온디맨드 EC2 인스턴스 사용
  - DB - EC2 내부에 MySQL 서버 구축해 연결

# DB 설계도
- 데이터베이스 테이블
  - 사용자
  - 그룹(department)
  - 희망도서
  - 공지사항
  - 도서 반납
  - 도서 대출
  - 도서 카테고리
  - 도서
  - 도서 상태

![DB_다이어그램](https://user-images.githubusercontent.com/62700252/207595072-f358ff04-756f-409c-ad36-8a554cd49236.png)

# 도서관 대표 아이콘
![icon](https://user-images.githubusercontent.com/62700252/207792787-c95dbbe9-dc9a-46b2-91ca-e0cbbebd3f2f.png)


# 사용자 유입 플로우 차트
![제목 없는 다이어그램 drawio (3)](https://user-images.githubusercontent.com/62700252/207791720-0b005607-3ac8-4d12-8aca-bd4d2b26efc3.png)

# 페이지별 목록
![제목 없는 다이어그램 drawio (5)](https://user-images.githubusercontent.com/62700252/207791663-915f62ad-7b2b-4cfe-bc1c-1eb3b4b44018.png)


# 완성 모습
## 메인 홈
![home](https://user-images.githubusercontent.com/62700252/207790010-9fd2ba45-2319-4118-ad5e-bb68f1cadb73.jpg)
![full](https://user-images.githubusercontent.com/62700252/207789946-d5978789-0863-4506-9fcc-3334e8b54abc.jpg)

## 로그인
![login](https://user-images.githubusercontent.com/62700252/207789119-0ed5bd56-d0d2-4c2a-b260-0cbb89059442.jpg)

## 회원가입
![signup](https://user-images.githubusercontent.com/62700252/207789153-b8731df4-0845-438d-9c50-4dd49f7c42b7.jpg)

## 도서검색
![도서검색2](https://user-images.githubusercontent.com/62700252/207789253-15041af1-3b4e-4ddd-b109-bb11d51d5d20.jpg)

## 도서관이용
![도서관이용](https://user-images.githubusercontent.com/62700252/207789314-15036d81-a40f-4b1b-9d0b-16d022acc8f5.jpg)
![도서관이용2](https://user-images.githubusercontent.com/62700252/207789319-6963f7f1-82c9-435c-bf3f-1176fabfc901.jpg)

## 도서관 소개
### 찾아오시는 길
![찾아오시는 길](https://user-images.githubusercontent.com/62700252/207789354-b850b835-ebb9-4855-b990-aa8d3a79a041.jpg)

### 도서관 인사말
![intro](https://user-images.githubusercontent.com/62700252/207789710-614fdd17-d592-47cb-bd73-7ab880034479.jpg)
![intro2](https://user-images.githubusercontent.com/62700252/207789728-2a1cf5ac-c23b-47b8-bca9-75fa2de64291.jpg)

-----------

## 관리자 메인 홈
![홈2](https://user-images.githubusercontent.com/62700252/207790264-42483443-12bb-4ea4-9995-2cb986c96135.jpg)

### 회원관리
![회원목록](https://user-images.githubusercontent.com/62700252/207790387-378ab1a8-777f-4a11-ad71-a6901cfd1fac.jpg)
![회원등록](https://user-images.githubusercontent.com/62700252/207790372-e0555fa8-0af9-44f8-af03-e693b3abb3f6.jpg)
![회원등록2](https://user-images.githubusercontent.com/62700252/207790377-66e9f136-3849-496c-b985-f1018ea88980.jpg)
![그룹별 사용자 목록](https://user-images.githubusercontent.com/62700252/207790532-1e164512-04a9-44d0-a843-c1fa19393754.jpg)
![그룹목록](https://user-images.githubusercontent.com/62700252/207790552-34d98c44-aec8-4b43-b5cb-63d53c7fd415.jpg)
![그룹등록](https://user-images.githubusercontent.com/62700252/207790567-ff20bc45-e160-4e4a-a3c6-a2a495838482.jpg)

### 도서관리
![도서리스트](https://user-images.githubusercontent.com/62700252/207790476-8470d0d5-19ee-434e-bf9e-28cec9ebd19d.jpg)
![관리자 도서 페이지](https://user-images.githubusercontent.com/62700252/207790484-2ee3a2fd-4fb5-424d-a512-d894733a023c.jpg)
![도서수정](https://user-images.githubusercontent.com/62700252/207790492-ebebb1fb-3953-474e-9c2d-a7f138e461e8.jpg)
![대출반납목록](https://user-images.githubusercontent.com/62700252/207791067-78011837-469e-4329-8c33-b62aff8d0ba3.jpg)

------------

## 일반 사용자 메인 홈
![홈3](https://user-images.githubusercontent.com/62700252/207791251-e87a0450-bfc8-4a9c-85e0-4fc01a35860c.jpg)

### 희망
![희망도서 신청](https://user-images.githubusercontent.com/62700252/207791317-74c780b1-9684-444f-9903-20d4dc956419.jpg)
도서
![희망도서 수정](https://user-images.githubusercontent.com/62700252/207791348-f61cfd87-1866-456b-8236-90d05c0e33eb.jpg)
![도서수정2](https://user-images.githubusercontent.com/62700252/207791394-c90662a2-b2d9-41f6-a0da-45cfcab041d2.jpg)

--------------

## 회원정보수정
![개인정보 수정](https://user-images.githubusercontent.com/62700252/207790694-453cfb40-0dbf-4705-9412-3009cc51189b.jpg)
![개인정보](https://user-images.githubusercontent.com/62700252/207790687-85e7e23f-aa67-46f5-add9-f02591cb8886.jpg)
![비번](https://user-images.githubusercontent.com/62700252/207790707-6282653a-d0e1-40b8-a86a-1401db2507fa.jpg)








