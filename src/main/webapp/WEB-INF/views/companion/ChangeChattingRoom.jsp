<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel = "stylesheet" type = "text/css" href = "resources/css/companion/changechattingroom.css">


</head>
<body>
	<c:set var = "contextPath" value = "${pageContext.servletContext.contextPath }" scope = "application"/>
	<div class = "wrap">
		 <div class = "header">
			 <button id = "returnBtn" onclick = "location.href = '${contextPath}/enterChatting.ch'"><i class="material-icons" >keyboard_arrow_left</i></button>
			 <div style = "float : left;padding-top : 15px;">
			 	<label style = "padding: 0; font-size: 16px;">채팅방 정보 설정</label>
			 </div>
		</div> 
		<div class = "content">
			<div class="panel-group" id="accordion">
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"><b>채팅방 설정 바꾸기</b></a>
			        </h4>
			      </div>
			      <div id="collapse1" class="panel-collapse collapse in">
			        <div class="panel-body">
			        	<form>
				         	 <table id = "changeRoomTable">
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
				         				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="number" name= "peopleNum" id = "peopleNum" min="1" value = "1">
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
				         <button type = "button" class = "modifybtn">변경하기</button>
			        </div>
			      </div>
			    </div>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><b>방장위임</b></a>
			        </h4>
			      </div>
			      <div id="collapse2" class="panel-collapse collapse">
			        <div class="panel-body">
			        	<h5><b>방장을 위임할 사람을 선택해주세요</b></h5>
			        	<div class="selectbox"> <label for="ex_select">방장선택</label>
			        	<select id="ex_select">
				        	 <option selected>방장선택</option> 
				        	 <option>한국</option> 
				        	 <option>일본</option> 
				        	 <option>중국</option> 
			        	 </select>
			        	 </div>
			        	  <button type = "button" class = "modifybtn">변경하기</button>

			        </div>
			      </div>
			    </div>
			 </div>
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
	</script>
	
</body>
</html>