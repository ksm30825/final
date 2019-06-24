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
<style>
body {overflow-y: hidden; overflow-x: hidden; margin : 0;}
	.wrap{
		position:absolute;
		width: 100%;
		height : 100%;
		overflow-y: hidden; overflow-x: hidden;
	}
	.header{
		width : 100%;
		height : 7%;
		background : #74a4f2;
	}
	
	#returnBtn{
 		border : none;
 		background : none;
 		float : left;
 		padding : 5px;
 	}
 	
 	#returnBtn i {
 		padding: 5px;
 		color: white;
 		font-size: 30px;
 	}
 	
 	#declarationTable { width : 100%;}
 	
 	#declarationTable td {
 		padding : 10px;
 	}
 	
 	textarea::placeholder {
	  color: #6aa7f7; 
	  opacity: 1; /* 파이어폭스에서 뿌옇게 나오는 현상을 방지하기 위한 css */
	}
		
	textarea::-webkit-input-placeholder { color: #6aa7f7;  }
	textarea:-ms-input-placeholder { color: #6aa7f7; }
	textarea:-mos-input-placeholder { color: #6aa7f7;}
	
	#declarationDetail {
		width : 100%;
		height  : 80px;
		resize : none;	
		border-radius : 5%;
	}
	
	#declarationTable select {
		padding : 5px;
		width : 100%;
		border-radius : 5%;
	}
	
	#reporter {
		color: #555;
   	 	background-color: #fff;
    	background-image: none;
	    border: 1px solid #ccc;
		width : 95%; padding : 5px;
	    line-height: 1.5; 
	    border-radius: 5%;
	}
	
	.btn{
		text-decoration : none;
		font-size : 10px;
		background : #74a4f2;
		color : white;
		padding : 5px;
		border-radius : 5%;
		margin-left : 10px;
	}
 
 #makeRoomIcon{
	font-size : 60px;
	color: #7ba9f2;
	background : none;
	float : right ;
	}
	
	#footer {
    position:absolute;
    bottom:0;
    width:100%;
    height:70px;   
    padding : 0; margin: 0;
	}
	
	#submitbtn{
		background : white;
		border : 1px solid #d87bf7;
		padding : 5px;
		margin-right : 5px;
		border-radius : 5%;
		margin-top : 20px;
		color : #d87bf7;
		font-size : 15px;
	}
	
	#submitbtn:hover{
		color : white;
		background : #d87bf7;
	}

</style>
</head>
<body>
	<div class = "wrap">
		<div class = "header">
			 <button id = "returnBtn" onclick = "location.href = '${contextPath}/enterChatting.ch'"><i class="material-icons" >keyboard_arrow_left</i></button>
			 <div style = "float : left; padding-top : 13px;">
			 	<label style = "padding:0; font-size: 16px;">신고</label>
			 </div>
		</div>
		<div class = "content">
			<form>
				<table id = "declarationTable">
					<tr>
						<td><label>신고자</label></td>
						<td><input type = "text" value = "지원(wldnjs7781)" name = "reporter" id = "reporter" readonly> </td>
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
							<select>
								<option>선택하세요</option>
								<option>저작권 침해 및 명의 도용</option>
								<option>욕설 및 비방</option>
								<option>광고 및 음란물 등 부적절한 게시글</option>
								<option>기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan = "2">
							<textarea  placeholder = "신고 사유를 작성해주세요" id = "declarationDetail"></textarea>
						</td>
					</tr>
				</table>
				<label style = "padding : 10px;">파일첨부</label>
				<a href="#this" id="add" class="btn">파일 추가하기</a>
				 <div id="fileDiv" style = "padding: 5px;">
						<div class= "file_input">
							<input type="file" name="file_0"/>
							<label>업로드</label>
							<a href="#this"  name="delete" class="btn">삭제하기</a>
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
	  <script>
	 	var g_count =1;
	 	 $(function(){
	            $("a[name='delete']").on("click",function(e){
	                e.preventDefault();
	                fn_fileDelete($(this));
	            })
	            $("#add").on("click",function(e){
	                e.preventDefault();
	                fn_fileAdd();
	            })
	        });
	         
	
	        function fn_fileDelete(obj){
	            obj.parent().remove();
	        }
	        
	        function fn_fileAdd(){
	     
	            var str = "<div class = 'file_input'>";
	            str += "<input type='file' name='file_"+(g_count++)+"'/><label>업로드</label><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
	            str += "</div>";
	            $("#fileDiv").append(str);
	             
	            $("a[name='delete']").on("click",function(e){
	                e.preventDefault();
	                fn_fileDelete($(this));         
	            })
	        }
     

	
	</script>
</body>
</html>