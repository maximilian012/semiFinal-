<%@page import="mul.cam.food.dto.BbsDto"%>
<%@page import="mul.cam.food.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <link rel="stylesheet" type="text/css" href="./css/bbslist.css" >
  <script type="text/javascript" src="./jquery/jquery.twbsPagination.min.js"></script>

<style type="text/css">

.writeButton {
    float: right;
    margin-top: 1rem;
    margin-right: 3rem;
}

.bbsname{
    padding-left: 5rem;
}

.category-image {
 width: 52% !important;
    margin-left: 2.5rem;
} 

.category-text {
	
    font-size: large
}


</style>

</head>
<%
	MemberDto login = (MemberDto)session.getAttribute("login");
	List<BbsDto> list = (List<BbsDto>)request.getAttribute("bbslist");
	String uploadFilePath = (String)request.getAttribute("uploadFilePath");
	int pageBbs = (Integer)request.getAttribute("pageBbs");
	int pageNumber = (Integer)request.getAttribute("pageNumber");
	String boardName = (String)request.getAttribute("boardName");
	int category = (Integer)request.getAttribute("category");
	System.out.println(pageNumber);
	System.out.println(pageBbs);
%> 


<body>
       
	<%

	if (login == null ) {
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="background-color: #FFF6BD !important">
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
				<a class="navbar-brand mt-2 mt-lg-0" href="mainhome.do"> 
				<img
					src="resources/images/logo.png" height="100" alt="Logo"
					loading="lazy" />
				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item" data-toggle="dropdown">
						<div class="dropdown">
							<a class="nav-link dropdown-toggle" href=" #" role="button"
								data-mdb-toggle="dropdown" aria-expanded="false">카테고리 </a>

							<ul class="dropdown-menu dropdown-menu-end drop-StyleChange"
								aria-labelledby="navbarDropdownMenuAvatar">
								<li><a class="dropdown-item" href="#">종류</a></li>
								<li><a class="dropdown-item" href="#">재료</a></li>
								<li><a class="dropdown-item" href="#">방법</a></li>
								<li><a class="dropdown-item" href="#">테마</a></li>
								<li><a class="dropdown-item" href="#">기념일</a></li>
								<li><a class="dropdown-item" href="#">게시판 바로가기</a></li>
							</ul>
						</div>
					</li>
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
	if (login != null ) {
	%>
	<!-- login 하면 나오는 Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="background-color: #FFF6BD !important">
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
				<a class="navbar-brand mt-2 mt-lg-0" href="mainhome.do"> <img
					src="resources/images/logo.png" height="100" alt="Logo"
					loading="lazy" />
				</a>
				<!-- Left links -->
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item" data-toggle="dropdown">
						<div class="dropdown">
							<a class="nav-link dropdown-toggle" href=" #" role="button"
								data-mdb-toggle="dropdown" aria-expanded="false">카테고리 </a>

							<ul class="dropdown-menu dropdown-menu-end drop-StyleChange"
								aria-labelledby="navbarDropdownMenuAvatar">
								<li><a class="dropdown-item" href="#">종류</a></li>
								<li><a class="dropdown-item" href="#">재료</a></li>
								<li><a class="dropdown-item" href="#">방법</a></li>
								<li><a class="dropdown-item" href="#">테마</a></li>
								<li><a class="dropdown-item" href="#">기념일</a></li>
								<li><a class="dropdown-item" href="#">게시판 바로가기</a></li>
							</ul>
						</div>
					</li>
					<li class="nav-item"><a class="nav-link" href="bbslist.do">게시판</a></li>
				</ul>
				<!-- Left links -->
			</div>
			<!-- Collapsible wrapper -->

			<!-- Right elements -->
			<div class="dropdown">
				<p id="demo"></p>
				<p style="margin: 0 15px 0 0; height: 38px;"><%=login.getUserId()%>
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
				 	<%
					if(login.getAuth().equals("1")){
					%>
					<li><a class="dropdown-item" href="adminList.do">회원관리</a></li>
					<%	
					}
					%> 
					<li><a class="dropdown-item" href="setting.do?login=" + <%=login %> >Settings</a></li>
					<li><a class="dropdown-item" onclick="navLogout()">Logout</a></li>
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
    <div class="container main">
	   	<div class="category_tag_div">
	   	    <div class="category_tag text-center">			
			#따뜻한
			</div>
			<div class="category_tag text-center">
			#든든한
			</div>
			<div class="category_tag text-center">
			#맛있는
			</div>
	   	</div>

      <form class="d-flex" action="search.do" method="post" onsubmit="return searchValid()">
      	<select class="custom-select" id="choice" name="choice">
					<option selected value="option">검색</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
		</select>
        <input id="search" name="search" class="form-control me-2 bbs-search-form" type="search" placeholder="따뜻한 한끼를 검색해 보세요" aria-label="Search">
        <button class="btn btn-outline-success" type="submit" >검색</button>
      </form>
      
      <div class="category category-main">
      	<table>
      		<tr>
      			<td>
      				<a href="categorysearch.do?category=3&pageNumber=0">
      					<figure class="snip1384">
						  <img class="category-image" alt="" src="./images/sushi.png">
						  <figcaption>
						    <h3 style="margin-left: 39px">일식</h3>
						  </figcaption>

						</figure>
      				</a>
		      		

      			</td>
      			 <td>
	      			 <a href="categorysearch.do?category=1&pageNumber=0">
	      			 		 <figure class="snip1384">
							  <img class="category-image" alt="" src="./images/steak.png">
							  <figcaption>
							    <h3 style="margin-left: 39px">양식</h3>
							  </figcaption>
							</figure>
	      			 
	      			 </a>
	      		 	
      			</td>
      			
      			 <td>
      			 	<a href="categorysearch.do?category=5&pageNumber=0">
      			 		<figure class="snip1384">
						  <img class="category-image" alt="" src="./images/bibimbap.png">
						  <figcaption>
						    <h3 style="margin-left: 37px">한식</h3>
						  </figcaption>
						</figure>
      			 	</a>
      		
      			</td>    		
      			
      			 <td>
      			 	<a href="categorysearch.do?category=2&pageNumber=0">
      			 	    <figure class="snip1384">
						  <img class="category-image" alt="" src="./images/bao.png">
						  <figcaption>
						    <h3 style="margin-left: 39px">중식</h3>
						  </figcaption>
						</figure>
      			 	</a>
  
      			</td>
      			<td>
      				<a href="categorysearch.do?category=4&pageNumber=0">
      				    <figure class="snip1384">
						  <img class="category-image" alt="" src="./images/tteokbokki.png">
						  <figcaption>
						    <h3 style="margin-left: 36px">분식</h3>
						  </figcaption>
		
						</figure>
      				</a>

      			</td>         			
      			 <td>
      			 	<a href="categorysearch.do?category=6&pageNumber=0">
      			 	    <figure class="snip1384">
						  <img class="category-image" alt="" src="./images/cake.png">
						  <figcaption>
						    <h3 style="margin-left: 26px">디저트</h3>
						  </figcaption>
						</figure>
      			 	
      			 	</a>

      			</td>      				
      		</tr>
      		
      	
      	</table>

    
      </div>

      <div class="bbs-main">
      <!-- 게시판 소개글 -->
		<a class="writeButton" href="bbswrite.do">글쓰기</a>
      <h2 class="bbsname text-center" id="bbsname">
      	<%= boardName %>
      </h2>
      <input hidden name="category" id="category" value="<%=category %>"/>
      	
      <!-- 게시판 메인 -->
      	<table class="bbs-table" id="bbs-table">
		      	
		<%
		if(list == null || list.size() == 0){
		%>
		<tbody>
			<tr>
				<td colspan="4">작성된 글이 없습니다</td>
			</tr>
		</tbody>

	    <%
		}else{
		%>
		
		<tbody>
      			<tr>
		<%
		
			for(int i = 0;i < list.size(); i++)
			{
				BbsDto dto = list.get(i);
				if(dto.getDelf().equals("1")){
					%>
					<td class="card bbs-recipt ">
						<div class="overflowHidden bbs-thumbnali">
							 <img alt="" src="./images/x.png"> 
						</div>	
						<div class="card-body">					
								<p id="recipt-title">@@@@@@@@@</p>
								<div class="hash-tag" id="recipt-hashtag">
								 <span>관리자에 의해 삭제되었습니다</span>
								</div>
						</div>					
					</td>
					
					<%					
					}else {
						%>

			<td class="card bbs-recipt " onclick="location.href = 'bbsdetail.do?seq=<%=dto.getSeq() %>'">
				<div class="overflowHidden bbs-thumbnali">
					<%=dto.getThumbnail()%>
				</div>	
				<div class="card-body">					
						<p id="recipt-title"><%=dto.getTitle() %></p>
						<div class="hash-tag" id="recipt-hashtag">
						 <span><%=dto.getTag() %></span>
						</div>
						<input hidden id="seq" name="seq" value="<%=dto.getSeq() %>"/>	
				</div>					
			</td>
						<%
			}
		%>
			
		<%
			}
		}
		%>
		</tr>
		</tbody>
  
      	</table>  
      	
      	 <div class="container page-bar">
			<nav aria-label="Page navigation">
			    <ul class="pagination" id="pagination" style="justify-content:center"></ul>
			</nav>
		 </div>	
  	   </div>
 
      
	</div>


	<!-- Footer -->
	<footer class="bg-dark text-center text-white"
		style="margin-top: 50px;">
		<!-- Grid container -->
		<div class="container p-4">
			<!-- Section: Social media -->
			<section class="mb-4">
				<!-- Facebook -->
				<a class="btn btn-outline-light m-1" href="#!" role="button"><i
					class="fab fa-facebook-f">FaceBook </i></a>

				<!-- Twitter -->
				<a class="btn btn-outline-light  m-1" href="#!" role="button"><i
					class="fab fa-twitter">Youtube</i></a>

				<!-- Google -->
				<a class="btn btn-outline-light m-1" href="#!" role="button"><i
					class="fab fa-google">Instagram</i></a>
			</section>
			<!-- Section: Social media -->

			<!-- Section: Text -->
			<section class="mb-4">
				<p>3조 프로젝트 HOME BOB</p>
			</section>
			<!-- Section: Text -->
		</div>
		<!-- Grid container -->

		<!-- Copyright -->
		<div class="text-center p-3"
			style="background-color: rgba(0, 0, 0, 0.2);">
			Copyright2023.Multicampus_3조</div>
		<!-- Copyright -->
	</footer>

<script>

$(document).ready(
		$('#pagination').twbsPagination({
			startPage: <%=pageNumber+1 %>,
		    totalPages: <%=pageBbs%>,
		    visiblePages: 10,
		    first: '<span srid-hidden="true">«</span>', 
		    prev:"이전",
		    next:"다음",
		    last: '<span srid-hidden="true">»</span>',
		    initiateStartPageClick: false,
		    onPageClick: function (event, page) {
		    	let choice = document.getElementById('choice').value;
		    	let search = document.getElementById('search').value;
		    	let category = document.getElementById('category').value;
		    	if(category === "0") {
		    		location.href = "bbslist.do?choice=" + choice + "&search=" + search + "&pageNumber=" + (page-1);		    		
		    	} else {
		    		location.href = "categorysearch.do?category=" + category + "&pageNumber=" + (page-1);
		    	}
		    }
		})
)


function searchValid() {
	let choice = document.getElementById('choice').value;
	let search = document.getElementById('search').value;
	if(choice === "option") {
		alert("검색옵션을 선택해주세요");
		return false;
	}else if(search === ""){
		alert("검색내용을 입력해주세요");
		return false;
	}else {
		return true;
	}
	
}

function bbsdetail() {
	let seq = document.getElementById('seq').value;

	location.href = "bbsdetail.do?seq="+seq;
}

$(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);

</script>


</body>
</html>



