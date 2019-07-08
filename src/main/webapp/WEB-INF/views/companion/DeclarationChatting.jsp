<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel = "stylesheet" type = "text/css" href = "resources/css/companion/declarationChatting.css">
</head>
<body>
	<c:set var = "contextPath" value = "${pageContext.servletContext.contextPath }" scope = "application"/>
	<input type = "hidden" value = "${chatId}" id = "ReChatID">
	<input type = "hidden" value = "${loginUser.userName}" id = "UserName">
	<div class = "wrap">
		<div class = "header">
			 <button id = "returnBtn"><i class="material-icons" >keyboard_arrow_left</i></button>
			 <div style = "float : left; padding-top : 13px;">
			 	<label style = "padding:0; font-size: 16px;">신고</label>
			 </div>
		</div>
		<div class = "content">
			<form class="md-form">
				<table id = "declarationTable">
					<tr>
						<td><label>신고자</label></td>
						<td><input type = "text" value = "${loginUser.userName}" name = "reporter" id = "reporter" readonly> </td>
					</tr>
					<tr>
						<td><label>신고 대상자</label></td>
						<td>
							<select>
								<option>선택하세요</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label>신고 사유</label></td>
						<td>
							<select id = "Selectreson">
								<option>선택하세요</option>
								<option>저작권 침해 및 명의 도용</option>
								<option>욕설 및 비방</option>
								<option>광고 및 음란물 등 부적절한 게시글</option>
								<option value = "etc">기타</option>
							</select>
						</td>
					</tr>
					<tr id = "etcTr">
						<td colspan = "2">
							<textarea  placeholder = "신고 사유를 작성해주세요" id = "declarationDetail"></textarea>
						</td>
					</tr>
				</table>
				<label style = "padding : 10px;">파일첨부</label>
				<a href="#this" id="add" class="btn">+</a>
					<div id = "fileDiv">
						<div class="filebox"> 
							<input class="upload-name" value="파일선택"
							 disabled="disabled" name = "file_0" > 
							 <label for="ex_filename_0">업로드</label> 
							 <input type="file" id="ex_filename_0"
							  class="upload-hidden"> 
							<a href="#this" id ="delete"  name="delete" class="btn">삭제하기</a>
						 </div>
					</div>
			</form>
		</div>
		<div id="footer" >
		     <button style = "float:right;" id = "submitbtn">
		     	전송하기
		     </button>
	  	</div>
	</div>
	
	 <script src="http://localhost:8010/socket.io/socket.io.js"></script>
     <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
	  <script>
	 	var g_count =1;
	 	 $(function(){
	 		 	$("#etcTr").hide();
	 		 
	            $("a[name='delete']").on("click",function(e){
	                e.preventDefault();
	                fn_fileDelete($(this));
	            });
	            
	            $("#add").on("click",function(e){
	                e.preventDefault();
	                fn_fileAdd();
	                console.log("클릭?");
	            })
	            
	           
	           $("#Selectreson").change(function(){
	        	  if($(this).val() == "etc"){
	        		  $("#etcTr").show();
	        	  }else {
	        		  $("#etcTr").hide();
	        	  }
	           });


	        });
	         
	
	        function fn_fileDelete(obj){
	            obj.parent().remove();
	        }
	        
	        function fn_fileAdd(){
	     		
	        	var str = "<div class= 'filebox'>";
	        	str += "<input class='upload-name' value='파일선택' disabled='disabled' />";
	        	str +=  "<label for='ex_filename_"+(g_count)+"' style = 'margin-left : 5px;'>업로드</label>" ;
				str += "<input type='file' id='ex_filename_"+(g_count)+"' class='upload-hidden' name = 'file_"+(g_count)+"'>"; 
				str += "<a href= '#this'  name='delete' class='btn' id = 'delete' style = 'margin-left : 10px;' >삭제하기</a>";
			   	str +=  "</div>";
	        	
	            /* var str = "<div class = 'file_input'>";
	            str += "<input type='file' name='file_"+(g_count++)+"'/><label>업로드</label><a href='#this' name='delete' class='btn'>삭제하기</a>";
	            str += "</div>"; */
	            
	            $("#fileDiv").append(str);
	             
	            $("a[name='delete']").on("click",function(e){
	                e.preventDefault();
	                fn_fileDelete($(this));         
	            });
	            
	            
	            g_count++;
	        }
	        
	        
	      
	     	$(document).on("change",".filebox .upload-hidden",function(){
	     		
	     		console.log(this);
	     		console.log($(this).parent().children('.upload-name'));
	     		
	     		if(window.FileReader){ // modern browser 
            		var filename = $(this)[0].files[0].name; 
	     		
	     			console.log(filename);
            	} else { // old IE var 
            		filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
            	} // 추출한 파일명 삽입
            	
            	$(this).parent().children('.upload-name').val(filename); 
            	
	     	});
	     	
			$(document).ready(function() { //start
				
				var userId = ${ loginUser.memberId };
				var userName = $("#UserName").val();
				var chatId = $("#ReChatID").val();
	    	 	
	    		console.log("userId :"+userId);
	    		console.log("chatId :" + chatId);
	    		  		
	    	   //서버
			   var socket = io("http://localhost:8010");
	    	   
	    	   $("#returnBtn").click(function(){
	    		   location.href = "${contextPath}/enterChatting.ch?num="+ chatId;
	    	   });
	    	   
		 	});
	        

	
	</script>
</body>
</html>