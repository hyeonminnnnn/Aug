<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<h3>글 세부페이지</h3>
		</div>


		<div>
			<label>제목: </label>
			<div>${item.title}</div>
		</div>

		<div>
			<label>등록일자: </label>
			<div>
				<fmt:formatDate value="${item.regDate}" pattern="yyyy년 MM월 dd일" />
			</div>
		</div>
		<div>
			<label>등록자: </label>
			<div>${item.nickname}</div>
		</div>

		<div>
			<label>게임소개: </label>
			<div>${item.contents}</div>
		</div>


		<div>
			<a href="../list"><button type="button">목록</button></a>
		</div>

		<c:if test="${sessionScope.member.id == item.memberId}">
			<div>
				<a href="../delete/${item.id}"><button>삭제</button></a>
			</div>

			<div>
				<a href="../update/${item.id}"><button>변경</button></a>
			</div>
		</c:if>
	</div>
</body>
</html>