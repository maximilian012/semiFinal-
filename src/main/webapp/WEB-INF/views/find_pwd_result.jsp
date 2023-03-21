<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME BOB : 로그인 창</title>

<%-- jQuery --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&family=Sunflower:wght@300&display=swap');

body {
  background: #FFF9EE;
}

.box {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: #FFBB0A;
  width: 320px;
  height: 500px;
  border-radius: 5px;
  box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
  text-align: center;
}

h1 {
  font-family: "Open Sans", sans-serif;
  text-shadow: 2px 0 10px #ce7d88;
  margin-top: 40px;
  text-transform: uppercase;
  color: white;
  font-size: 2em;
  letter-spacing: 8px;
}

h3{
font-family: 'Noto Sans KR', sans-serif;
 margin-top:100px;
 text-shadow: 2px 0 10px #ce7d88;
 font-size: 2em;
}

button {
  font-family: "Open Sans", sans-serif;
  text-transform: uppercase;
  letter-spacing: 3px;
  font-size: 7px;
  font-weight: bold;
  border-radius: 8px;
  margin: auto;
  outline: none;
  display: block;
}

button:hover {
  background: #ffffff !important;
  color: #000000 !important;
  transition: background-color 0.5s ease-out;
}

.button {
  width: 70%;
  padding: 12px;
  margin-top: 70px;
  background: white;
  color: #ce7d88;
  border: solid 1px #FFBB0A;
}
</style>

</head>
<body>

<div class="box">
	<h1>password check</h1>
	<h3 id="id">${pwd}</h3>
	<button type="button" id="go_login" class="button">로그인으로 이동</button>
</div>

<script type="text/javascript">
$(function(){
	$("#go_login").click(function(){
		location.href="login.do";
	});
});
</script>

</body>
</html>