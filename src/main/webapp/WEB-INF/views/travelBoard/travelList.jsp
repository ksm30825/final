<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#travelListArea {
		padding: 3rem 1.5rem;
		padding-top: 0;
	}
</style>
</head>
<body>
	<jsp:include page="travelSearchBar.jsp" />
	
	<!-- 본문 -->
	<div class="columns is-mobile" id="travelListArea" align="center">
		<div class="column">
			
			<!-- 게시글 영역 -->
			<div class="ui special cards">
			
				<div class="card" onclick="location.href='travelDetailForm.tb?num=게시판번호'">
					<div class="blurring dimmable image">
						<div class="ui dimmer">
							<div class="content">
								<div class="center">
									<p class="title is-4" style="color: white;">TITLE</p>
								</div>
							</div>
						</div>
						<img src="resources/images/sample1.jpg">
					</div>
					
					<div class="content">
						<div class="header">
							<p class="title is-3">TITLE</p>
						</div>
						<div class="meta">
							<div>
								<a>@도시 </a>
								<a>@도시 </a>
							</div>
							<p class="date"><small>[00DAYS] 2019-01-01 ~ 2019-01-10</small></p>
							<a class="button is-small"> 
								<span class="icon is-small"><i class="fa fa-user"></i></span> 
								<span> 작성자 </span>
							</a>
						</div>
					</div>
					
					<div class="extra content">
							<a>#먹방여행 </a>
							<a>#혼자여행 </a>
							<a>#자유여행 </a>
					</div>
					<div class="extra content">
						<span>
							<a data-tooltip="구매수"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp;0</a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a data-tooltip="좋아요수"><i class="fas fa-star"></i>&nbsp;&nbsp;0</a>
						</span>
					</div>	
				</div>	<!-- class="card" 글 하나-->
				
			  
			</div>	<!-- class="ui special cards" -->
			
		</div>	<!-- class="column" -->
	</div>	<!-- class="columns is-mobile" -->
	
	
<script>
	
	//각 글에 마우스 올렸을 때 설명글
	$('.special.cards .image').dimmer({
	  on: 'hover'
	});
	
</script>
</body>
</html>