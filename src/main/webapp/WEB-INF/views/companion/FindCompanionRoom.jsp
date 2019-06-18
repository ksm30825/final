<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "resources/css/companion/findcompanionRoom.css">
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<style>
	
</style>
</head>
<body>
	 <jsp:include page = "../companion/CompanionMenu.jsp"/>
		
	<div id = "container">	
	 <div id="menu1" style = "padding-left : 20px;">
	     <br>
	     <table class = "AllChatList" >
	     	<tr>
	     		<td colspan = "2" class = "AllChatTitle"><label>채팅방 제목</label></td>
	     			<td><label>&nbsp;&nbsp;모집중</label></td>
	     		</tr>
	     		<tr style=  "border-bottom : 1px solid lightgray;">
	     			<td colspan = "3">
	     				<i class="material-icons" id = "peopleIcon">group</i>
	     				&nbsp;&nbsp;&nbsp;<label>(4/6)</label>
	     			</td>
	     		</tr>
	     	</table>
	   </div>
	  </div>
	  <div id="footer" >
	     <div style = "float:right;">
	     	<i class="fas fa-comment-medical"></i>
	     </div>
	   </div>
	  
</body>
</html>