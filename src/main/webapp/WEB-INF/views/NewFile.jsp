<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<jsp:include page="header.jsp"></jsp:include>

</head>
<style>
	.priceBox{
		display:none;
	}
	
	.categoryBox{
		display:none;
	}
	
	.statusBox{
		display:none;
	}
	
	.select{
		width:40%;
		margin:0;
	}
	
	.input{
		width:60%;
		margin:0;
	}
	
	.search{
		display:flex;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	$(document).ready(function() {
		 $('#selectBox').change(function(){
			 $('.priceBox').hide();
		     $('.categoryBox').hide();
		     $('.statusBox').hide();
		 })
		
		  $('#selectBox').change(function() {
		    var result = $('#selectBox option:selected').val();
		    if (result == '3') {
		        $('.priceBox').show();
		        $('.categoryBox').hide();
		        $('.statusBox').hide();
		        $('.keywordBox').hide();
		    } else if(result == '4'){
		        $('.categoryBox').show();
		        $('.priceBox').hide();
		        $('.statusBox').hide();
		        $('.keywordBox').hide();
		    } else if(result == '5'){
		    	$('.statusBox').show();
		    	$('.priceBox').hide();
		    	$('.categoryBox').hide();
		    	$('.keywordBox').hide();
		    }else{
		    	$('.keywordBox').show();
		    	$('.priceBox').hide();
		    	$('.categoryBox').hide();
		    	$('.statusBox').hide();
		    }
		  }); 
		}); 
</script>
<body>
	<div class="container">
		<div>
			<h3>제품 목록</h3>
		</div>
		
		<div>
			<form>
				<div class="search">
					<div class="select">
						<select id="selectBox" name="search" class="form-select form-select-sm">
							<option value="1">제품번호</option>
							<option value="2">제품명</option>
							<option value="3">단가</option>
							<option value="4">구분</option>
							<option value="5">판매여부</option>
						</select>
					</div>
					
					<div class="input">
						<div class="keywordBox">
							<input name="keyword" type="text" class="form-control">
						</div>
						
						<div class="priceBox">
							<label>하한금액:</label>
							<input name="minPrice" type="number" class="form-control" >~
							<label>상한금액:</label>
							<input name="maxPrice" type="number" class="form-control">
						</div>
						
						<div class="categoryBox">
							<select name="keyword" class="form-select form-select-sm">
								<option value="1">음료</option>
								<option value="2">푸드</option>
								<option value="3">상품</option>
								<option value="4">카드</option>
							</select>
						</div>
						
						<div class="statusBox">
							<select name="keyword" class="form-select form-select-sm">
								<option value="0">판매중지</option>
								<option value="1">판매중</option>
							</select>
						</div>
					</div>
					
					<div>
						<button>검색</button>
					</div>
				</div>
			</form>
		</div>
		
		<div>
			<table border="1" class="table table-dark table-sm table-striped table-hover">
				<thead>
					<tr>
						<th>제품번호</th>
						<th>제품명</th>
						<th>단가</th>
						<th>구분</th>
						<th>판매여부</th>
						<th>관리</th>
					</tr>
				</thead>
				
				<tbody class="table-group-divider">
					<c:if test="${list.size() < 1} ">
					<tr>
						<td colspan="6">등록된 제품이 없습니다.</td>
					</tr>
					</c:if>
					
					<c:forEach var="item" items="${list}">
					<tr>
						<td>${item.id}</td>
						<td>${item.name}</td>
						<td>${item.price}원</td>
						<td>${item.category_}</td>
						<td>${item.status_}</td>
						<td><a href="update/${item.id}" class="btn btn-sm btn-outline-warning">변경</a>
						 <a href="delete/${item.id}" class="btn btn-sm btn-outline-danger">삭제</a></td>
					</tr>
					</c:forEach>
				</tbody>
				
				<tfoot>
					<tr>
						<td colspan="6">
							<ol class="pagination pagination-sm justify-content-center" style="margin : 0">
								<li class="page-item"><a href="?page=1${pager.query}" class="page-link">처음</a></li>
								<li class="page-item"><a href="?page=${pager.prev}${pager.query}" class="page-link">이전</a></li>
								
								<c:forEach var="page" items="${pager.list}">
									<li class="page-item"><a href="?page=${page}${pager.query}" class="page-link ${page eq pager.page ? 'active' : ''}">${page}</a></li>
								</c:forEach>
								
								<li class="page-item"><a href="?page=${pager.next}${pager.query}" class="page-link">다음</a></li>
								<li class="page-item"><a href="?page=${pager.last}${pager.query}" class="page-link">마지막</a></li>
							</ol>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
		
		<div class="mt-2">
			<a href="dummy" class="btn btn-sm btn-warning">대량 등록</a> <a href="init" class="btn btn-sm btn-danger">초기화</a>
		</div>
		
		<div class="mt-2">
			<a href="add" class="btn btn-sm btn-primary">등록</a> <a href=".." class="btn btn-sm btn-warning">이전</a>
		</div>
	</div>
</body>
</html>