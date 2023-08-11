<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Style CSS -->
<link rel="stylesheet" href="./resources/css/header.css">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<title>SETBang</title>
</head>
<body>

<!-- header / navbar -->

<nav class="navbar navbar-expand-lg bg-white">
  <div class="container-fluid">
  <!-- 홈페이지로 돌아가기 넣어야함 -->
    <a class="navbar-brand" href="#">
<img src="./resources/image/setbang.png" width=300px height=160px />
</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
      <ul class="navbar-nav">
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            브랜드 소개
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#intro1">기업 소개</a></li>
            <li><a class="dropdown-item" href="#intro2">서비스 소개</a></li>
            <li><a class="dropdown-item" href="#intro3">협력업체 소개</a></li>
            <li><a class="dropdown-item" href="#intro4">서비스 플랜</a></li>
          </ul>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            오피스 소개
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">개인 오피스</a></li>
            <li><a class="dropdown-item" href="#">공용 오피스</a></li>
          </ul>
        </li>
        
        <!-- 로그인 성공 시 예약·서비스 페이지에 메뉴가 보여짐. 로그인을 하지 않은 상태일 경우 누를때 알림창으로 로그인 후 이용가능 합니다.를 띄워야함 -->
      <c:choose>
        <c:when test="${sessionId == null }">
        <li class="nav-item">
          <a class="nav-link" href="loginPage.do">예약·서비스</a>
        </li>
          </c:when>
          <c:when test="${sessionId != null }">
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            예약·서비스
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#intro1">서비스 플랜 결제</a></li>
            <li><a class="dropdown-item" href="#intro4">물품 신청</a></li>
            <li><a class="dropdown-item" href="support.do">업무지원 신청</a></li>
            <li><a class="dropdown-item" href="#intro2">협력업체 예약</a></li>
          </ul>
        </li>
          </c:when>
        </c:choose>
        
       <!-- 로그인 성공 시 마이페이지로 넘어감. 세션에 있는 id값을 들고 마이페이지로 연결되어야하며, POST 방식으로 넘어가야함 -->
      <c:choose>
        <c:when test="${sessionId == null }">
        <li class="nav-item">
          <a class="nav-link" href="#">문의사항</a>
        </li>
          </c:when>
          <c:when test="${sessionId != null }">
        <li class="nav-item">
          <a class="nav-link" href="myPage.do">마이페이지</a>
        </li>
          </c:when>
        </c:choose>
        
        
        <!-- 로그인/로그아웃 -->
        <c:choose>
        <c:when test="${sessionId == null }">
        <li class="nav-item">
          <a class="nav-link" href="loginPage.do">로그인</a>
        </li>
         </c:when>
          <c:when test="${sessionId != null }">
        <li class="nav-item">
          <a class="nav-link" href="logout.do">로그아웃</a>
        </li>
          </c:when>
        </c:choose>      

    </ul>
    </div>
  </div>
</nav>


</body>
</html>