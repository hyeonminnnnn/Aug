<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
	
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<title>${item.title}</title>
<script>
		
		$(document).on("click", ".deletes", function(){
	
		const deleteConfirm = confirm("게시물을 삭제하시겠습니까?");
		
		if(deleteConfirm == true){
			alert("게시물이 삭제됐습니다.");
		}else{
			return false;
		}
		
		});
		
		function Back() {
			window.history.back();
		}
		
		function commentList() {
		const id = ${item.id};

		$.getJSON("/board/detail/clist" + "?n=" + id, function(data) {
			var str = "";

			$(data).each(function() {

						console.log(data);

						var regDate = new Date(this.regDate);
						regDate = regDate.toLocaleString("ko-US")

						str += "<li data-id='" + this.id + "'>"
								+ "<div class='left'>"
								+ "<div class='nickname'>" + this.nickname + "</div>"
								+ "<div class='contents'>" + this.contents + "</div>" + "</div>"
								+ "<div class='comfooter'>"
							    + "<div class='regDate'>"
								+ regDate + "</div>"
								 + "<button type='button' class='delete' data-cno='" + this.cno + "'>x</button>"
								 + "</div>"
								 + "</li>";
					});

			$("section.clist ol").html(str);
		});
		}
		
		$(function() {
			
			$(".content").on("click", ".bi-suit-heart", e => {
				
				const icon = e.target;					 // e.target = 자바스크립트객체
				const board_id = $(icon).data("id"); 	 // 달러로 감싸면 제이쿼리
				
				$.ajax("heart/" + board_id, {
					method :"PUT",
					success : result => {
						if(result == "OK"){
							$(icon).removeClass("bi-suit-heart");
							$(icon).addClass("bi-suit-heart-fill");
							$('#htc').load(location.href+' #htc');
						}else{
							alert("공감에 실패하였습니다.");
						}
					},
					error: result => {
						alert("공감은 로그인 이후에 가능합니다.");
					}
				});
			});
			
			
		});
</script>

</head>
<body>
	
		<c:choose>
			<c:when test="${item.boardId == 1}">
				<header class="memory">
					<%@include file="../include/detail_header.jsp" %>
				</header>

			</c:when>
			<c:when test="${item.boardId == 2}">
				<header class="community">
					<%@include file="../include/detail_header.jsp" %>
			</header>
			</c:when>
			<c:otherwise>
				<header class="notice">
					<%@include file="../include/detail_header.jsp" %>
				</header>
			</c:otherwise>
			</c:choose>
	
	<div class="details">
		<h2>${item.name} 게시판</h2>
		<div class="top">
			<div id="title">
				<p>${item.title}</p>
			</div>
				<div class="nickdate">
					<p style="padding-right: 10px; font-size: 15px; font-family:'Noto Sans KR', sans-serif; padding-top:3px; color:#555555;">${item.nickname}</p>
					<p style="font-size: 13px; margin-top:19px; padding-right: 10px; opacity: 50%;">|</p>
					<p style="font-size: 13px; font-weight: lighter; font-family:'Noto Sans KR', sans-serif; margin-top:20px; color:#555555;"><fmt:formatDate value="${item.regDate}" pattern="yyyy.MM.dd kk:ss" /></p>
				</div>
			<div>
				<div class="views">
					<div>
						<i class="bi bi-eye"></i>&nbsp;&nbsp;<span>${item.views}</span>
					</div>
					<div>
						<i class="bi bi-suit-heart"></i>&nbsp;&nbsp;<span>${item.heart}</span>
					</div>
					<div>
						<i class="bi bi-chat-right"></i>&nbsp;&nbsp;<span>${item.commentCount}</span>
					</div>
				</div>
			</div>
		</div>
			<div class="content">
				<div><c:forEach var="attach" items="${item.attachs}">
							<img src="/upload/${attach.filename}">
						</c:forEach>
						${item.contents}
						${items.heartId}
				</div>
					<div class="sym">
						<i data-id="${item.id}" class="bi bi-suit-heart" style="font-size:2.5rem; color:#7b68ee; cursor:pointer; position:relative; left:25px; top:10px;"></i>
					
						<div class="htcd">
							<p id="htc">${item.heart}</p>
						</div>
					</div>
				
			</div>
			
			
			<c:choose>
			<c:when test="${item.boardId == 1}">
			<div class="btns">
				<a href="../mlist?cg=0" class="lists">목록</a>
			<c:if test="${sessionScope.users.id == item.usersId or sessionScope.users != null && sessionScope.users.grade != '회원'}">
				<a href="../mdelete/${item.id}" class="deletes">삭제</a>
				<a href="../update/${item.id}" class="updates">변경</a>
			</c:if>
			
			</div>
			</c:when>
			<c:when test="${item.boardId == 2}">
			<div class="btns">
				<a href="../clist?cg=0" class="lists">목록</a>
			<c:if test="${sessionScope.users.id == item.usersId or sessionScope.users != null && sessionScope.users.grade != '회원'}">
				<a href="../cdelete/${item.id}" class="deletes">삭제</a>
				<a href="../update/${item.id}" class="updates">변경</a>
			</c:if>
			</div>
			
			</c:when>
			<c:when test="${item.boardId == 3}">
				<div class="btns">
				<a href="../notice" class="lists">목록</a>
				<c:if test="${sessionScope.users.id == item.usersId or sessionScope.users != null && sessionScope.users.grade != '회원'}">
					<a href="../ndelete/${item.id}" class="deletes">삭제</a>
					<a href="../update/${item.id}" class="updates">변경</a>
				</c:if>
				
				</div>
			</c:when>

			</c:choose>
			<span class="cmtCount"><img src="/resources/img/comment.png" width="20" height="20">&nbsp;댓글(${item.commentCount})</span>
		</div>
			<div class="comments">
				
			<div>

			<section class="clist">
			<ol>
			</ol>
				<script>
				commentList();
				</script>
				
				
				<script>
					$(document).on("click", ".delete", function(){
						
						const deleteConfirm = confirm("댓글을 삭제하시겠습니까?");
						
						if(deleteConfirm){
						
						const data = { cno : $(this).attr("data-cno")};
						
						$.ajax({
							url : "/board/detail/comDelete",
							type : "post",
							data : data,
							success : function(result){
								if(result == 1){
									commentList();
									$('.cmtCount').load(location.href+' .cmtCount');
								} else {
									alert("작성자 본인만 삭제할 수 있습니다.")
								}
							},
							error : function() {
								alert("로그인이 필요한 기능입니다.")
							}
						});
						}
					});
				</script>
			</section>
			
			<div id ="comment">
				<c:if test="${sessionScope.users == null}">
					<div class="input_area">
						<input style="width: 1320px; height: 40px;" 
							id="contents" name="contents" placeholder="댓글을 작성하시려면 로그인이 필요합니다." readonly></input>
					</div>
				</c:if>
				<c:if test="${sessionScope.users != null }">
					<section class="cForm">
						<form role="form" name="com_form" method="post" autocomplete="off" onsubmit="return false;">
							
							<div class="input_div">
								<input type="hidden" id="id" name="id" value="${item.id}" />
								<div class="input_area">
									<input type="text" style="width: 1250px; height: 40px;"
									id="contents" name="contents" placeholder="댓글을 입력해주세요"></input>
									<span class="focus-border"></span>
								</div>
											
								<div class="input_area">
									<button type="button" id="com_btn"><img src="/resources/img/write.png" style="height:40px; position:relative; top:3px;"></button>
									
									<script>
										$("#com_btn").click(function(){
		
											const form = document.com_form;
											const id = $("#id").val();
											const contents = $("#contents").val();
											
											const data = {id : id,
														contents : contents
														};
											
											if(form.contents.value == ""){				//폼의 아이디의 값이 ""면 alert 출력
												alert("내용을 입력해주세요.");
												form.contents.focus();			
												return;
											} 
											
											$.ajax({
												url : "/board/detail/comWrite",
												type : "post",
												data : data,
												success : function() {
													commentList();
													$("#contents").val("");
													$('.cmtCount').load(location.href+' .cmtCount');
												}
											});
										});
										
									</script>
								</div>
							</div>
						</form>
					</section>
					</c:if>
				</div>
		</div>
		</div>

	<footer>
			<%@include file="../include/footer.jsp" %>
		</footer>


</body>
</html>