<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "resources/css/main/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.wrap{
		width : 100%;
		height: 100%;
	}
	
	.leftwrap{
		width : 10%;
		height: 80%;
		float:left;
	}
	
	.contentwrap{
		width : 80%;
		height: auto;
		float:left;
		background-image : url("resources/images/main.jpg");
		background-repeat : no-repeat;
		background-size: contain;
	}
	
	.rightwrap{
		width : 10%;
		height: 80%;
		float:left;
	}
	
	.SearchArea{
		margin-top : 20%;
		margin-bottom : 30%;
		width: 100%;
		height : auto;
	}
	
	
</style>
</head>
<body>
	<jsp:include page = "../common/mainNav.jsp"/>
	
	<!-- <section class="section" id="content"> -->
 		<div class = "wrap">
 		<div class = "leftwrap">
 			<br>
 		</div>	
 		<div class = "contentwrap">
 			<!-- <img src = "resources/images/main.jpg" id = "mainimg">--> 		
 			<div class = "SearchArea">
 				 <div style="background:black; background : rgba(0,0,0,0.6);"> 
 					<table id = "SearchTable">
 						<tr>
 							<td>여행지</td>
 							<td>테마 </td>
 						</tr>
 						<tr>
 							<td>
								<div class="field">
		        					<p class="control">
	          							<input class="input is-primary" id = "SearchPlace" name = "SearchPlace" type="text" placeholder="검색하실 여행지를 입력해주세요">
	       							 </p>
     						 	</div>
							</td>
 							<td>
								<div class="field">
	        						<p class="control">
	          							<input class="input is-primary" id = "SearchCategory" name = "SearchCategory" type="text" placeholder="검색하실 테마를 입력해주세요">
	       							 </p>
     						 	</div>
							</td>
 							<td>
								<div class="buttons">
       								 <a class="button is-primary is-outlined">검색</a>   
       							</div>
							</td>
 						</tr>
 						<tr>
 							<td>실시간 급상승 검색어</td>
 						</tr>	
 						<tr>
 							<td colspan = "5">
 								   <div id="content">
							            <dl id="rank-list">
							                <dt>실시간 급상승 검색어</dt>
							                <dd>
							                    <ol>
							                        <li><a href="#">1 순위</a></li>
							                        <li><a href="#">2 순위</a></li>
							                        <li><a href="#">3 순위</a></li>
							                        <li><a href="#">4 순위</a></li>
							                        <li><a href="#">5 순위</a></li>
							                        <li><a href="#">6 순위</a></li>
							                        <li><a href="#">7 순위</a></li>
							                        <li><a href="#">8 순위</a></li>
							                        <li><a href="#">9 순위</a></li>
							                        <li><a href="#">10 순위</a></li>
							                    </ol>
							                </dd>
							                
							            </dl>
       							 </div>
 							</td>
 						</tr>
 					</table>
 					</div>
 				</div>
 		
 		</div>	
		<div class = "rightwrap">
			<br>
		</div>
		</div>
<!-- 	</section> -->
		<script>
			$(function() {
			    var count = $('#rank-list li').length;
			    var height = $('#rank-list li').height();
	
			    function step(index) {
			        $('#rank-list ol').delay(2000).animate({
			            top: -height * index,
			        }, 500, function() {
			            step((index + 1) % count);
			        });
			    }
	
			    step(1);
			});
		</script>
		<li><a href="adminMain.ad">관리자페이지</a></li>
  	<li><a href="myPage.mp">마이페이지</a></li>
</body>
</html>