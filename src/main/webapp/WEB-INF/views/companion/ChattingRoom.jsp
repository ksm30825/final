<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "resources/css/companion/chattingRoom.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	
    
</style>
<body>
	<c:set var = "contextPath" value = "${pageContext.servletContext.contextPath }" scope = "application"/>
	
	<div class="w3-sidebar w3-bar-block w3-card w3-animate-right" style="display:none;right:0;width : 80%;" id="rightMenu">
	  <button onclick="closeRightMenu()" class="w3-bar-item w3-button w3-large" style = "width: 20%;float:left;"><i class="material-icons" style = "color : black;">close</i></button>
	  <div style = "width : 80%; float:left;">
	  	<h4 style = "">채팅방 정보</h4>
	  </div>
	</div>
	
	<div class="w3-teal">
	  <button id = "returnBtn" onclick = "location.href = '${contextPath}/enterRoom.ch'"><i class="material-icons" >keyboard_arrow_left</i></button>
	  <button class="w3-button w3-teal w3-xlarge w3-right" id = "menubtn" onclick="openRightMenu()">&#9776;</button>
	  <div class="w3-container" id = "header">
	   	 <h1 align = "center">My Page</h1>
	  </div>
	</div>
	
	<div class="w3-container" id = "content">
		
	</div>
	
	<div id="footer" >
		<textarea rows="3" cols="30" name = "message" id = "message"></textarea>
		<button type="button" class="btn btn-primary" id = "sendbtn">전송</button>
	     	
	 </div>
	     
	<script>
		function openRightMenu() {
		  document.getElementById("rightMenu").style.display = "block";
		}
		
		function closeRightMenu() {
		  document.getElementById("rightMenu").style.display = "none";
		}
		
	</script>
</body>
</html>