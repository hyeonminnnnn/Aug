<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<script>
	let isCheck;
	
	function loginChk(mode){
		if(document.login.id.value == ""){
			alert("아이디를 입력해 주세요.")
			return;
		}
		
		if(document.login.passwd.value == ""){
			alert("비밀번호를 입력해 주세요.")
			return;
		}
		
		if(mode)
			checkId();
		}
	
	function checkId(){
		const form = document.login;
		
		const xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function(){
			console.log("xhr.readyState");
			
			if(xhr.readyState == XMLHttpRequest.DONE){
				if(xhr.status == 200){
					const result = xhr.responseText;
					console.log("응답: " + result);
					
					if(result == "OK"){
						alert("아이디 또는 비밀번호를 잘못 입력했습니다.");
					} 
				}
			}
		};
		
		xhr.open("GET", "checkId/" + form.id.value, true);

		xhr.send();
		
	}

</script>
</head>
<body>
	<div>
		<div>
			<form name="login" method="post">
				<div>
					<label>아이디 :</label> <input name="id" type="text">
				</div>

				<div>
					<label>패스워드: </label> <input name="passwd" type="password">
				</div>

				<div>
					<button type="button" onclick="loginChk(true)">로그인</button>
					<a href="/"><button type="button">취소</button></a>
				</div>
			</form>
		</div>

		<div>
			<p>
				아직 회원이 아니시라면? <a href="signup">회원가입</a>
			</p>
		</div>
	</div>
</body>
</html>