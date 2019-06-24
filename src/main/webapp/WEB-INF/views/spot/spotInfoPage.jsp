<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" /> <br><br>
	<div class="columns">
		<div class="column">
			<!-- title -->
			<section class="section">
				<h1 class="title" style="color:gray;"><b style="color:black;">Country Name(KO)</b> Country Name(EN)</h1>
			</section> <!-- end title -->
			
			<!-- content -->
			<section class="section">
				
				<!-- header -->
				<div class="field is-horizontal">
					<div class="field-body">
							<img src="resources/images/main.jpg" style="margin-right:10px; width:45%; height:300px;">
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
						<c:forEach var="i" begin="1" end="4" step="1">
							<div class="field">
								<img class="image" src="resources/images/main.jpg">
							</div>
						</c:forEach>
					</div>
				</div> <!-- end header sub pic area -->
				
				<hr style="border: 0.5px solid gray;">
				
				
			</section> <!-- end content -->
			
		</div> <!-- column -->
	</div> <!-- end columns -->
	
	
	<div class="columns">
		<div class="column">
			<!-- list area -->
			<section class="section">
			 	<c:forEach var="i" begin="1" end="10" step="1">
			 		<div class="field" style="border:0.5px solid gray; padding:10px;">
						<article class="media">
						    <figure class="media-left">
						      <p class="image">
						        <img src="resources/images/main.jpg" style="width:400px; height:20%;">
						      </p>
						    </figure>
		    				<div class="media-content">
		      					<div class="content">
							        <p>
							          <strong>John Smith</strong> <br>
							          Spot Address &nbsp;&nbsp;&nbsp; <a href="#">google 지도</a>
							          <br> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
							        </p>
		      					</div>
		        			</div>
					    <div class="media-right">
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
</body>
</html>