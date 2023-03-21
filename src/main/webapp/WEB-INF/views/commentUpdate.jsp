<%@page import="mul.cam.food.dto.BbsComment"%>
<%@page import="mul.cam.food.dao.MemberDao"%>
<%@page import="mul.cam.food.dto.MemberDto"%>
<%@page import="mul.cam.food.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%
 	MemberDto login = (MemberDto)session.getAttribute("login");
	BbsDto dto = (BbsDto)request.getAttribute("bbsdto");
	BbsComment bbs = (BbsComment)request.getAttribute("comment");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세글 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/bbsdetail.css" >
<link rel="stylesheet" href="./images/favicon.ico">
<style type="text/css">
	#writer {
		border:none;
		border-bottom:2px solid #ddd;
		margin-bottom:10px;
	}
	textarea {
		border:1px solid #ddd;
	} 
	p {
	margin-top:10px;
	}
	
	button {
	border:none;
	background:#FFF6BD;
	color:#333;
	width:100px;
	height:37px;
	}
	#abtn{
	border: none;
    background: #FFF6BD;
    color: #333;
    width: 100px;
    height: 37px;
	}
	
</style>
</head>
<body>

<!-- 상단 내비게이션 -->
        <nav role="navigation" style="background: #FFF6BD;">
            <img src="./images/logo.png" id="logo-img" width="150px" height="90px">
            <ul id="main-menu nav-pills">
                <li class="left-tab slide"><a href="#" style="margin-left:27px;">카테고리</a>
                    <ul id="sub-menu">
                        <li><a href="#" aria-label="submenu">한식</a></li>
                        <li><a href="#" aria-label="submenu">중식</a></li>
                        <li><a href="#" aria-label="submenu">일식</a></li>
                        <li><a href="#" aria-label="submenu">양식</a></li>
                    </ul>
                </li>
                <li class="left-tab"><a href="bbslist.do" style="margin-left:27px;">게시판</a></li>
                <li class="right-tab"><a href="regi.do">회원가입</a></li>
                <li class="right-tab"><a href="login.do">로그인</a></li>
            </ul>
        </nav>
        
     <main class="container" style="text-align:center;">
       
	      <article class="blog-post">
	        <h2 class="blog-post-title mb-1">댓글 수정하기</h2>
	        <form action="commentWrite.do" method="post">
	        	<input type="hidden" name="recipeSeq" id="recipeSeq" value="<%=dto.getSeq() %>"> 
	         		<p>
	         			<label>댓글 작성자</label> <input type="text" name="writer" value="<%=login.getUserId() %>" style="border-bottom: 2px solid rgba(224, 223, 226, 0.6); border:none;" readonly="readonly"> 
	         		</p>
	        		<p>
		        	<textarea rows="8" cols="100" name="content"></textarea>
		        	</p>
		         <p>무분별한 댓글은 삭제조치 될 수 있으니 이점 양해 부탁드립니다.</p>
		         
		         <!-- 0320 버튼 태그 수정 -->
		         <div style="text-align:center; width:742px; margin-top:20px;">
		        	<button type="submit" id="submitBtn">수정하기</button>
		        	<button type="button" onclick="location.href='bbslist.do'">목록으로</button>
	        	</div>
	        </form>
	      </article>	
	</main>
        
        <!-- 하단 푸터 -->
        <footer>
            <p> Copyright © 2023. MultiCampus. </p>
        </footer>



<script type="text/javascript">
<%-- 
$(document).ready(function(){

	$.ajax({
		url:"commentList.do",
		type:"get",
		data:{ "seq":<%=dto.getSeq() %> },
		success:function(list){
			$("#tbody").html("");
			
			$.each(list, function(index, item){
				let str = "<tr>"
						+ "<td>" + item.recipeSeq + "</td>"
						+	"<td>" + item.writer + "</td>"
						+	"<td>" + item.content + "</td>"
						+ "</tr>";
				$("#tbody").append(str);
			});
		},
		error:function() {
			alert('오류가 발생했습니다');
		}
	});		
});
	 --%>
		
	/* 삭제하기 버튼 */
	$("#deleteBtn").on("click", function(){
	    $("#frm").attr("action", "commentDelete.do");
	    $("#frm").attr("method", "post");
	    $("#frm").submit();
	});
	
</script>
</body>
</html>