<%@page import="mul.cam.food.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	
	<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

	
</head>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");		
%> 
<body>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#" ><img alt="" src="./images/logo.png" width="60" height="60" align="left"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-between"
				id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> 카테고리 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="#">종류</a></li>
							<li><a class="dropdown-item" href="#">재료</a></li>
							<li><a class="dropdown-item" href="#">방법</a></li>
							<li><a class="dropdown-item" href="#">테마</a></li>
							<li><a class="dropdown-item" href="#">기념일</a></li>
							<li><a class="dropdown-item" href="#">도구</a></li>
						</ul></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item" style="text-align: right"><a
						class="nav-link" href="#">로그인</a></li>
					<li class="nav-item" style="text-align: right"><a
						class="nav-link" href="#">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div style="width: 1000px; height: 1000px;" >
	<main role="main" class="container">
		<form action="bbswriteAF.do" method="get" enctype="multipart/form-data">
		 <input type="hidden" name="writer" value="<%=login.getUser_id() %>">
				<div class="mb-3">

					<label for="title">썸네일</label>

					<input type="file" class="form-control" name="thumbnail" id="thumbnail" placeholder="제목을 입력해 주세요">

				</div>
				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">

				</div>
				<div class="mb-3">

					<label for="title">카테고리</label>

					<input type="text" class="form-control" name="category" id="category" placeholder="카테고리를 입력해 주세요">

				</div>

				

				<div class="mb-3">

					<label for="reg_id">조리시간</label>

					<input type="text" class="form-control" name="cookingtime" id="cookingtime" placeholder="조리시간을 입력해 주세요">

				</div>
				
				<div class="mb-3">

					<label for="reg_id">인분</label>

					<input type="text" class="form-control" name="serving" id="serving" placeholder="몇인분 인지 입력해 주세요">

				</div>

				

				<div class="mb-3">

					<label for="content">레시피 재료</label>

					<textarea class="form-control" rows="5" name="ingredients" id="ingredients" placeholder="레시피 재료를 입력해 주세요" ></textarea>

				</div>

				

				<div class="mb-3">

					<label for="tag">TAG</label>

					<input type="text" class="form-control" name="tag" id="tag" placeholder="태그를 입력해 주세요">

				</div>
			<div class="pt-1">
				 <textarea id="summernote" name="content" rows="18"></textarea>
				

			</div>
			

			
			<script type="text/javascript">
			$(document).ready(function() {
				//여기 아래 부분
				$('#summernote').summernote({
					  height: 400,                 // 에디터 높이
					  minHeight: null,             // 최소 높이
					  maxHeight: null,             // 최대 높이
					  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
					  lang: "ko-KR",					// 한글 설정
					  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
					 
					  onImageUpload : function(files, editor, welEditable){
									  sendFile(files[0],editor, welEditable);
					   				  }
				});
			});
			function sendFile(file, editor, welEditable){
				var data = new FormData();
				data.append("file", file);
				console.log(file);
				$.ajax({
					data : data,
					type : "POST",
					url : "SummerNoteImageFile.do",
					contentType : false,
					processData : false,
					success : function(data){
						console.log(data);
						console.log(editor);
						$(editor).summernote("insertImage",data.url);
					},
					error(e){
						console.log(e);
					}
				});
			}


		
		     
			
			</script>

			<div class="pt-1 text-right">
				<button class="btn btn btn-success" type="submit"
					style="width: 10%; padding: 5px;">작성완료</button>

			</div>
		</form>

	</main>
	</div>
	
	<div class="b-example-divider "></div>
	<div class="container-fluid ">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      
    </ul>
    <p class="text-center text-muted">© 2023 Company, Inc</p>
  </footer>
</div>
</body>
</html>