<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Interface</title>
<link rel="stylesheet" href="resources/css/bulmaswatch.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/semantic.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.theme.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.structure.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/semantic.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<style>
	.section {
		width:90% !important;
		margin:0 auto;
	}
	a:hover {
		background-color: white !important;
		color: skyblue !important;
	}
	.field-label {
		text-align: left;
		width: 100px;
		flex-grow: 0 !important;
	}
	.label {
		width: 100px;
	}
	.spotInfo {
		text-align: left;
	}
</style>
</head>
<body>
	<!-- nav area -->
	<nav class="navbar is-info" style="background-color: white; border-bottom: 2px solid skyblue;">
    <div class="navbar-brand">
      <a class="navbar-item" href="selectSpotInfoUser.sp">
        <i class="fas fa-chevron-circle-left" style="font-size: 40px; color: skyblue;"></i>
      </a>
      <div class="navbar-burger burger" data-target="navMenuExample4">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
    <div id="navMenuExample4" class="navbar-menu">
      <div class="navbar-start">
      </div>
      <div class="navbar-end">
        <a class="navbar-item" href="showIndex.me" style="color: skyblue; font-weight:bold; font-size:18px;">
          <strong>TRAVEL INTERFACE</strong> &nbsp; &nbsp; &nbsp;
          <i class="far fa-paper-plane" style="color: skyblue; font-size:40px;"></i>
        </a>
      </div>
    </div>
  </nav> <!-- end nav area -->
  
  <!-- content Area -->
  <div class="columns">
  	<div class="column">
  		
  		<!-- title -->
			<section class="section">
				<h1 class="title" style="color:gray;"><b style="color:black;">COUNTY Name(KO)</b> COUNTY Name(EN)</h1>
			</section> <!-- end title -->
			
			<!-- content -->
			<section class="section">
				
				<!-- header -->
				<div class="field is-horizontal">
					<div class="field-body">
						<img src="resources/images/main.jpg" style="margin-right:10px; width:45%; height:300px;">
						
						<!-- text area -->
						<div class="field" style="width: 55%;">
							<div class="field" style="justify-content: flex-end; text-align: right;">
								<div class="ui rating" data-max-rating="1"></div>
								<!-- <i class="far fa-star" style="font-size: 35px; color: yellow;"  onclick="clickStar(this);"></i> -->
							</div>
							<div class="field">
								<h3 class="title"><b>SPOT_NAME</b></h3>
							</div>
							
							<hr>
							
							<div class="field is-horizontal">
								<div class="field-body">
									<div class="field is-grouped">
										<i class="fas fa-map-marker-alt" style="color: purple; font-size: 20px;"></i> &nbsp;&nbsp;
										<label class="label">SPOT_ADDRESS</label> &nbsp;&nbsp;
										<a href="#">google 지도</a>
									</div>
								</div>
							</div>
							
							<hr>
							
							<div class="field">
								<p class="control">
									용감하고 굳세게 살 수 있는 것이다 석가는 무엇을 위하여 설산에서 고행을 하였으며 예수는 무엇을 위하여 광야에서
									불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의 놀이 뜨고 열락의 새가 운다사랑의 풀이 없으면 인간은 사막이다 오아이스도 없는 사막이다 보이는 끝까지 찾아다녀도 목숨이 있는 때까지 방황하여도 보이는 것은 거친 모래뿐일 것이다
									얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생에 따뜻한 봄바람을 불어 보내는 것은 청춘의 끓는 피다 청춘의 피가 뜨거운지라 인간의 동산에는 사랑의 풀이 돋고 이상의 꽃이 피고 희망의
								</p>
							</div>
							
						</div> <!-- end text area -->
						
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
				
				<!-- spot detail info area -->
				<div class="field">
					<div class="field is-horizontal">
						<div class="field-body">
							<div class="field-label">
								<label class="label">상세주소</label>
							</div>
							<div class="field spotInfo">
								<label class="label">SPOT_DETAIL_ADDRESS</label>
							</div>
						</div>
					</div>
					
					<div class="field is-horizontal">
						<div class="field-body">
							<div class="field-label">
								<label class="label">연락처 </label>
							</div>
							<div class="field spotInfo">
								<label class="label">SPOT_PHONE_NUMBER</label>
							</div>
						</div>
					</div>
					
					<div class="field is-horizontal">
						<div class="field-body">
							<div class="field-label">
								<label class="label">웹사이트</label>
							</div>
							<div class="field spotInfo">
								<label class="label">SPOT_WEB_ADDRESS</label>
							</div>
						</div>
					</div>
					
					<div class="field is-horizontal">
						<div class="field-body">
							<div class="field-label">
								<label class="label">영업시간</label>
							</div>
							<div class="field">
								<label class="label spotInfo">SPOT_OPEN_HOURS</label>
							</div>
						</div>
					</div>
				</div> <!-- end spot detail info area -->
				
				<hr style="border: 0.5px solid gray;">
				
				<!-- relative plan -->
				<div class="field is-horizontal">
					<div class="field-body">
						<h3>관련 일정</h3>
						<div class="field" style="justify-content: flex-end; text-align: right;">
							<a href="#">일정 더보기 > </a>
						</div>
					</div>
				</div> <!-- end relativ plan -->
				
				<hr style="border: 0.5px solid gray;">
				
				<!-- reviews area -->
				<div class="field is-horizontal">
					<div class="field-body">
						<h3 style="color: purple;"><strong style="color: black;">리뷰</strong>&nbsp; &nbsp; REVIEW_COUNT</h3>
						<div class="field is-horizontal">
							<div class="field-body">
								<div class="field is-grouped" style="justify-content: flex-end;">
									<i class="fas fa-smile" style="color: red; font-size: 30px;"></i> &nbsp; &nbsp;
									<div class="field">
										<h2 style="color: red; font-size: 25px;">AVG </h2> &nbsp; &nbsp;
									</div>
								</div>
							</div>
						</div>
					</div> <!-- end header -->
					
					<!-- insert review area -->
					<div class="field" style="border: 0.3px solid gray; padding:10px;">
						<div class="field is-horizontal">
							<div class="field-body">
								<div class="field">
									<label class="label">USER_EMIAL</label>
								</div>
							</div>
						</div>
					</div> <!--  end insert review area -->
				</div> <!-- end reviews area -->
				
			</section> <!-- end content -->
			
  	</div> <!-- end column -->
  </div> <!-- end columns -->
  <!-- end contentArea -->
  
  <!-- script area -->
  <script>
  	function clickStar(star){
  		console.log($(star));
  		$(star).removeClass();
  		$(star).addClass("fas fa-star");
  	} //end func
  	
  	$(function(){
  		$('.toggle.example .rating')
	  	  .rating({
	  	    initialRating: 2,
	  	    maxRating: 4
	  	  })
	  	;
  	});
  </script> <!-- end script -->
</body>
</html>