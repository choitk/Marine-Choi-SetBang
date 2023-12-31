<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Style CSS -->
<link rel="stylesheet" href="./resources/css/loginSignup.css">

<!-- JS / Jquery -->
<script type="text/javascript" src="./resources/js/kakaoaddr.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<title>로그인/회원가입</title>
<script type="text/javascript">
$(document).ready(function () {
	$("#btn-login").click(function() {
	    if ($("#id").val() !== "" && $("#pw").val() !== "") {
	        alert("SETbang에 오신걸 환영합니다!☺️\n로그인에 성공하였습니다.");
	        location.href = "./resources/views/member/myPage.jsp";
	    } else {
	        alert("로그인에 실패하였습니다.\n다시 시도해주세요.");
	    }
	});//수정필요
	$("#btn-signup").click(function() {
	    if ($("#mem_id").val() !== "" && $("#mem_pw").val() !== "" && $("#checkPw").val() !== "" && $("#mem_name").val() !== "" && $("#mem_tel").val() !== "" && $("#mem_email").val() !== "" && $("#industry").val() !== "" && $("#business_no").val() !== "" && $("#sample6_postcode").val() !== "" && $("#sample6_address").val() !== "" && $("#sample6_extraAddress").val() !== "" && $("#requiredCheck").prop("checked")) {
	        alert("SETbang에 오신걸 환영합니다!☺️\n회원가입에 성공하였습니다.");
	        location.href = "./resources/views/member/loginSignup.jsp";
	    } else {
	        alert("회원가입 실패하였습니다.\n다시 시도해주세요.");
	    }
	});
	});
</script>
</head>
<body>

		<div id="header">
			<jsp:include page="../section/header.jsp" />
		</div>
<div id="wrap">
		
<!-- 로그인/회원가입 -->

<div class="login-wrap">
<!-- 로그인 -->
  <div class="login-html">
    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">회원가입</label>
    <div class="login-form">
      <form class="sign-in-htm" name="login" method="post" action="login.do">
        <div class="group">
          <label for="id" class="label">아이디</label>
          <input id="id" name = "id" type="text" class="input">
        </div>
        <div class="group">
          <label for="pw" class="label">비밀번호</label>
          <input id="pw" name = "pw" type="password" class="input" data-type="password">
        </div>
        <div class="blank"></div>
        <div class="group">
          <input type="submit" class="button" id="btn-login" value="로그인">
        </div>
        <div class="hr"></div>
       <div class="foot-lnk">
          <a href="findId.do">아이디를 잊으셨나요?</a><br/>
          <a href="findPw.do">비밀번호를 잊으셨나요?</a>
        </div>
      </form>
<!-- 회원가입 -->
      <div class="sign-up-htm">
      	<form action="signup.do" method="post"  role="form" id="usercheck" name="member">
        <div class="group">
          <label for="id" class="label">아이디</label>
          <input id="mem_id" name="id" type="text" class="input" placeholder="4자리 이상  ~ 12자리 이하 영문 소문자, 숫자" maxlength="12" required/>
          <div class="eheck_font" id="id_check"></div>
        </div>
        <div class="group">
          <label for="pw" class="label">비밀번호</label>
          <input id="mem_pw" name="pw" type="password" class="input" data-type="password" placeholder="4자리 이상  ~ 12자리 이하  영문 대/소문자, 숫자" maxlength="12" required/>
           <div class="eheck_font" id="pw_check"></div>
        </div>
        <div class="group">
          <label for="checkPw" class="label">비밀번호 확인</label>
          <input id="checkPw" name="checkPw" type="password" class="input" data-type="password" placeholder="4자리 이상  ~ 12자리 이하  영문 대/소문자, 숫자" maxlength="12" required/>
          <div class="eheck_font" id="pw2_check"></div>
        </div>
        <div class="group">
          <label for="name" class="label">성함</label>
          <input id="mem_name" name="name" type="text" class="input" placeholder="ex) 홍길동" required/>
          <div class="eheck_font" id="name_check"></div>
        </div>
        <div class="group">
          <label for="tel" class="label">연락처</label>
          <input id="mem_tel" name="tel" type="tel" class="input" placeholder="ex) 010-0000-0000" required/>
          <div class="eheck_font" id="tel_check"></div>
        </div>
        <div class="group">
          <label for="email" class="label">이메일 주소</label>
          <input id="mem_email" name="email" type="email" class="input" placeholder="ex) setbang@setbang.com" required/>
          <div class="eheck_font" id="email_check"></div>
        </div>
                <div class= "group">
        <label for="industry" class="label">업종</label>
        <div class="industry_select">
                <select class="input" name = "ind_code" id="industry" onchange="selectBoxChange(this.value);" required>
                  <option value="">선택</option>
                  <option value="1">제조업</option>
                  <option value="2">부동산업</option>
                  <option value="3">IT업</option>
                  <option value="4">서비스업</option>
                  <option value="5">요식업</option>
                  <option value="6">건설업</option>
                  <option value="7">유통업</option>
                  <option value="8">교육업</option>
                  <option value="9">뷰티업</option>
                  <option value="10">금융업</option>
                  <option value="11">섬유업</option>
                  <option value="12">회계업</option>
                  <option value="13">패션업</option>
                  <option value="14">마케팅업</option>
                </select>
              </div>
        </div>
        <div class="group">
        <label for="business_no" class="label">사업자 번호</label>
          <input id="business_no" name="business_no" type="text" class="input" placeholder="ex) 000-00-00000" required/>
        </div>
            <div class="group">
        <label for="addr" class="label">주소</label>
        <div class = "kakaoAddrDetail">
			<input class="input" type="text" name="addr" id="sample6_postcode" placeholder="우편번호" required/>
			<input class="addrButton" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" required/><br/>
        </div>
			<input class="input" type="text" name="addr" id="sample6_address" placeholder="주소" required/><br>
			<input class="input" type="text" name="addr" id="sample6_extraAddress" placeholder="주소" required>
			<input class="input" type="text" name="addr" id="sample6_detailAddress" placeholder="상세주소">
        </div>
        <div class="group">
          <input id="requiredCheck" name = "requiredCheck" type="checkbox" class="check" required/>
          <label for="requiredCheck"><span class="icon"></span> &nbsp;개인정보 이용에 동의합니다 (필수)</label>
        </div>
        <div class="blank"></div>
        <div class="group">
          <input type="submit" class="button" id="btn-signup" value="회원가입">
        </div>
        <div class="hr"></div>
        <div class="foot-lnk">
          <label for="tab-1">이미 회원이신가요?</label>
        </div>
       </form>
      </div>
    </div>
  </div>
</div>


	</div>

		<div id="footer">
			<jsp:include page="../section/footer.jsp" />
		</div>

<script type="text/javascript" src="./resources/js/loginSignup.js"></script>
</body>
</html>