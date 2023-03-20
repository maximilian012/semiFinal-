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
<style type="text/css">
body {
	margin: 0;
	font-family: 'Noto Sans KR', sans-serif;
}

a {
	text-decoration: none;
}

img {
	width: 100% !important;
}

header {
	width: auto;
	height: 110px;
	background-color: #ff0000;
	/*#ffd26f #ffe64f #fff9ee */
}

header #headerNav {
	width: 1200px;
	margin: 0 auto;
	background-color: #fff9ee;
	height: 110px;
	position: relative;
}

header img {
	float: left;
}

header ul {
	list-style: none;
	float: left;
	margin: 0 auto;
	/* height: 110px; */
	text-align: center;
}

header .member {
	float: right;
}

header ul li {
	float: left;
	font-weight: 700;
	font-size: 20px;
	/* height: 30px; */
	vertical-align: middle;
	margin-top: 40px;
	width: 120px;
}

#headerNav ul li ul {
	width: 1200px;
	background-color: royalblue;
	position: absolute;
	left: 0;
	top: 110px;
	padding: 0;
	z-index: 10;
}

header .categoryHide {
	display: none;
}

header a {
	cursor: pointer;
}

.nav-link {
	font-size: 22px;
}

#main-image {
	width: 100%;
	height: 700px;
	overflow: hidden;
	position: relative;
	margin: 0 auto;
}

#main-image ul {
	list-style: none;
	width: 625%;
	position: absolute;;
	top: 0;
	left: 0;
	margin: 0;
	padding: 0;
	height: 700px;
}

.image_box li {
	float: left;
	display: inline-block;
	width: 16%;
}

main {
	/* 	width: 1200px; */
	margin: 0 auto;
}

#recipe-post {
	margin: 0 auto;
}
.card p img {
	max-width: 100% !important;
	height: 370px !important;
}

@media screen and (min-width:1024px) {
	.g-3 {
		width: 1300px;
		margin: 0 auto;
	}
	.input-group {
		width: 1256px;
		margin: 50px auto;
	}
}

.carousel-control-prev-icon:after {
	content: "";
}

.carousel-control-next-icon:after {
	content: "";
}

.carousel-indicators [data-mdb-target] {
	width: 30px;
	height: 10px;
	background-color: #fff9ee;
}

.row-cols-3>* {
	margin-top: 50px;
}

.carousel-caption {
	right: 64%;
	bottom: 14.25rem;
	font-size: 45px;
	width: 30%;
	left: 10%;
	font-weight: 700;
}

.carousel-item h5 {
	font-size: 2.25rem;
}

@media screen and (min-width:1024px) {
	.center-image {
		width: 100%;
		background-color: rgb(244, 238, 231);
		margin: 50px 0;
	}
	.center-style {
		width: 1400px;
		margin: 0 auto;
	}
	.tag-style {
		text-align: center;
		font-size: 24px;
		border: 2px solid orange;
		border-radius: 31px;
		padding: 5px 0;
	}
	.tag-style a {
		width: 100%;
		display: inherit;
	}
	.small-img {
		height: 400px;
		background-color: #fff9ee;
	}
	.small-img p img {
		height: 200px !important;
	}
	.small-img p {
		margin-top: 20px;
	}
}

.small-img:hover {
	color: red;
	cursor: pointer;
}

.arrow-img {
	width: 100px;
	height: 100px;
}

.tag-style a:hover {
	text-decoration: underline;
}

.card-ceter-title {
	text-align: center;
	margin-top: 30px;
}

.card-bottom-title {
	text-align: center;
}

.carousel-item {
	transition-duration: .9s;
}

.my-change {
	transition: transform 0.2s ease-in-out;
	transition-duration: 1s;
}

@media screen and (max-width:1023px) {
	.small-img p img {
		height: 160px !important;
		background-color: orange;
	}
}

.cursor-change{
	cursor: pointer;
}
</style>
	
</head>

<%
	MemberDto login = (MemberDto)session.getAttribute("login");		
%> 
<body>
	
	<!-- login 전일 때 나오는 Navbar -->
	<%
	if (login == null) {
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!-- Container wrapper -->
		<div class="container-fluid" style="height: 100px; font-weight: 700;">
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- Navbar brand -->
				<a class="navbar-brand mt-2 mt-lg-0" href="#"> <img
					src="resources/images/logo.png" height="100" alt="Logo"
					loading="lazy" />
				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" href="bbslist.do">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="login.do">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="regi.do">회원가입</a></li>
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->

			<!-- Right elements -->						
		<!-- Right elements -->
		</div>
		<!-- Container wrapper -->
	</nav>
	<%
	}
	%>
	<!-- Navbar -->
	
	<%
	if (login != null) {
	%>
	<!-- login 하면 나오는 Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<!-- Container wrapper -->
		<div class="container-fluid" style="height: 100px; font-weight: 700;">
			<!-- Toggle button -->
			<button class="navbar-toggler" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<i class="fas fa-bars"></i>
			</button>

			<!-- Collapsible wrapper -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<!-- Navbar brand -->
				<a class="navbar-brand mt-2 mt-lg-0" href="#"> <img
					src="resources/images/logo.png" height="100" alt="Logo"
					loading="lazy" />
				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="#">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" href="bbslist.do">게시판</a></li>
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->

			<!-- Right elements -->
			<div clas="dropdown">
				<p style="margin: 0 15px 0 0"><%=login.getUserId()%>
					님 반갑습니다!
				</p>
			</div>
			<div class="dropdown">
				<a class="dropdown-toggle d-flex align-items-center hidden-arrow"
					href="#" id="navbarDropdownMenuAvatar" role="button"
					data-mdb-toggle="dropdown" aria-expanded="false"> <img
					src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp"
					class="rounded-circle" height="25"
					alt="Black and White Portrait of a Man" loading="lazy" />
				</a>

				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdownMenuAvatar">
					<li><a class="dropdown-item" href="#">My profile</a></li>
					<li><a class="dropdown-item" href="#">Settings</a></li>
					<li><a class="dropdown-item" href="#">Logout</a></li>
				</ul>
			</div>
		<%
		}
		%>
		<!-- Right elements -->
		</div>
		<!-- Container wrapper -->
	</nav>
	<!-- Navbar -->
	<div style="margin: 0 auto;">
	<main role="main" class="container">
		<form action="bbswriteAFs.do" method="post" enctype="multipart/form-data" id="writeForm"  name="writeForm">
	<!-- 	<form action="#" method="get" enctype="multipart/form-data" id="writeForm"  name="writeForm" > --> 	
		 <input type="hidden" name="writer" value="<%=login.getUserId() %>">
		 <input type="hidden" name="auth" value="<%=login.getAuth()%>">
				<div class="mb-3">

					<label for="title">썸네일</label>
					  <textarea class="summernote" name="thumbnail" rows="18"></textarea>
						
				</div>
				<div class="mb-3">

					<label for="title">제목</label>

					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">

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
			<div class="mb-3">
			<label for="tag">내용</label>
				 <textarea class="summernote" name="content" rows="18"></textarea>
				

			</div>

			<div class="pt-1 text-right">
				<button class="btn btn btn-success" type="button" onclick="history.back()" 
					style="width: 10%; padding: 5px;">목록보기</button>
				<button class="btn btn btn-success" type="reset"
					style="width: 10%; padding: 5px;">다시쓰기</button>
				<button class="btn btn btn-success" type="submit"
					style="width: 10%; padding: 5px;" >작성완료</button>
			</div>
		</form>

	
	</main>
	</div>


	
	<div class="b-example-divider "></div>
	<div class="container-fluid ">
<!--    <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      
    </ul>
    <p class="text-center text-muted">© 2023 Company, Inc</p>
  </footer>  -->
</div>


			
		<script>
		$('.summernote').summernote({
			height : 200,
			lang : "ko-KR"
		});
		
		function clickCheck(target) {
		    document.querySelectorAll(`input[type=checkbox]`)
		        .forEach(el => el.checked = false);

		    target.checked = true;
		}
		
		function valid(){
			let writeForm = document.getElementById("writeForm");
			const title = writeForm.title;

			if (title.value == "") {
				alert("제목을 입력하세요");
				title.focus();
				return false;
			}
		/* 	const content = writeForm.content;
			if (content.value == "") {
				alert("컨텐츠를 입력하세요");
				content.focus();
				return false;
			} */
			const ingredients = writeForm.ingredients;
			if (ingredients.value == "") {
				alert("재료를 입력하세요");
				ingredients.focus();
				return false;
			}
			const cookingtime = writeForm.cookingtime;
			if (cookingtime.value == "") {
				alert("조리시간을 입력하세요");
				cookingtime.focus();
				return false;
			}
			const serving = writeForm.serving;
			if (serving.value == "") {
				alert("몇인분 인지 입력하세요");
				serving.focus();
				return false;
			}
			/* const category = writeForm.category;
			if (category.value == "") {
				alert("카테고리를 선택하세요");
				category.areacode.focus(); 
				return false;
			} */
			flag = false;
			const category = writeForm.category;
			console.log(category);
			for(i=0; i < category.length; i++){
				if(category[i].checked){			// 이 부분과
					//str += category[i].value + "\n";  	// 이 부분도 매우 중요한 부분
					flag = true;
				}
			}
						
			if(flag == false){
				alert("카테고리를 선택하세요");
				return false;
			}
			
			const content = writeForm.content;
			if (content.value == "") {
				alert("컨텐츠를 입력하세요");
				content.focus();
				return false;
			}

			
			return flag;
			
		}
		
		</script>
</body>
</html>