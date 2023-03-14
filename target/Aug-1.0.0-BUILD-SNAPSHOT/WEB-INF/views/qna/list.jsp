<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
</head>
<body>
	<div>
	<div>
	<h1>궁금해요</h1>
	</div>
	<div>
	<table border="1">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일자</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="5">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
										
					<c:forEach items="${list}" var="item">
						<tr>
							<td>${item.id}</td>
							<td>${item.title}</td>
							<td>${item.nickname}</td>
							<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd"/></td>
							<td>1</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div>
				<a href="write"><button type="button">글쓰기</button></a>
			</div>
		</div>
	</div>
</body>
</html>