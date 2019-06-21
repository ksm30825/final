<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	.blurring {
		cursor: pointer;
	}
</style>

<body>
	
	<jsp:include page="../common/mainNav.jsp" />
	
	<div class="columns is-mobile">
	<div class="column">
		<section class="section" style="padding-bottom:0">
			<jsp:include page="../common/myPageHeader.jsp" />
		</section>
		
		<!-- 서브메뉴바 영역 -->
		<section class="section" style="padding-top:0;">
		
			<div class="tabs is-toggle is-toggle-rounded" style="justify-content: center; width: 100%;">
				<ul>
					<li class="is-active" style="width: 100%;">
						<a>
						<span class="icon"><i class="fas fa-paper-plane"></i></span>
						<span>여행일정 좋아요</span>
						</a>
					</li>
					<li style="width: 100%;">
						<a>
						<span class="icon"><i class="fas fa-globe-americas"></i></span>
						<span>여행지 좋아요</span>
						</a>
					</li>
				</ul>
			</div>			
		</section>
		
		<!-- 본문 영역 -->
		<section class="section" style="padding-top:0;" align="center">
			
			<!-- 게시글 영역 -->
			<div class="ui special cards" style="padding-left: 1em; padding-right: 1em;">
			
				<div class="card">
					<div class="blurring dimmable image" onclick="location.href='travelDetailForm.tb?num=게시판번호'">
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
						<div class="button is-danger is-rounded" onclick="myLikeyTravelCancel()">
							<i class="fas fa-heart"></i>
							&nbsp;<p>좋아요 취소</p>
						</div>
					</div>	
				</div>	<!-- class="card" 글 하나-->
				
				
			  
			  
			  
			</div>	<!-- class="ui special cards" -->
		</section>
	
	
	
	</div>	<!-- class="column" -->
	</div>	<!-- class="columns is-mobile" -->

<script>
	
	//각 글에 마우스 올렸을 때 설명글
	$('.special.cards .image').dimmer({
	  on: 'hover'
	});
	
	function likeyCancel(num) {
		console.log(num);
		
		$("#travelMake").click(function() {
			alert("일정만들기 작성");
			location.href="travelMake.tb";
		})
		
		$(".cancel").click(function(){
			$('#myModal').removeClass('is-active');
	    });
	}
	
	
	function myLikeyTravelCancel(num) {
		var answer = confirm("좋아요를 취소하시겠습니까?");
		
		if(answer) {
			$.ajax({
				url : "myLikeyTravelCancel.tb",
				data : {},
				success : function(data) {
					alert("좋아요 취소 처리");
				}
			})
		}
		
	}
	
</script>

</body>
</html>