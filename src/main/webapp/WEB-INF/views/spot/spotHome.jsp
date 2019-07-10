<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Interface</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
	figure {
	    margin: 0em 0px !important;
	}
	.conditionStyle {
		color: #660066 !important;
		font-weight: bold !important;
	}
	.conditionStyle:hover {
		color: #3366ff !important;
	}
</style>
</head>
<body>
	<div id="topPosition"></div>
	<jsp:include page="../common/mainNav.jsp" /> <br><br>
	<div class="columns is-mobile"  style="width:90%; margin:0 auto;">
		<div class="column">
			<!-- condition area -->
			<nav class="breadcrumb">
			    <ul style="justify-content:flex-end;">
			      <li> <a class="conditionStyle" href="selectAllSpotUser.sp">주요도시</a> </li>
			      <li> <a class="conditionStyle">아시아</a> </li>
			      <li> <a class="conditionStyle">유럽</a> </li>
			      <li> <a class="conditionStyle">오세아니아</a> </li>
			      <li> <a class="conditionStyle">북미</a> </li>
			      <li> <a class="conditionStyle">중남미</a> </li>
			  </ul>
			</nav> <!-- end condition area -->
			
			<!-- country area -->
			<div class="field is-horizontal">
				<div class="field-body">
					<div class="field">
						<div class="buttons">
							<c:forEach var="cityName" items="${ cityNameList }" varStatus="names">
								<a class="button is-primary is-outlined is-rounded"> ${ cityName.cityNameKo  } </a>
							</c:forEach>
						</div>
					</div>
				</div> <!-- end field-body -->
			</div> <!-- end country area -->		
			
			<!-- card area -->
			<c:forEach var="i" begin="0" end="${ fn:length(cityList) - 1 }" step="1">
				<div class="field is-horizontal">
					<div class="field-body">
							<div class="field" onclick="location.href='selectSpotInfoUser.sp'">
								<div class="card">
							     <div class="card-image"> 
							       <figure class="image is-4by3" > <img src="resources/images/main.jpg" alt="Image"> </figure>
							     </div>
							     <div class="card-content">
							       <div class="media">
							         <div class="media-content">
							           <p class="title is-4">${ cityList[i].spotNameKo }</p>
							         </div>
							       </div>
							       <div class="content"> ${ cityList[i].spotContent } </div>
							     </div>
							   </div> <!-- end cord -->
							</div> <!-- end field -->
					</div> <!-- end field-body -->
				</div> <!-- end is horizontal -->
			</c:forEach> <!-- end cardArea -->
			
			<i class="fas fa-caret-square-up" onclick="location.href='#topPosition'"
			   style="position:fixed; font-size:40px; right:20px; bottom:10px; color: #5c0099;"></i>
		</div> <!-- end column -->
	</div> <!-- end columns -->
</body>
</html>