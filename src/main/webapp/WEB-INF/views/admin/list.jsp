<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/list.css">
<style>
	body{
		margin:0 auto;
		overflow-x: hidden;
	}
	header{
		width:1920px;
		height:289px;
		background-image: url('../resources/img/sub_a.jpg');
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

<script>


$(document).on("click", ".delete", function(){
	
	const deleteConfirm = confirm("회원 탈퇴 처리하시겠습니까?");
	
	if(deleteConfirm == true){
		alert("회원 탈퇴 처리가 완료됐습니다.");
	}else{
		return false;
	}
	
	});
</script>
</head>
<body>
	<header>
		<%@include file="../include/header.jsp" %>
	</header>
		<form>
			<div class="tb">
			<select name="search" class="select">
				<option value = "1">아이디</option>
				<option value = "2">닉네임</option>
				<option value = "3">등급</option>
			</select>
				<div class="td">
					<input type="text" name="keyword" placeholder="검색어를 입력해주세요." required>
				</div>
		
				<div class="td" id="s-cover">
					<button class="btn"><div id="s-circle"></div><span></span></button>
				</div>	
			</div>
			</form>
	
	<div>
		<table class="post_wrap">
			<thead>
				<tr class="post_table_t">
					<th>아이디</th>
					<th>닉네임</th>
					<th>가입일자</th>
					<th>등급</th>
					<th>관리</th>
					<th>정보관리</th>
					</tr>
			</thead>
			
			<tbody>
				<c:if test="${list.size() < 1}">
					<tr  class="nope">
						<td colspan="6"><h3>가입된 회원이 없습니다.</h3></td>
					</tr>
				</c:if>
				
				<c:forEach items="${list}" var="item">
				<c:if test="${sessionScope.users.grade == '마스터'}">
						<tr class="post_con">
							<td id="hi">${item.id}</td>
							<td>${item.nickname}</td>
							<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td>${item.grade}</td>
							<td class="an"><a href="delete/${item.id}" class="delete">회원탈퇴</a></td>
							<td class="an">
								<a href="update/${item.id}" class="set">정보수정</a>
							</td>
						</tr>
				</c:if>
				</c:forEach>
			
				<c:forEach items="${list}" var="item">
				<c:if test="${sessionScope.users.grade == '관리자'}">
					<c:if test="${item.grade != '마스터'}">
						<tr class="post_con">
							<td>${item.id}</td>
							<td>${item.nickname}</td>
							<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td>${item.grade}</td>
							<td><a href="delete/${item.id}">회원탈퇴</a></td>
							<td>
								<a href="update/${item.id}" class="set">정보수정</a>
							</td>
							
						</tr>
					</c:if>
					</c:if>
				</c:forEach>

			</tbody>
		</table>
		
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
			<img src="/resources/img/aug_footer.jpg" alt="footer">
		</footer>
</body>
</html>