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
	
	#home {
		 width: 100%;
	   	 height:500px;
	     position: absolute;
	     border:1px solid lightgray;
	     overflow: hidden !important;  
	}
	
	#listWrap{
		width: 100%;
	    height:100%;
	    overflow-y:scroll;
	    padding-left: 5%;padding-right: 5%;s
	}
	
	::-webkit-scrollbar { 
    	display: none !important; 	
    }
    
    #listButton{
    	float:right;
    	padding : 10px;
    	margin-right : 10px;
    }
    
    .dropbtn {
	  background-color: #3498DB;
	  color: white;
	  padding: 16px;
	  font-size: 16px;
	  border-radius : 5px;
	}

	.dropup {
	  position: relative;
	  display: inline-block;
	  left: 85%;
	}
	
	.dropup-content {
	  display: none;
	  position: absolute;
	  background-color: #f1f1f1;
	  right: 0;
	  min-width: 160px;
	  bottom: 60px;
	  z-index: 1;
	}
	
	.dropup-content ul li {
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	.dropup-content a:hover {background-color: #ccc}
	
	.dropup:hover .dropup-content {
	  display: block;
	}
	
	.dropup:hover .dropbtn {
	  background-color: #2980B9;
	}
	
	.statusBtn{
		width : 100%;
		background : none;
		border : none;
		text-align : right;
	}
	.dropup-content ul{
		width : 100%;
	}
	
	.dropup-content ul li{
		width : 100%;
	}
	
	.dropup-content ul li:hover{
		color: #2980B9;
	}
</style>
</head>
<body>
	<jsp:include page = "../companion/CompanionMenu.jsp"/>
	<div id = "container">
	    <div id="home" >
	    	 <div id = "listWrap" ></div>
	    </div>
	  </div>
	  <div id="footer" >
	     	<!-- <div class = "footerMenu">
	     		<i class="material-icons" style = "margin-left: 15px;">hourglass_empty</i>
	     		<label>진행중</label>
	     	</div>
	     	<div class = "footerMenu" >
	     		<i class="material-icons" style = "margin-left: 15px;">done_outline</i>
	     		<label>여행종료</label>
	     	</div> -->
	     
	     	<div class="dropup">
			  <button class="dropbtn" id = "ProgressBtn"><i class="material-icons">reorder</i></button>
			  <div class="dropup-content">
			   <ul>
			    <li><button type = "button" class = "statusBtn">모집중</button></li>
			    <li><button type = "button" class = "statusBtn">모집종료</button></li>
			    <li><button type = "button" class = "statusBtn">여행중</button></li>
			    <li><button type = "button" class = "statusBtn">여행종료</button></li>
			    </ul>
			  </div>
			</div>
	  </div>
	  
	  <script src="http://localhost:8010/socket.io/socket.io.js"></script>
      <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
	  <script>
	     $(document).ready(function() {
	    		var user = ${ loginUser.memberId };
	    	 	
	    		//console.log("user :"+user);
	    		
	        	//서버
				var socket = io("http://localhost:8010");
	        	
	        	if (user != null){
	        		socket.emit('mychatting', {user : user});
		        	
					 socket.on('mychatting' , function(data){
						 	 var output = '';
			                 output += '<table id = "MyChatTable" class = "MyChatList" style = "width: 100%;">';
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
			                 $(output).appendTo('#listWrap');
			                 
			                 console.log(data.chatnum);
	        		 });
					 
					 
					 //채팅방 들어가기 하는 함수
			    	  $(document).on("click","#MyChatTable tr",function(){
			    		 var chatList = $(this).parent().children().children();
			 	 	 		//var chatTitle = chatList.children("label").html(); 
			 	 	 	 var chatNum = chatList.children("#chatNum").val();
				 				
			 	 	 	console.log("chatNum :" + chatNum);	
				 		
			 	 	 	location.href = "${contextPath}/enterChatting.ch?num=" + chatNum;
				 		
				 			
			        });
					
			    	//채팅방 다시 불러오기 
			 		socket.on('updateChatName', function(data){
			 		 		var updateChatId = data._id;
			 		 		
			 		  	  $(".MyChatList").each(function(index ,item) {
			        			 var checkUserID = $(this).children().children().children().children("#chatNum").val();
			        			 console.log("updateChatId : " + updateChatId + "- checkUserId :" + checkUserID);
			        			 if (checkUserID == updateChatId){
			        				$(this).remove();
			        				
			        				 var output = '';
					                 output += '<table id = "MyChatTable" class = "MyChatList" style = "width: 100%;">';
					                 output += '<tr>';
						     		 output += '<td colspan = "4" class = "chName">';
						     		 output += '<input type = "hidden" id = "chatNum" name = "chatRoomNum" value = "'+ data._id +'">';
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
					                 $(output).appendTo('#listWrap');
					                 
					                 console.log(data._id);
			        				
			        			 } 
			        	 });
	        		});
			    	
			 		//채팅방 들어가기 
		 			 socket.on('UpdateChattingPeople', function(data){
		 				 console.log("들어간 후 ? 시동되니?" + data._id);
		 				var updateChatId = data._id;
		 		 		
			 		  	  $(".MyChatList").each(function(index ,item) {
			        			 var checkUserID = $(this).children().children().children().children("#chatNum").val();
			        			 console.log("updateChatId : " + updateChatId + "- checkUserId :" + checkUserID);
			        			 if (checkUserID == updateChatId){
			        				$(this).remove();
			        				
			        				console.log(data.activityNum + "활동");
			        				
			        				 var output = '';
					                 output += '<table id = "MyChatTable" class = "MyChatList" style = "width: 100%;">';
					                 output += '<tr>';
						     		 output += '<td colspan = "4" class = "chName">';
						     		 output += '<input type = "hidden" id = "chatNum" name = "chatRoomNum" value = "'+ data._id +'">';
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
					                 $(output).appendTo('#listWrap');
					                 
					                 console.log(data._id);
			        				
			        			 } 
			        	 });	        	
	        		});
			 		
			 		
			 		
		 		 	//채팅상태 변화 했을때 
		 		 	 socket.on('updateChatSatus', function(data){
		        		  var changeChatId = data._id;
		        		  
		        		  $(".MyChatList").each(function(index ,item) {
		        			  var checkUserID = $(this).children().children().children().children("#chatNum").val();
			        			 console.log("updateChatId : " + changeChatId + "- checkUserId :" + checkUserID);
			        			 if (checkUserID == changeChatId){
			        				$(this).remove();

			        				var output = '';
					                 output += '<table id = "MyChatTable" class = "MyChatList" style = "width: 100%;">';
					                 output += '<tr>';
						     		 output += '<td colspan = "4" class = "chName">';
						     		 output += '<input type = "hidden" id = "chatNum" name = "chatRoomNum" value = "'+ data._id +'">';
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
					                 $(output).appendTo('#listWrap');
					                 
					                 console.log(data._id);
			        				
					                 
			        			 } 
			        	 });
		 		 	 
		        		  
		        	 });
		 		 	
		 		 	
		 		 	//상태 버튼 클릭시 
		 		 	$(document).on("click" , ".statusBtn" , function(){
		 		 		var status = $(this).text();
		 		 		
		 		 		 console.log("클릭 :" + status);
		 		 		
		 		 		 socket.emit('SelectStatusChatting', {status : status , user : user});
		 		 			
		 		 		 
		 		 		 $(".MyChatList").remove();
		 		 		
		 		 		
		 			 	
		 		 	});
			 		
		 		 	
		 		 	 socket.on('SelectStatusChatting', function(data){
		 			 		
		 			 		
		 			 		var output = '';
			                 output += '<table id = "MyChatTable" class = "MyChatList" style = "width: 100%;">';
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
			                 $(output).appendTo('#listWrap');
		 			 		
		 			 	 });
		 		 	
		 		 	//리스트 버튼 클릭시 
		 		 	$("#ProgressBtn").click(function(){
		 		 		 $(".MyChatList").remove();
		 		 		
		 		 		 socket.emit('mychatting', {user : user});
		 		 	});
			 		
	        	} //if end 
	        	
	        	
	        	
	     }); //end
	 
	  </script>
</body>
</html>