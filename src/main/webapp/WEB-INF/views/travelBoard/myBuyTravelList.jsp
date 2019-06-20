<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.content {
		cursor: pointer;
	}
</style>
<body>

	<jsp:include page="../common/mainNav.jsp" />
	
	<div class="columns is-mobile">
		<div class="column">
			<section class="section" id="headerSection">
				<jsp:include page="../common/myPageHeader.jsp" />
			</section>
			
			<section class="section" style="padding-top: 0;">
				<!-- 나라 태그 -->
				<div class="field has-addons">
					<p class="control is-expanded">
						<span class="select is-fullwidth">
							<select name="country" id="travelCountry">
								<option value="Argentina">Argentina</option>
								<option value="Bolivia">Bolivia</option>
								<option value="Brazil">Brazil</option>
								<option value="Chile">Chile</option>
								<option value="Colombia">Colombia</option>
								<option value="Ecuador">Ecuador</option>
								<option value="Guyana">Guyana</option>
								<option value="Paraguay">Paraguay</option>
								<option value="Peru">Peru</option>
								<option value="Suriname">Suriname</option>
								<option value="Uruguay">Uruguay</option>
								<option value="Venezuela">Venezuela</option>
							</select>
						</span>
					</p>
					<p class="control">
						<input class="input" type="text" placeholder="제목을 입력하세요">
					</p>
					<p class="control">
					 	<button class="button is-primary" id="myBuyTravelSearch">검색</button>
					</p>
				</div>
			</section>
			
			<section class="section" id="bredcrumbSection" style="padding-top:0; padding-bottom:0">
				<div class="title is-3" style="padding-left:10px">
					<i class="fas fa-map"></i>&nbsp;<span>일본</span>
				</div>
			</section>
			
			<section class="section" id="cardSection">
				<div class="columns" style="padding-left:20px;" align="center">
					
					<div class="ui special cards">
						<div class="card">
							<div class="blurring dimmable image">
								<div class="ui dimmer">
									<div class="content">
										<div class="center">
											<div class="ui inverted button" onclick="travelMake(${1})">이 글로 내 일정 작성하기</div>
										</div>
									</div>
								</div>
								<img src="resources/images/sample1.jpg">
							</div>
							
							<div class="content" onclick="location.href='travelDetailForm.tb?num=${1}'">
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
						
						<div class="card">
							<div class="blurring dimmable image">
								<div class="ui dimmer">
									<div class="content">
										<div class="center">
											<div class="ui inverted button make" onclick="travelMake(${2})">이 글로 내 일정 작성하기</div>
										</div>
									</div>
								</div>
								<img src="resources/images/sample1.jpg">
							</div>
							
							<div class="content" onclick="location.href='travelDetailForm.tb?num=${2}'">
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
				</div>
			</section>
			
			
			<!--  -->
			
			<section class="section" id="bredcrumbSection" style="padding-top:0; padding-bottom:0">
				<div class="title is-3" style="padding-left:10px">
					<i class="fas fa-map"></i>&nbsp;<span>유럽</span>
				</div>
			</section>
			
			<section class="section" id="cardSection">
				<div class="columns" style="padding-left:20px;" align="center">
					
					<div class="ui special cards">
						<div class="card">
							<div class="blurring dimmable image">
								<div class="ui dimmer">
									<div class="content">
										<div class="center">
											<div class="ui inverted button" onclick="travelMake(${1})">이 글로 내 일정 작성하기</div>
										</div>
									</div>
								</div>
								<img src="resources/images/sample1.jpg">
							</div>
							
							<div class="content" onclick="location.href='travelDetailForm.tb?num=${1}'">
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
						
						<div class="card">
							<div class="blurring dimmable image">
								<div class="ui dimmer">
									<div class="content">
										<div class="center">
											<div class="ui inverted button make" onclick="travelMake(${2})">이 글로 내 일정 작성하기</div>
										</div>
									</div>
								</div>
								<img src="resources/images/sample1.jpg">
							</div>
							
							<div class="content" onclick="location.href='travelDetailForm.tb?num=${2}'">
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
				

				</div>
			</section>
			
			
			
		</div>
	</div>
	
	<!-- 일정만들기 안내 모달 -->
	<section class="section" id="modal">
		<div class="modal" id="myModal">
		    <div class="modal-background"></div>
		    <div class="modal-card">
		    
				<header class="modal-card-head">
					<p class="modal-card-title"><i class="fas fa-info-circle"></i>&nbsp;일정만들기 안내</p>
					<button class="cancel delete"></button>
				</header>
			
				<section class="modal-card-body">
					
					<p>
						일정 오버라이딩은 여행 일정을 보다 쉽게 짤 수 있도록 도와주는 기능으로 작성 완료 후 개인소장만 가능하며, 사이트에 일정 공유는 불가함을 참고해주시기 바랍니다.
					</p>
				</section>
			
				<footer class="modal-card-foot" style="justify-content: center">
					<a class="button is-primary" id="travelMake">일정만들기</a>
					<a class="button cancel">닫기</a>
				</footer>
			
		    </div>
		</div>
	</section>
	
<script>
	//각 글에 마우스 올렸을 때 설명글
	$('.special.cards .image').dimmer({
	  on: 'hover'
	});	
	
	
	function travelMake(num) {
		console.log(num);
		$('#myModal').toggleClass('is-active').removeAttr('style');
		
		$("#travelMake").click(function() {
			alert("일정만들기 작성");
			location.href="travelMake.tb";
		})
		
		$(".cancel").click(function(){
			$('#myModal').removeClass('is-active');
	    });
	}
	
	
	
</script>

</body>
</html>