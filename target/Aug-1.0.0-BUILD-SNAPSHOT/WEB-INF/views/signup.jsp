<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Page</title>
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
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			console.log("xhr.readyState");
			
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
					const result = xhr.responseText;
					console.log("응답: " + result);
					
					if(result == "OK"){
						isCheck = form.id.value;
						alert("사용 가능한 아이디입니다.");
					} else
						alert("이미 사용중인 아이디입니다.");
				}
			}
		};
		
		xhr.open("GET", "checkId/" + form.id.value, true);
		
		xhr.send();
		
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
		<div>
			<form name="signup_form" method="post">
				<div>
					<label>아이디: </label>
					<input name="id" type="text">
					<button type="button" onclick="checkId(true)">중복확인</button>
				</div>
				
				<div>
					<label>비밀번호: </label>
					<input name="passwd" type="password">
				</div>
				
				<div>
					<label>비밀번호 확인: </label>
					<input name="passwd_chk" type="password">
				</div>
				
				<div>
					<label>닉네임: </label>
					<input name="nickname" type="text">
				</div>
				
				<button type="button" onclick="signup()">회원가입</button> 
				<a href=".."><button type="button">취소</button></a>
			</form>
		</div>
	</div>
</body>
</html>