<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>추억공유</title>
<link rel="stylesheet" href="../resources/css/memory.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<style>
	body{
		margin:0 auto;
		overflow-x: hidden;
	}
	header{
		width:1920px;
		height:540px;
		background-image: url('../resources/img/sub_m.jpg');
		background-repeat: no-repeat;
		background-position: center;
		background-size: auto;
	}
	
	footer{
		margin:0 auto;
		width:100%;
		height:54px;
	}
</style>

</head>
<body>
	<header>
	<%@include file="../include/header.jsp" %>
	</header>
	<div class="main">
	
	<div class="boards">
		<h2><%if("0".equals(request.getParameter("cg"))) %>전체 게시판</h2>
		<h2><%if("1".equals(request.getParameter("cg"))) %>10대 게시판</h2>
		<h2><%if("2".equals(request.getParameter("cg"))) %>20대 게시판</h2>
		<h2><%if("3".equals(request.getParameter("cg"))) %>30대 게시판</h2>
		<h2><%if("4".equals(request.getParameter("cg"))) %>40대 게시판</h2>
		<h2><%if("5".equals(request.getParameter("cg"))) %>50대 이상 게시판</h2>
	</div>
		<div>
			<form>
			<div class="tb">
			<select name="search" class="select">
				<option value = "1">제목</option>
				<option value = "2">내용</option>
				<option value = "3">작성자</option>
			</select>
				<div class="td">
					<input type="text" name="keyword" placeholder="검색어를 입력해주세요." required>
					<input type="hidden" name="cg" value="0">
				</div>
		
				<div class="td" id="s-cover">
					<button class="btn"><div id="s-circle"></div><span></span></button>
				</div>	
			</div>
			</form>
		</div>
		    <div class="nav_circle" style="cursor:pointer;" onclick="location.href='mwrite'"><img src="/resources/img/write.png" width="30" height="30"></div>
			<div>
				<button class="writ" onclick="location.href='mwrite'"><img src="/resources/img/write.png"><p>글쓰기</p></button>
				<div class="mid">
					<form class="ageF" name="ctg">
						<button name="cg" value="0" class="more">전체</button>
						<button name="cg" value="1" class="more">10대</button>
						<button name="cg" value="2" class="more">20대</button>
						<button name="cg" value="3" class="more">30대</button>
						<button name="cg" value="4" class="more">40대</button>
						<button name="cg" value="5" class="more">50대 이상</button>
					</form>
				</div>
					<c:choose>
						<c:when test="${list.size() < 1}">
							<div class="post_nope">
								등록된 게시글이 없습니다.<br>제일 먼저 추억을 공유해봐요!
							</div>
						</c:when>

						<c:otherwise>
							<div class="post_wrap">
								<ul class="post_ul">
								<c:forEach items="${list}" var="item">
									<c:if test="${item.boardId == 1}">
											<li>
											<div class="tape">
											<img src="/resources/img/테이프.png" width="80" height="80">
											</div>
											<c:if test="${item.attachs.size() >= 1 }">
												<c:forEach var="attach" items="${item.attachs}" begin="0" end="0">
													<a href="detail/${item.id}" class="main_img"><img src= "/upload/${attach.filename}" width="300" height="280"></a>
												</c:forEach>
											</c:if>
											
											<c:if test="${item.attachs.size() < 1 }">
												<a href="detail/${item.id}" class="no_img"><img src="/resources/img/no.jpg"></a>
											</c:if>
											
											<div class="con"><br>
												<div class="titles">
													<a href="detail/${item.id}">
														<c:choose>
															<c:when test="${fn:length(item.title) gt 20 }">
															<c:out value='${fn:substring(item.title.replaceAll("\\\<.*?\\\>",""),0, 20)}'></c:out>...</c:when>
														
															<c:otherwise>
																<c:out value='${fn:substring(item.title.replaceAll("\\\<.*?\\\>",""),0, 20)}'></c:out>
															</c:otherwise>
														</c:choose>
													</a>
												</div>
													<div class="contents">
														<c:choose>
															<c:when test="${fn:length(item.contents) gt 22 }">
															<c:out value='${fn:substring(item.contents.replaceAll("\\\<.*?\\\>",""),0, 22)}'></c:out>..</c:when>
														
															<c:otherwise>
																<c:out value='${fn:substring(item.contents.replaceAll("\\\<.*?\\\>",""),0, 22)}'></c:out>
															</c:otherwise>
														</c:choose>
													</div>	
													<div class="sit">
													<br><br><p>${item.name}</p>&emsp;<p style="opacity: 50%;">|</p>&emsp;
													<c:choose>
														<c:when test="${item.grade == '관리자' or item.grade == '마스터'}">
															<p style="color:#7b68ee">${item.nickname}</p>
														</c:when>
														<c:otherwise>
															<p>${item.nickname}</p>
														</c:otherwise>
														</c:choose>
													</div>
													</div>
					
												<div class="views">
													<div class="left">
														<fmt:formatDate value="${item.regDate}" pattern="yyyy.MM.dd" />									
													</div>
													<div class="right">
														<div>
															<i class="bi bi-eye"></i>&nbsp;<span>${item.views}</span>
														</div>
														<div>
															<i class="bi bi-suit-heart"></i>&nbsp;<span>${item.heart}</span>
														</div>
														<div>
															<i class="bi bi-chat-right"></i>&nbsp;<span>${item.commentCount}</span>
														</div>
													</div>
												</div>
											</li>
									</c:if>
								</c:forEach>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
					</div>
				<div class="page">
					<div class="pagination">
						<div>
							<a href="?page=1&${pager.query}" class="first">처음</a>
						</div>
						<div>
							<a href="?page=${pager.prev}&${pager.query}" class="prev">이전</a>
						</div>
		
						<c:forEach var="page" items="${pager.list}">
							<div>
								<a href="?page=${page}&${pager.query}" class="num${page eq pager.page ? 'active' : ''}">${page}</a>
							</div>
						</c:forEach>
		
						<div>
							<a href="?page=${pager.next}&${pager.query}" class="next">다음</a>
						</div>
						<div>
							<a href="?page=${pager.last}&${pager.query}" class="last">마지막</a>
						</div>
					</div>
				</div>

		</div>
		<footer>
			<%@include file="../include/footer.jsp" %>
		</footer>
</body>
</html>