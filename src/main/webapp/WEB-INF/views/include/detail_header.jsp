<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
html {
    scroll-behavior: smooth;
}

#logo{
	top:10px;
	position: relative;
}
.wrap{
	width:1520px;
	height:120px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
    align-items: center;
}

.nav{
	display:flex;
    align-items: center;
}

a{
	text-decoration: none;
}

a:visited{
	text-decoration: none;
}


.effect li {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 23px;
	list-style-type: none;
	display: inline;
	margin-left: 65px;
	position: relative;
	opacity: 70%;
}


.login_effect a{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 23px;
	opacity: 70%;
	position : relative;
	text-decoration: none;
	margin-left: 65px;
}

.box{
	display: flex;
	position: relative;
	left:200px;
	top:300px;
}

.box div{
	margin-right:50px;
}

.effect a {
text-decoration: none;
  padding: 0;
  z-index: 1;
  color:white;

}

.effect a:hover {
text-decoration: none;
  color: rgba(255, 255, 255, 0.6);
  -ms-animation: circleOpacity forwards 1s;
  -moz-animation: circleOpacity forwards 1s;
  -webkit-animation: circleOpacity forwards 1s;
  animation: circleOpacity forwards 1s;
}

@keyframes circleOpacity {
  0% {
    opacity: 1;
  }
  100% {
    opacity: 1;
  }
}

.effect a:before, .effect a:after {
  text-decoration: none;
  position: absolute;
  top: 0px;
  left: 0;
  content: "◯";
  display: block;
  width: 100%;
  font-size: 0px;
  color: rgba(255, 255, 255, 0.6);
  text-align: center;
  z-index: -1;
}

.effect a:hover:before {
  animation: circledrop 1s;
  -ms-animation: circledrop 1s;
  -moz-animation: circledrop 1s;
  -webkit-animation: circledrop 1s;
}

.effect a:hover:after {
  animation: circledrop 1s 0.5s;
  -ms-animation: circledrop 1s 0.5s;
  -moz-animation: circledrop 1s 0.5s;
  -webkit-animation: circledrop 1s 0.5s;
}

@keyframes circledrop {
  0% {
    opacity: 1;
    font-size: 0;
    top: 0;
  }
  100% {
    opacity: 0;
    font-size: 80px;
    top: -50px;
  }
}
</style>
</head>
<body>
			<div class="wrap">
				<h1><a href="/" id="logo"><img src="../../resources/img/aug_logo.png"
						alt="logo"></a></h1>
				<nav class="nav">
					<ul class="effect">
						<c:if test="${sessionScope.users != null && sessionScope.users.grade != '회원'}">
								<li><a href="../../admin/list">회원관리</a></li>
						</c:if>
						<li><a href="../../board/notice">공지사항</a></li>
						<li><a href="../../board/mlist?cg=0">추억공유</a></li>
						<li><a href="../../board/clist?cg=0">커뮤니티</a></li>
						
						<c:if test="${sessionScope.users.nickname == null }">
							<li>
								<a href="../../login">로그인</a>
							<li>
						</c:if>

						<c:if test="${sessionScope.users.nickname != null }">
							<li>
								<a href="../../logout">로그아웃</a>
							<li>
						</c:if>
					</ul>		
				</nav>
			</div>
</body>
</html>