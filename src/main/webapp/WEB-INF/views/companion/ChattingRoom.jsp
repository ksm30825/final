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
	#chatpeopleTable {
		width : 100%;
	}

	#chatpeopleTable:hover{
		background : lightgray;
		cursor : pointer;
		width : 100%;
	}
	
	.label-danger {
		margin:5%; float:right;padding: .5em .6em .5em;
	}
</style>
<body>
	<c:set var = "contextPath" value = "${pageContext.servletContext.contextPath }" scope = "application"/>
	
	<div class="w3-sidebar w3-bar-block w3-card w3-animate-right" style="display:none;right:0;width:80%;" id="rightMenu">
	  <div style = "height : 7%; width : 100%; background: #6196ed;">
	  	<button onclick="closeRightMenu()" 
	  			class="w3-bar-item w3-button w3-large" 
	  		 	data-toggle="tooltip" data-placement="right" title="메뉴닫기"
	  			style = "width: 15%;float:left;height: 100%;">
			<i class="material-icons" 
			style = "color : black; font-size : 20px;">close</i>
	  	</button>
		 <label style = "font-size :15px; padding : 15px; margin-left : 15%; margin-top:1%;">채팅방 정보</label>
		 <span id = "Recruitingicon" class="label label-danger">모집중</span>
	  </div>
	  <div style = "height : 30%; width : 100%; overflow-y: auto; ">
	  	<table id = "Chattinginfor">
	  		<tr>
	  			<td><b>여행지</b></td>
	  			<td>파리</td>
	  		</tr>
	  		<tr>
	  			<td><b>여행 날짜 </b></td>
	  			<td>2019/06/23 ~ 2019/07/31</td>
	  		</tr>
	  		<tr>
	  			<td colspan = "2"><p>이것이야말로 사랑의 두손을 대한 만천하의 꾸며 청춘 그들의 뿐이다. 얼마나 이것은 곳이 끓는다. 산야에 구하지 할지니, 새가 지혜는 동력은 원질이 심장은 뼈 듣는다. 황금시대를 행복스럽고 피어나기 살 이상을 황금시대다. 그와 만천하의 구하지 실현에 생명을 뿐이다. 바로 스며들어 가는 무엇을 있다. 있으며, 용감하고 이상의 것이다. 이상은 것은 속에서 듣는다. 황금시대의 이상의 아니한 품에 때문이다.</p></td>
	  		</tr>
	  	</table>
	  </div>
	  <div style = "height : 7%; width : 100%; background : #a8c9ff">
	  	 <label style = "margin: 20px;">대화상대</label>
	  </div>
	  <div style = "height : 50%; width : 100%; overflow-y : auto;">
	  		<table id = "chatpeopleTable" style = "border-bottom : 1px solid lightgray;">
				<tr>
					<td colspan = "2">
					<input type = "hidden" value = "wldnjs7781" name = "userId" id = "userId">
					<input type = "hidden" value = "지원" name = "username" id = "username">
					<label>문지원(wldnjs7781)</label></td>					
				</tr>
				<tr>
					<td>
						<i id = "goodicon" class="material-icons">thumb_up_alt</i>
						<p id = "good">10</p>
					</td>
					<td>
						<i id = "badicon" class="material-icons">thumb_down_alt</i>
						<p id = "bad">5</p>
					</td>
				</tr>	  		
	  		</table>
	  </div>
	  <div style = "height : 5%;">
	  	<ul class="list-inline" style = "border-top:1px solid lightgray;">
   			 <li> 
   			 <button  data-toggle="tooltip" 
	  	      data-placement="right" title="채팅방 나가기" id = "outbtn">
	  	 		<i class="material-icons" 
	  	 			style = "margin :0 ; padding : 3px; 
	  	 				color: black; font-size : 30px;">input</i>
	  	 	</button></li>
    		<li style = "margin-left : 50%;">
	    		<button id = "setting"  data-toggle="tooltip" 
	  	     		 data-placement="top" title="채팅방 설정" onclick = "location.href = '${contextPath}/showchange.ch'">
	    			<i class="material-icons"
	    			style = "margin:0; padding: 0; color : gray; font-size : 30px;">
	    			settings</i>
	    		</button>
	    		<button id = "Declaration"  data-toggle="tooltip" 
	  	     		 data-placement="top" title="신고하기" onclick = "location.href='${contextPath}/declaration.ch'">
    				<i class="material-icons"
    				style = "margin:0; padding: 0; color : #f75454; font-size : 30px;">
							notifications_active
					</i>
    			</button>
    		</li>
  		</ul>
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
		
		$(function(){
			$('[data-toggle="tooltip"]').tooltip();   
			
			$("#Recruitingicon").click(function(){
				
				if(confirm("모집을 종료하시겠습니까?")) {
			         var status =   $(this).parent().click();
			     } else {
			            return false;
			     }

				
				console.log(status);
			});
			
			
		});
		
		$(document).on("click","#chatpeopleTable tr",function(){
 	 		var userid = $(this).parent().children().children().children("#userId").val();
 	 		var user = $(this).parent().children().children().children("#username").val();
 	 		
 	 		console.log("userid :" + userid);
 	 		console.log("user :" + user);
 	 		
 	 		location.href = "${contextPath}/userInfo.ch?userId=" +userid; 
 	 			 
 	 		
 	 	}); 
		
		  
	


			 		
		
	</script>
</body>
</html>