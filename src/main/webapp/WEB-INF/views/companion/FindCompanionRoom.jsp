<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "resources/css/companion/findcompanionRoom.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
 <script src="https://code.jquery.com/jquery-latest.js"></script> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<style>
	body {overflow-y: hidden; overflow-x: hidden;}
	
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
	
	#makeRoomBtn{
		background : none;
		border : none;
	}
	
	#makeRoomTable td{
		padding: 5px;
	}
	
	#chatPlace, #chatTitle{
	    width: 340px !important; 
	}
	
	#datepicker1 , #datepicker2{ width : 150px; display : inline-block; /* margin-right : 10px; */ }
	
	#peopleNum {
	color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
	width : 150px;  height: 30px;
    line-height: 1.5; margin-left : 38%;
    border-radius: 3px;}
    
    #txtDetail{
    	resize : none;
    	width : 340px; height : 100px;
    	border-radius: 3px;
    }
	
</style>
</head>
<body>
	 <jsp:include page = "../companion/CompanionMenu.jsp"/>
		
	<div id = "container">	
	 <div id="menu1" style = "padding-left : 20px;">
	     <br>
	     <table class = "AllChatList" id = "ChatListTable" >
	     		<tr>
	     			<td colspan = "2" class = "AllChatTitle">
	     			<input type = "hidden" id = "chatNum" name = "chatNum" value = "1">
	     			<label>채팅방 제목</label></td>
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
	     <div style = "float:right;" id = "makeRoomBtn" class="btn btn-info btn-lg" data-toggle="방만들기" data-target="#myModal">
	     	<i class="material-icons" id ="makeRoomIcon">add_circle</i>
	     </div>
	  </div>
	  
	  
	  <div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">동행찾기 방 만들기</h4>
		      </div>
		      <div class="modal-body" id = "model">
		         <form>
		         	 <table id = "makeRoomTable">
		         		<tr>
		         			<td><b>채팅방 제목</b></td>
		         		</tr>
		         		<tr>
		         			<td>
		         				<input type = "text" name = "chatTitle"  id = "chatTitle"
		         						class="form-control input-sm" placeholder = "채팅방이름을 작성해주세요"/>
		         			</td>
		         		</tr>
		         		<tr>
		         			<td>
		         				<b>여행지</b>
		         			</td>
		         		</tr>
		         		<tr>
		         			<td>
		         				<input type = "text" name = "chatPlace"  id = "chatPlace"
		         						class="form-control input-sm" placeholder = "떠날 여행지 작성해주세요"/>
		         			</td>
		         		</tr>
		         		<tr>
		         			<td><b>여행날짜</b></td>
		         		</tr>
		         		<tr>
		         			<td>
		         				<input type="text" class="form-control input-sm" id="datepicker1" name = "trStartDate" > &nbsp; ~ &nbsp;&nbsp;
		         				<input type="text" class="form-control input-sm" id="datepicker2" name = "trEndDate" >
							</td>
		         		</tr>
		         		<tr>
		         			<td>
		         				<b>인원 </b>
		         				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="number" id = "peopleNum" name= "peopleNum" min="0" value = "1">
		         			</td>
		         		</tr>
		         		<tr>
		         			<td>
		         				<b>채팅방 설명</b>
		         			</td>
		         		</tr>
		         		<tr>
		         			<td>
		         				<textarea name = "chatDetail" id = "txtDetail"></textarea>
		         			</td>
		         		</tr>
		         	</table> 
		         	
		         </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">방만들기</button>
		      </div>
		    </div>
		  </div>
	  </div> 
	  
	    
	<div id="checkModel" class="checkmodal">
 
      <!-- Modal content -->
      <div class="checkmodal-content">
          <form>
          	<table>
          		<tr>	
          			<td><h2 style = "align:center;"></h2></td>
          		</tr>
          	</table>
          </form>
      </div>
 
    </div>
	  
	  
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  <script>
			  $.datepicker.setDefaults({
		          dateFormat: 'yy-mm-dd' //Input Display Format 변경
		          ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
		          ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		          ,changeYear: true //콤보박스에서 년 선택 가능
		          ,changeMonth: true //콤보박스에서 월 선택 가능                
		          ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
		          ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
		          ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
		          ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
		          ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		          ,minDate: "0D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
		          ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
		      });
				 		
			 $("#datepicker1").datepicker();
		 	 $("#datepicker2").datepicker();
		 	
		 	 
		 	 $(function(){
		 	 	$("#ChatListTable tr").click(function(){
		 	 		var chatList = $(this).parent().children().children();
		 	 		var chatNum = chatList.children().val();
		 	 		
		 	 		console.log(chatList);
		 	 		console.log("chatNum :" + chatNum);
		 	 		
		 	 		 $('#checkModel').show();
		 	 		
		 	 	}); 
		 	 });
		 		
		 	 
	        //팝업 Close 기능
	        function close_pop(flag) {
	             $('#checkModel').hide();
	        };


		 		
	  </script>
	  
</body>
</html>