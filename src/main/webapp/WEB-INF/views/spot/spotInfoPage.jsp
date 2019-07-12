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
    	margin-right:1em !important;
	}	
	.pageingBtn{
		width:30px;
		height:22px;
		background:white;
		color:purple;
		border:1px solid purple;
		border-radius:5px;
	}
	.pageingBtn:hover{
		background:purple;
		color:white;
	}
	#memberListTB *{
		text-align:center;
	}
	.section {
		width:90% !important;
		margin:0 auto;
	}
	.icon {
		font-size : 20px !important;
		margin-right:10px !important;
	}
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" /> <br><br>
	<div class="columns">
		<div class="column">
			<!-- title -->
			<section class="section">
				<h1 class="title" style="color:gray;"><b style="color:black;">${ countryInfo.countryNameKo }</b> &nbsp; ${ countryInfo.countryNameEn }</h1>
			</section> <!-- end title -->
			
			<!-- content -->
			<section class="section">
				
				<!-- header -->
				<div class="field is-horizontal">
					<div class="field-body">
							<img src="${ cityFile[0].filePath }" id="bigImgArea"
								 style="margin-right:10px; width:45%; height:300px;">
						<div class="field">
							<!-- 날씨 --><div class="field" style="background-color:blue; width:100%; height:50%;"></div>
							<!-- 환율 --><div class="field" style="background-color:yellow; width:100%; height:50%;"></div>
						</div>
					</div> <!-- end field body -->
				</div> <!-- end header -->
				
				<hr style="border: 0.5px solid gray;">
				
				<!-- header sub pic area -->
				<div class="field is-horizontal">
					<div class="field-body">
						<c:forEach var="cityFile" items="${ cityFile }">
							<div class="field" onclick="changeImg('${ cityFile.filePath }', this);" id="smallImgArea">
								<img class="image" src="${ cityFile.filePath }" style="width: 300px; height: 180px;">
							</div>
						</c:forEach>
					</div>
				</div> <!-- end header sub pic area -->
				
				<hr style="border: 0.5px solid gray;">
				
				
			</section> <!-- end content -->
			
		</div> <!-- column -->
	</div> <!-- end columns -->
	
	<!-- spot menu area -->
	<div class="tabs is-toggle is-fullwidth is-large">
	    <ul>
	    
	      <li>
	      	<a class="button is-info is-outlined">
	      		<span class="icon"> <i class="fas fa-plane-departure"></i> </span>
	      		가볼만한 곳
	      	 </a>
	      </li>
	      
	      <li>
	      	<a class="button is-info is-outlined">
	      		<span class="icon"> <i class="far fa-paper-plane"></i> </span>
	      		일정
	      	 </a>
	      </li>
	      
	      <!-- <li><a class="button is-info is-outlined"> 호텔 </a></li> -->
	      <li>
	      	<a class="button is-info is-outlined">
	      		<span class="icon"> <i class="fas fa-map-marked-alt"></i> </span>
	      		지도
	      	 </a>
	      </li>
	      
	    </ul>
	  </div> <!-- end spot menu area -->
	  
	<div class="columns">
		<div class="column">
			<!-- list area -->
			<section class="section">
			 	<c:forEach var="cityInfo" items="${ spotList }">
			 		<div class="field" style="border:0.5px solid gray; padding:10px;" class="listItem">
						<article class="media">
						    <figure class="media-left">
						      <p class="image" style="width: 280px; height: 180px; overflow: hidden">
						        <img src="${ cityInfo.filePath }" style="width: 280px; height: auto;">
						      </p>
						    </figure>
		    				<div class="media-content" style="padding: 10px;" onclick="detailSpot('${ cityInfo.spotId }');">
		      					<div class="content">
							        <p>
							          <strong style="font-size: 20px;">${ cityInfo.spotNameKo }</strong> <br>
							          <strong style="color: gray;">${ cityInfo.spotAddress }</strong> &nbsp;&nbsp;&nbsp; <a href="#">google 지도</a>
							          <br><br> ${ cityInfo.spotContent } 
							        </p>
		      					</div>
		        			</div>
					    <div class="media-right" onclick="likeySpot('${ cityInfo.spotId }');">
					      <a class="level-item">
					        <span class="icon is-small"> <i class="fas fa-star"></i> </span>
					      </a>
					    </div>
					  </article>
			 		</div>
			 	</c:forEach>
			 	
			 	<!-- paging -->
				<div class="field" >
					<nav class="pagination">
				  	<ul class="pagination-list" style="justify-content: center;">
				  		<li><button class="pageingBtn"> << </button></li>
				  		<li><button class="pageingBtn"> < </button></li>
				  		<li><button class="pageingBtn"> 1 </button></li>
				  		<li><button class="pageingBtn"> 2 </button></li>
				  		<li><button class="pageingBtn"> > </button></li>
				  		<li<button class="pageingBtn"> >> </button>></li>
				  	</ul>
				  </nav>
				</div> <!-- end paging -->
				
			</section> <!-- end list area -->
		</div> <!-- end column -->
	</div> <!-- end columns -->
	
	<script>
		$(function(){
			
		});
		
		//명소 좋아요 추가
		function likeySpot(spotId){
			if('${ loginUser }' == null || '${ loginUser }' == "" || '${ loginUser }' == " "){
				alert ("회원가입이 필요한 서비스 입니다.");
			} else {
				$.ajax({
					url : "insertLikeySpot.sp",
					type : "post",
					data : {"spotId" : spotId},
					success : function(data){
						alert(data);
					},
					error : function(data){
						alert(data);
					}
				}); //end ajax
			} //end if 
		} //end func
		
		function changeImg(srcVal, divArea){
			$("#bigImgArea").attr("src", srcVal);
		} //end func
		
		function detailSpot(spotId){
			location.href = "selectSpotDetailInfo.sp?spotId=" + spotId;
		}
	</script>
</body>
</html>