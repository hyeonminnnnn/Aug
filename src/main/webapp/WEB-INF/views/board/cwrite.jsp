<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 글작성</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/css/write.css">

<script>
$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['font', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['help']]
		  ];

	var setting = {
            height : 400,
            minHeight : 400,
            maxHeight : 600,
            width: 1100,
            lang : 'ko-KR',
            toolbar : toolbar,
            callbacks : {
                onImageUpload : function(files, editor,
                welEditable) {
                for (var i = files.length - 1; i >= 0; i--) {
                uploadSummernoteImageFile(files[i],
                this);
                		}
                	}
                }
             };
        $('#summernote').summernote(setting);

        
		$("#attachs").on("click", ".delete", function() {	
			$(this).closest(".input-group").remove();		//내 부모중에 input-group클래스 가지고있는거 찾음
		});
		
		$("#add").click(function() {
			//<div class="input-group mb-3">
			//	<input type="file" name="attach" class="form-control form-control-sm">
			//	<button type="button" class="btn btn-sm btn-outline-danger">삭제</button>
			// </div>
			
			const div = $("<div>");
			div.addClass("input-group");
			
			const input = $("<input>");
			input.attr("type", "file");
			input.attr("name", "attach");
			
			const button = $("<button>");
			button.attr("type", "button");
			button.addClass("delete");
			button.text("삭제");
			
			div.append(input);
			div.append(button);
			
			$("#attachs").append(div);
		});
		});
</script>
<style>
	body{
		margin:0 auto;
		overflow-x: hidden;
	}
	
	header{
		width:1920px;
		height:289px;
		background-image: url('../resources/img/write_c.jpg');
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
		<form method="post" enctype="multipart/form-data">
			<div class="wrapper">
				<div id="top">
					<div>
						<select name="categoryId">
							<c:forEach var="item" items="${list}">
								<c:if test="${item.boardId == 2}">
									<option value="${item.cgId}">${item.name}</option>
								</c:if>
								</c:forEach>
						</select>
					</div>
					
					<div>
						<input name="title" type="text" placeholder="제목을 입력해주세요">
					</div>
				</div>
				<div class="warring">
					<p>※ 카테고리를 선택해 주세요.</p>
					<p>※ 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.</p>
				</div>
				<div>
					<textarea id="summernote" name="contents"></textarea>
				</div>
				
				<div class="uploads">
					<label>이미지 업로드&nbsp;&nbsp;<button type="button" id="add">추가</button>
					</label>
					<div id="attachs">
						<div>
							<input type="file" name="attach">
						</div>
					</div>		
				</div>
				
				<div id="btns">
					<button class="write">등록</button> <a href="clist?cg=0" class="cancel">취소</a>
					<input type="hidden" id="board_id" name="board_id"
								value = 2 />
				</div>
			</div>
		</form>
	<footer>
			<%@include file="../include/footer.jsp" %>
		</footer>
</body>
</html>