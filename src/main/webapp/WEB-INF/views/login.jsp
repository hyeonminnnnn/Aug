<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link rel="stylesheet" href="resources/css/login.css">
<style>
body {
	width:1920px;
	height:950px;
	margin: 0 auto;
	text-align: center;
	overflow-x: hidden;
	overflow-y: hidden;
	background-image: url('resources/img/login.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	color:white;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;

}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>

function loginChk(){
	const form = document.login;
	
	if(form.id.value == ""){
		alert("아이디를 입력해 주세요");
		form.id.focus();
		return;
	}
	
	if(form.passwd.value == ""){
		alert("비밀번호를 입력해 주세요");
		form.passwd.focus();
		return;
	}
	
	form.submit();
}

</script>
</head>
<body>
	<div>
		<h1 class="logo"><a href="/"><img src="resources/img/login_logo.png"
						alt="logo"></a></h1>
		<div class="title">
			<h2 id="hi">어서오세요!</h2>
			<h3 id="good">오늘 하루도 수고 많으셨어요.</h3>
		</div>
		<div class="login">
			<form name="login" method="post">
			
				<div class="input-box">
					<input name="id" type="text" id="id" placeholder="아이디" style="color:#fff;">
					<label for="id">아이디</label> 
				</div>

				<div class="input-box">
					<input name="passwd" type="password" id="passwd" placeholder="비밀번호" style="color:#fff;">
					<label for="passwd">패스워드</label> 
				</div>
				
				<c:if test = "${result == 0 }">
                <div class = "login_warn">아이디 또는 비밀번호를 잘못 입력하셨습니다.</div>
           		 </c:if>
				
				<div>
					<button type="button" onclick="loginChk()" class="pulse">로그인</button>
				</div>
			</form>
			<div class="menu align-center expanded text-cente sign">
				<p> 아직 회원이 아니시라면? <a href="signup" >회원가입</a></p>
			</div>
		</div>
	</div>
</body>
</html>