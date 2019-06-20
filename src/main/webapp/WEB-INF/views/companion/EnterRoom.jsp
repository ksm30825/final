<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "resources/css/companion/enterRoom.css">

</head>
<body>
	<jsp:include page = "../companion/CompanionMenu.jsp"/>
	<div id = "container">
	    <div id="home" >
	    	<div id = "listWrap" style = "padding-left : 20px;">
	 		<br>
	     	<table class = "MyChatList">
	     		<tr>
	     			<td colspan = "2" class = "chName"><label>채팅방 제목</label></td>
	     			<td id = "status"><label>여행준비중</label></td>
	     		</tr>
	     		<tr style = "border-bottom : 1px solid lightgray;">
	     			<td colspan = "3">
	     				<i class="material-icons" id = "peopleIcon">group</i>
	     				&nbsp;&nbsp;&nbsp;<label>(6/6)</label>
	     			</td>
	     		</tr>
	     	</table>
	     	</div>
	     	
	    </div>
	  </div>
	  <div id="footer" >
	     	<div class = "footerMenu">
	     		<i class="material-icons" style = "margin-left: 15px;">hourglass_empty</i>
	     		<label>진행중</label>
	     	</div>
	     	<div class = "footerMenu" >
	     		<i class="material-icons" style = "margin-left: 15px;">done_outline</i>
	     		<label>여행종료</label>
	     	</div>
	  </div>
</body>
</html>