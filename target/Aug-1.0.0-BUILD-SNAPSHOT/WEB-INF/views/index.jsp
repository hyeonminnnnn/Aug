<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<style>
	ul li {
		list-style-type: none;
		display : inline;
		margin-left : 20px;
		text-align: right;
		position : relative;
		left: 1000px;
		}
	
</style>
</head>

<body>
	<div>
		<header>
			<div>
			<h1>
				<a href="..">AUG</a>
			</h1>
				<nav>
					<ul>
						<li><a href="comm/list">커뮤니티</a></li>
						<li><a href="worry/list">고민상담</a></li>
						<li><a href="qna/list">궁금해요</a></li>
					</ul>
				</nav>
			</div>
		</header>
	</div>
	<div>
		<div>
			<c:if test="${sessionScope.users.nickname == null }">
				<div>
					<a href="login"><button type="button">로그인</button></a>
				</div>
			</c:if>
			
			<c:if test="${sessionScope.users.nickname != null }">
				<div>
					<p>${sessionScope.users.nickname}님 어서오세요!</p>
				</div>
				<div>
					<a href="logout"><button type="button">로그아웃</button></a>
				</div>
			</c:if>
		</div>
	</div>

</body>
</html>