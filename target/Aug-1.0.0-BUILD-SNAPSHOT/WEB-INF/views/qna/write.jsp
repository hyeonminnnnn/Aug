<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문글 작성</title>
</head>
<body>
	<div>
		<h1>질문글 작성</h1>
	</div>
	<div>
		<form method="post">
			<div>
				<label>글 제목: </label>
				<input name="title" type="text">
			</div>
			
			<div>
				<label>내용: </label>
				<textarea name="contents" placeholder="내용을 입력해주세요"></textarea>
			</div>
			
			<div>
				<button>등록</button> <a href="list"><button type="button">취소</button></a>
			</div>
		</form>
	</div>
</body>
</html>