<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="../resources/css/list.css">
<style>
	body{
		margin:0 auto;
		overflow-x: hidden;
	}
	header{
		width:1920px;
		height:540px;
		background-image: url('../resources/img/sub_n.jpg');
		background-repeat: no-repeat;
		background-position: center;
		background-size: auto;
	}
	footer{
		margin:0 auto;
		width:100%;
		height:54px;
		padding-top: 70px;
	}
</style>
</head>
<body>
	<header>
		<%@include file="../include/header.jsp" %>
	</header>
	<div>
		<h2 class="notice">공지사항</h2>
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
			
			<c:if test="${sessionScope.users != null && sessionScope.users.grade != '회원'}">
			<div class="nav_circle" style="cursor:pointer;" onclick="location.href='nwrite'"><img src="/resources/img/write.png" width="30" height="30"></div>

			<div class="mid">
				<button type="button" onclick="location.href='nwrite'" class="writ"><img src="/resources/img/write.png"><p>글쓰기</p></button>
				</div>
			</c:if>
		</div>
			<div>
					<table class="post_wrap">
						<thead>
							<tr class="post_table_t">
								<th>번호</th>
								<th>카테고리</th>
								<th id="title_th">제목</th>
								<th>글쓴이</th>
								<th>등록일</th>
								<th>조회수</th>
								<th>공감</th>
							</tr>
						</thead>
						
						<tbody>
							<c:if test="${list.size() < 1 }">
								<tr class="nope">
									<td colspan="6">등록된 게시글이 없습니다.</td>
								</tr>
							</c:if>
							
							
							<c:forEach items="${list}" var="item">
								<c:if test="${item.boardId == 3}">
									<tr class="post_con">
										<td>${item.id}</td>
										<td>공지</td>
										<td class="title" style="font-weight:bolder;"><a href="detail/${item.id}">
											<c:choose>
												<c:when test="${fn:length(item.title) gt 30 }">
													<c:out value='${fn:substring(item.title.replaceAll("\\\<.*?\\\>",""),0, 30)}'></c:out>...</c:when>
														
												<c:otherwise>
													<c:out value='${fn:substring(item.title.replaceAll("\\\<.*?\\\>",""),0, 30)}'></c:out>
												</c:otherwise>
											</c:choose>
											</a>
											<c:if test="${item.commentCount >= 1}">
												[${item.commentCount}]
											</c:if>
											<c:if test="${item.attachs.size() >= 1 }">
												<img src="/resources/img/image.png" width="20" height="20">
											</c:if>
											</td>
											<td style="font-weight:bolder; color:#7b68ee">${item.nickname}</td>
												<td><fmt:formatDate value="${item.regDate}" pattern="MM/dd HH:mm" /></td>
												<td>${item.views}</td>
												<td>${item.heart}</td>
										</tr>	
					
								</c:if>
							</c:forEach>	
						</tbody>
					</table>
					
		
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