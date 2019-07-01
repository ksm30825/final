<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "resources/css/companion/enterRoom.css">
<style>
	body {overflow-y: hidden; overflow-x: hidden;}
</style>
</head>
<body>
	<jsp:include page = "../companion/CompanionMenu.jsp"/>
	<div id = "container">
	    <div id="home" >
	    	<div id = "listWrap" style = "padding-left: 5%;padding-right: 5%;height : 700px; overflow-y: auto;">
	 		<br>
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
	  
	  <script src="http://localhost:8010/socket.io/socket.io.js"></script>
      <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
	  <script>
	     $(document).ready(function() {
	    		var user = ${ loginUser.memberId };
	    	 	
	    		console.log("user :"+user);
	    		
	        	//서버
				var socket = io("http://localhost:8010");
	        	
	        	if (user != null){
	        		socket.emit('mychatting', {user : user});
		        	
					 socket.on('mychatting' , function(data){
						 	 var output = '';
			                 output += '<table class = "MyChatList" style = "width: 100%;">';
			                 output += '<tr>';
				     		 output += '<td colspan = "4" class = "chName">';
				     		 output += '<input type = "hidden" id = "chatNum" name = "chatRoomNum" value = "'+ data.chatnum +'">';
				     		 output += '<input type = "hidden" id = "chatRoomDetail" name = "chatRoomDetail" value = "'+ data.detail +'">';
				     		 output += '<label>'+ data.title +'</label></td>'
				     		 output += '<td><label>&nbsp;&nbsp;'+ data.status +'</label></td>';
			     			 output += '</tr>';
				     		 output += '<tr style=  "border-bottom : 1px solid lightgray;">';
				     		 output += '<td colspan = "5">';
				     		 output += '<i class="material-icons" id = "peopleIcon">group</i>';
				     		 output +=	'&nbsp;&nbsp;&nbsp;<label>('+ data.activityNum + '/' + data.peoplenum +')</label>';
				     		 output +=	'</td></tr>'
			                 output += '</table>';
			                 $(output).prependTo('#listWrap');
			                 
			                 console.log(data.title);
	        		 });
	        	}
				
				
	        	
	     });
	 
	  </script>
</body>
</html>