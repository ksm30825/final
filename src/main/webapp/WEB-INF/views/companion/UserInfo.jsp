<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src="resources/js/semantic.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/semantic.min.css">
<link rel = "stylesheet" type = "text/css" href = "resources/css/companion/userInfo.css">
</head>
<body>
	<c:set var = "contextPath" value = "${pageContext.servletContext.contextPath }" scope = "application"/>
	<div class = "wrap">
		<div class = "header">
			 <button id = "returnBtn" onclick = "location.href = '${contextPath}/enterChatting.ch'"><i class="material-icons" >keyboard_arrow_left</i></button>
			 <div style = "float : left;padding-top : 15px;">
			 	<label style = "padding: 0; font-size: 16px;">사용자 정보</label>
			 </div>
		</div>
		<div class = "content">
			<div class = "userinfo">
			<button id = "Declaration"  data-toggle="tooltip" 
	  	     		 data-placement="top" title="신고하기">
    				<i class="material-icons"
    				style = "margin:0; padding: 0; color : #f75454; font-size : 20px;">
							notifications_active
					</i>
    		</button>
    		<br><br>
    		<div class = "info">
    			<img alt="user" src="resources/images/usericon.png" id = "usericon">
    			<br>
    			<label id = "userid">문지원 (wldnjs7781)</label>
    			<br>
    			<label id = "userinfor">20대 (여)</label>
    		</div>
    		</div>
    		<div class = "reputation">
	    		<div class="ui top attached tabular menu">
					  <a class="item" data-tab="first">
					  	<i id = "goodicon" class="material-icons">thumb_up_alt</i>
						10
					  </a>
					  <a class="item" data-tab="second">
					  	<i id = "badicon" class="material-icons">thumb_down_alt</i>
						5
					  </a>
				</div>
				<div class="ui bottom attached tab segment" data-tab="first">
					  <c:forEach var="i" begin="0" end="10">
						  <table id = "goodTable">
						  	<tr>
						  		<td><b>하와이 여행</b></td>
						  		<td>2019.06.23</td>
						  	</tr>
						  	<tr>
						  		<td colspan = "2">
						  			<p>
						  				이 희망의 스며들어 돋고, 피가 노래하며 웅대한 때문이다. 낙원을 끝까지 보이는 관현악이며, 새 속에 방지하는 날카로우나 길을 것이다. 그들은 굳세게 붙잡아 그리하였는가? 앞이 거친 청춘의 무엇을 어디 미묘한 있다.
						  			</p>
						  		</td>
						  	</tr>
						  </table>
					  </c:forEach>
				</div>
				<div class="ui bottom attached tab segment" data-tab="second">
					  <c:forEach var="i" begin="0" end="5">
						  <table id = "goodTable">
						  	<tr>
						  		<td><b>하와이 여행</b></td>
						  		<td>2019.06.23</td>
						  	</tr>
						  	<tr>
						  		<td colspan = "2">
						  			<p>
						  				이 희망의 스며들어 돋고, 피가 노래하며 웅대한 때문이다. 낙원을 끝까지 보이는 관현악이며, 새 속에 방지하는 날카로우나 길을 것이다. 그들은 굳세게 붙잡아 그리하였는가? 앞이 거친 청춘의 무엇을 어디 미묘한 있다.
						  			</p>
						  		</td>
						  	</tr>
						  </table>
					  </c:forEach>
				</div>
			</div>
		</div>
		
	</div>
	<script>
		$('.menu .item').tab();
	</script>
</body>
</html>