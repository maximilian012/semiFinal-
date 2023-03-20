<%@page import="mul.cam.food.dto.MemberDto"%>
<%@page import="mul.cam.food.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>







<%
String bbswrite = (String) request.getAttribute("bbswrite");
if (bbswrite != null && !bbswrite.equals("")) {
	if (bbswrite.equals("writeOK")) {
%>
<script type="text/javascript">
		alert("글쓰기 성공");
		location.href = "bbslist.do";
		</script>
<%
} else if(bbswrite.equals("writeNO")) {
	%>
<script type="text/javascript">
		alert("글쓰기 실패");
		location.href = "bbswrite.do";
		</script>
<%
}
}
%>


<%
String message = (String)request.getAttribute("message");
if(message != null && !message.equals("")){
	if(message.equals("MEMBER_ADD_YES")){
		%>
		<script type="text/javascript">
		alert("성공적으로 가입되었습니다");
		location.href = "login.do";
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("가입되지 않았습니다 다시 가입해 주십시오");
		location.href = "login.do";
		</script>
		<%		
	}
}
MemberDto dto = (MemberDto)request.getAttribute("mem");
String login = (String)request.getAttribute("login");
if (login != null && !login.equals("")) {
	if (login.equals("LOGIN_OK")) {
%>
<script type="text/javascript">
		alert("환영합니다!!! <%= dto.getName()%>님");
		location.href = "mainhome.do?auth=" + <%= dto.getAuth()%>;
		</script>
<%
} else if(login.equals("LOGIN_FAIL")) {
	%>
<script type="text/javascript">
		alert("로그인 실패");
		location.href = "login.do";
		</script>
<%
} else if(login.equals("Withdrawal member")){
	%>
	<script type="text/javascript">
		alert("탈퇴된 회원입니다.");
		location.href = "login.do";
		</script>
	
	<%
	
}
}
%>

<%
String delete = (String) request.getAttribute("delete");
if (delete != null && !delete.equals("")) {
	if (delete.equals("deleteOK")) {
%>
<script type="text/javascript">
		alert("삭제 성공");
		location.href = "adminList.do";
		</script>
<%
} else if(delete.equals("deleteNO")) {
	%>
<script type="text/javascript">
		alert("삭제 실패");
		location.href = "adminList.do";
		</script>
<%
}
}
%>

