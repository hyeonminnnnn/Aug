<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign Up</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="resources/css/signup.css">
<style>
body {
	width:1920px;
	height:950px;
	margin: 0 auto;
	overflow-x: hidden;
	overflow-y: hidden;
	background-image: url('resources/img/login.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	color:white;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	text-align: center;
}
</style>
<script>
	let isCheck;
	
	function checkId(mode){
		if(document.signup_form.id.value == ""){
			alert("중복검사 전 아이디를 입력해 주세요.")
			return;
		}
		
		if(mode)
			checkId_Async();
		}
	
	function checkId_Async(){
		const form = document.signup_form;
		
		$.ajax("checkId/" + form.id.value, {
			method:"GET",
			success : result => {
				console.log(result);
				if(result == "OK"){
					isCheck = form.id.value;
					alert("사용 가능한 아이디입니다.");
				} else
					alert("이미 사용중인 아이디입니다.");
			},
			error: result => {
				alert("오류");
			}
		})
	}	
	
	function signup(){
		const form = document.signup_form;
		
		if(isCheck != form.id.value){
			alert("중복 검사를 완료해 주세요");
			return;
		}
		
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
		
		if(form.passwd_chk.value == ""){
			alert("비밀번호 확인을 입력해 주세요");
			form.passwd_chk.focus();
			return;
		}
		
		if(form.passwd_chk.value != form.passwd.value){
			alert("비밀번호가 일치하지 않습니다.");
			form.passwd_chk.focus();
			return;
		}
		
		if(form.nickname.value == ""){
			alert("닉네임을 입력해 주세요")
			form.nickname.focus();
			return;
		}
		form.submit();
	}
	
</script>
</head>
<body>
	<div>
		<div class="form-group">
		<h1 class="logo"><img src="resources/img/login_logo.png"
						alt="logo"></h1>
			<form name="signup_form" method="post" class="form">
				<div class="group1">
					<div class="label"><label>아이디 </label></div>
					<div class="input"><input name="id" type="text" placeholder="20자 이내로 입력해주세요" maxlength="20"></div>
					<div class="center">
				      <button type="button" onclick="checkId(true)" class="btn">중복검사
				      </button>
				    </div>
				</div>
					
				<div class="group">
					<div class="label1"><label>비밀번호 </label></div>
					<div class="input"><input name="passwd" type="password" class="input" maxlength="20" placeholder="20자 이내로 입력해주세요" required></div>
				</div>
				
				<div class="group">
					<div class="label2"><label>비밀번호 확인 </label></div>
					<div class="input"><input name="passwd_chk" type="password" class="input" required></div>
				</div>
				
				<div class="group">
					<div class="label"><label>닉네임 </label></div>
					<div class="input"><input name="nickname" type="text" class="input" maxlength="10" placeholder="10자 이내로 입력해주세요" required></div>
				</div>
				
				<button type="button" onclick="signup()" class="button">
				<svg width="525px" height="60px" viewBox="0 0 525 60" class="border">
				          <polyline points="524,1 524,59 1,59 1,1 524,1" class="bg-line" />
				          <polyline points="524,1 524,59 1,59 1,1 524,1" class="hl-line" />
				        </svg>
				    <span>회원가입</span>
				</button> <br>
			</form>
		</div>
	</div>
</body>
</html>