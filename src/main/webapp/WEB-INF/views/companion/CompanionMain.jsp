<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab&display=swap" rel="stylesheet">
<link rel="stylesheet" href="resources/css/bulmaswatch.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	body {
    margin: 0;
    overflow-y: hidden; overflow-x: hidden; }
	
	
	.wrap{
		width : 100%;
		height :710px;
		background-image : url("resources/images/chatmain.png");
		background-repeat : no-repeat;
	}
	
	.header {
		width : 100%;
		height: 20%;	
	}
	
	.header img {
		margin-top : 10%;
	}
	
	.contentWrap{
		width : 100%;
		height: 80%;
	}
	
	#guide {
		width : 350px;
		height : 400px;
		background:black; background : rgba(0,0,0,0.6);
		margin-left : auto;
		margin-right : auto;
	}
	
	#startbutton a{
		margin-left : auto;
		margin-right : auto;
		width : 200px;
	}
	
	#guide p { color : white; 
	text-align : center; line-height: 40px;}
	
</style>
</head>
<body>
	<c:set var = "contextPath" value = "${pageContext.servletContext.contextPath }" scope = "application"/>
	<div class = "wrap">
		<div class = "header">
			<img src = "resources/images/chatTitleText.png" alt = "로고"/>
		</div>
		<div class = "contentWrap">
			<div id = "guide">
				<p>
				떠나고 싶은데 같이 갈 친구가 없다면  <br> 일정 맞는 친구들을 찾아 떠나보세요 <br>
				하지만 에티켓은 꼭 지켜주세요 <br>
				욕설 및 비방 , 음란물에 대한 채팅은 안돼요.<br> 신고 접수시 강력재재를 해요.<br>
				갑자기 잠수를 타는 일이나 <br> 여행에 피해가는 행동을 하면 안돼요.<br>
				그럼 저희 동행을 찾아 떠나보세요~<br>
				즐거운 여행이 되시길 늘 기도할게요.<br>
				</p>
				
			</div>
			<br>
			<div class="buttons" id = "startbutton">
				<a class="button is-primary is-rounded">시작하기</a>
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$("#startbutton").click(function(){
				location.href = "${contextPath}/enterChatting.ch";
			});
		});
	</script>
	
</body>
</html>