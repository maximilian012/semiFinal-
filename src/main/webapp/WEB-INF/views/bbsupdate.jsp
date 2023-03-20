<%@page import="mul.cam.food.dto.MemberDto"%>
<%@page import="mul.cam.food.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 페이지</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">

  <!--  jQuery, bootstrap -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

  <!--  
  <!-- 서머노트를 위해 추가해야할 부분 
  <script src="../summerNote/summernote-lite.js"></script>
  <script src="../summerNote/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="../summerNote/summernote-lite.css">
   -->
  
</head>
<style>
 body {
 	font-size:18px;
 }
.note-editor {
width:900px;
}
input {
border: none;
border-bottom: 2px solid #ddd;
}
#content-wrapper {
	margin-left:100px;
}
#button-wrapper {
	text-align:center;
	margin-top: 10px;

}
</style>

<%
BbsDto dto = (BbsDto)request.getAttribute("dto");
MemberDto login = (MemberDto)session.getAttribute("login");		

%>        

<body>
<h3>게시글 수정하기</h3>
<div id="content-wrapper">
	<form action="bbsupdateAf.do" id="frm" method="get">
		<input type="hidden" name="writer" value="<%=login.getUserId() %>">
		<input type="hidden" name="auth" value="<%=login.getAuth()%>">
		<div class="mb-3">

			<label for="title">썸네일</label>
			  <textarea class="summernote" name="thumbnail" rows="18"><%=dto.getThumbnail() %></textarea>
				
		</div>
		<div class="mb-3">

			<label for="title">제목</label>

			<input type="text" class="form-control" name="title" id="title" value="<%=dto.getTitle() %>">

		</div>
		<div class="mb-3">

			<label for="title">카테고리</label>

				<div class="custom-control custom-checkbox">
				<input type="checkbox" id="jb-checkbox" class="custom-control-input" name="category" value="1"  onclick="clickCheck(this)">
				<label class="custom-control-label" for="jb-checkbox">양식</label>
				</div>
				<div class="custom-control custom-checkbox">
				<input type="checkbox" id="jb-checkbox" class="custom-control-input" name="category" value="2"  onclick="clickCheck(this)">
				<label class="custom-control-label" for="jb-checkbox">중식</label>
				</div>
				<div class="custom-control custom-checkbox">
				<input type="checkbox" id="jb-checkbox" class="custom-control-input" name="category" value="3"  onclick="clickCheck(this)">
				<label class="custom-control-label" for="jb-checkbox">일식</label>
				</div>
				<div class="custom-control custom-checkbox">
				<input type="checkbox" id="jb-checkbox" class="custom-control-input" name="category" value="4"  onclick="clickCheck(this)">
				<label class="custom-control-label" for="jb-checkbox">분식</label>
				</div>
				<div class="custom-control custom-checkbox">
				<input type="checkbox" id="jb-checkbox" class="custom-control-input" name="category" value="5"  onclick="clickCheck(this)">
				<label class="custom-control-label" for="jb-checkbox">한식</label>
				</div>
				<div class="custom-control custom-checkbox">
				<input type="checkbox" id="jb-checkbox" class="custom-control-input" name="category" value="6"  onclick="clickCheck(this)">
				<label class="custom-control-label" for="jb-checkbox">디저트</label>
				</div>

		</div>

		<div class="mb-3">

					<label for="reg_id">조리시간</label>

					<input type="text" class="form-control" name="cookingtime" id="cookingtime" value="<%=dto.getCookingtime() %>">

				</div>
				
				<div class="mb-3">

					<label for="reg_id">인분</label>

					<input type="text" class="form-control" name="serving" id="serving" value="<%=dto.getServing() %>">

				</div>

				

				<div class="mb-3">

					<label for="content">레시피 재료</label>

					<textarea class="form-control" rows="5" name="ingredients" id="ingredients"><%=dto.getIngredients() %></textarea>

				</div>

				

				<div class="mb-3">

					<label for="tag">TAG</label>

					<input type="text" class="form-control" name="tag" id="tag" value="<%=dto.getTag() %>">

				</div>
			<div class="mb-3">
			<label for="tag">내용</label>
				 <textarea class="summernote" name="content" rows="18"><%=dto.getContent() %></textarea>
				

			</div>

		<div class="pt-1 text-right">
			<a id="updateBtn" style="height:35px;" class="btn btn-outline-warning">수정하기</a>
			<a id="listBtn" style="height:35px;" class="btn btn-outline-warning" onclick="location.href='bbsdetail.do?seq=<%=dto.getSeq() %>'">뒤로가기</a>
			<a id="deleteBtn" style="height:35px;" class="btn btn-outline-warning">삭제하기</a>
		</div>
	</form>
</div>

<script>

$('.summernote').summernote({
	  height: 450,
	  lang: "ko-KR"
	});
	
$(document).ready(function() {	
	$("#submitBtn").click(function() {		
		if($("#title").val().trim() == "" ){
			alert("제목을 기입해 주십시오");
			return;
		}else if($("#content").val().trim() == "" ){
			alert("내용을 기입해 주십시오");
			return;
		}else{
			$("#frm").submit();
		}		
	});
	
	/* 수정하기 버튼 */
	$("#updateBtn").on("click", function() {
		$("#frm").submit();
	});
	
	/* 삭제하기 버튼 */
	$("#deleteBtn").on("click", function(){
	    $("#frm").attr("action", "bbsdelete.do");
	    $("#frm").attr("method", "post");
	    $("#frm").submit();
	});

	/* 게시판 목록 (뒤로가기) 이동 버튼 */
	$("#listBtn").on("click", function() {
		$("#listFrm").find("#seq").remove();
		$("#listFrm").attr("action", "bbslist.do");
		$("#listFrm").submit();
	});
	
});
</script>
 
</body>
</html>