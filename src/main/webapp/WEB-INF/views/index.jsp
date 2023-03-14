<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AUG</title>
<link rel="stylesheet" href="resources/css/main.css">
<style>
body {
	margin: 0px;
	overflow-x: hidden;

}

.body{
	width:1920px;
	height:1000px;
	background-image: url('resources/img/aug_body.gif');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

header {
	width:1920px;
	height:1080px;
	background-image: url('resources/img/aug_main.jpg');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-attachment: fixed;
}
</style>
</head>

<body>
		<header>
			<div class="wrap">
				<h1><a href="/Aug" id="logo"><img src="resources/img/aug_logo.png"
						alt="logo"></a></h1>
				<nav class="nav">
					<ul class="effect">

							<c:if test="${sessionScope.users != null && sessionScope.users.grade != '회원'}">
								<li><a href="admin/list">회원관리</a></li>
							</c:if>
						
						<li><a href="board/notice">공지사항</a></li>
						<li><a href="board/mlist?cg=0">추억공유</a></li>
						<li><a href="board/clist?cg=0">커뮤니티</a></li>
						
						<c:if test="${sessionScope.users == null }">
							<li>
								<a href="login">로그인</a>
							<li>
						</c:if>

						<c:if test="${sessionScope.users != null }">
							<li>
								<a href="logout">로그아웃</a>
							<li>
						</c:if>
					</ul>		
				</nav>
			</div>
			<img src="resources/img/main_coment.png" class="moon">
	
			
			<a href="board/mlist?cg=0" class="link">바로가기</a>
			
			
			<div class="scroll-downs">
			
			  <div class="mousey">
			    <div class="scroller"><a href="#body"></a></div>
			  </div>
			 
			</div>
			
		</header>
			
		<div class="body" id="body">
			<div class="box-wrap">
				<img src="resources/img/aug_box(n).png" alt="notice_box" class="box">

	
				<img src="resources/img/aug_box(m).jpg" alt="memory_box" class="box">
				

	
				<img src="resources/img/aug_box(c).jpg" alt="comunity_box" class="box">

			</div>
	
				
				<a href="board/notice" id="box_nlink">바로가기</a>		
				<a href="board/mlist?cg=0" id="box_mlink">바로가기</a>		
				<a href="board/clist?cg=0" id="box_clink">바로가기</a>
			
				
		</div>
	
	<footer>
		<%@include file="include/footer.jsp" %>
	</footer>

</body>
</html>