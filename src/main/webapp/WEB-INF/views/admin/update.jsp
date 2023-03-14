<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원 정보수정</title>
<link rel="stylesheet" href="../../resources/css/admin_update.css">
</head>
<body>
		<header>
			<%@include file="../include/detail_header.jsp" %>
		</header>
			<form method="post">
				<div class="wrapper">
					<h3>정보 수정</h3>
					<div class="divs">
						<label>아이디 </label> <span>${item.id}</span>
					</div>
					
					<div class="divs">
						<label>가입일자 </label><span><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd HH:mm" /></span>
					</div>
					
					<div class="divs">
						<label>닉네임 </label>
						<input name="nickname" type="text" value="${item.nickname}">
					</div>
					
					<div class="divs">
						<c:if test="${sessionScope.users.grade == '마스터'}">
							<label>등급 </label><c:if test="${item.grade == '마스터'}"> 마스터
								<input type="hidden" name="grade" value="마스터">
							</c:if>
							
							<c:if test="${item.grade != '마스터'}">
								<select name="grade">
										<option>회원</option>
										<option>관리자</option>
								</select>
							</c:if>
						</c:if>
						
						<c:if test="${sessionScope.users.grade == '관리자'}">
							<label>등급 </label> <span>${item.grade}</span>
						</c:if>
					</div>
					
				
					<div class="div_btn">
						<button class="updates">수정</button> <button type="button" onClick="history.back();" class="cancel">취소</button>
					</div>
				</div>
			</form>
		<footer id="footer">
			<%@include file="../include/footer.jsp" %>
		</footer>
</body>
</html>