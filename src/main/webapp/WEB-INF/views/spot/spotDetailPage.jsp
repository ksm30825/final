<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<jsp:include page="../common/mainNav.jsp" /> <br><br>
  <c:if test="${ !empty msg && msg eq '' && msg eq ' '}">
  	<script>
  		alert("${ msg }");
  	</script>
  </c:if>
  <!-- content Area -->
  <div class="columns">
  	<div class="column">
  		
  		<!-- title -->
			<section class="section">
				<h1 class="title" style="color:gray;">
					<i class="fas fa-chevron-circle-left" style="font-size: 40px; color: skyblue;"></i>
					<b style="color:black;">${ city.cityNameKo }</b> ${ city.cityNameEn }
				</h1>
			</section> <!-- end title -->
			
			<!-- content -->
			<section class="section">
				
				<!-- header -->
				<div class="field is-horizontal">
					<div class="field-body">
						<img src="${ spotFile[0].filePath }" style="margin-right:10px; width:45%; height:300px;">
						
						<!-- text area -->
						<div class="field" style="width: 55%;">
							<div class="field" style="justify-content: flex-end; text-align: right;">
								<div class="ui rating" data-max-rating="1"></div>
								<!-- <i class="far fa-star" style="font-size: 35px; color: yellow;"  onclick="clickStar(this);"></i> -->
							</div>
							<div class="field">
								<h3 class="title"><b>${ spotList.spotNameKo }</b></h3>
							</div>
							
							<hr>
							
							<div class="field is-horizontal">
								<div class="field-body">
									<div class="field is-grouped">
										<i class="fas fa-map-marker-alt" style="color: purple; font-size: 20px;"></i> &nbsp;&nbsp;
										<label class="label" style="width: 80%; color: gray;">${ spotList.spotAddress }</label> &nbsp;&nbsp;
										<a href="#">google 지도</a>
									</div>
								</div>
							</div>
							
							<hr>
							
							<div class="field">
								<p class="control"> ${ spotList.spotContent }</p>
							</div>
							
						</div> <!-- end text area -->
						
					</div> <!-- end field body -->
				</div> <!-- end header -->
				
				<hr style="border: 0.5px solid gray;">
				
				<!-- header sub pic area -->
				<div class="field is-horizontal">
					<div class="field-body">
						<c:forEach var="spotImg" items="${ spotFile }">
							<div class="field">
								<img class="image" src="${ spotImg.filePath }"  style="width: 300px; height: 180px;">
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
								<label class="label" style="width: 80%;">${ spotList.spotAddress }</label>
							</div>
						</div>
					</div>
					
					<div class="field is-horizontal">
						<div class="field-body">
							<div class="field-label">
								<label class="label">연락처 </label>
							</div>
							<div class="field spotInfo">
								<label class="label" style="width: 80%;">${ spotList.spotPhone }</label>
							</div>
						</div>
					</div>
					
					<div class="field is-horizontal">
						<div class="field-body">
							<div class="field-label">
								<label class="label">웹사이트</label>
							</div>
							<div class="field spotInfo">
								<label class="label" style="width: 80%;">${ spotList.webAddress }</label>
							</div>
						</div>
					</div>
					
					<div class="field is-horizontal">
						<div class="field-body">
							<div class="field-label">
								<label class="label">영업시간</label>
							</div>
							<div class="field">
								<label class="label spotInfo" style="width: 80%;">${ spotList.openingHours }</label>
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
				
				<!-- 리뷰 평균 구하기 -->
				<c:set var="sum" value=""/>
				<c:forEach var="grade" items="${ spotReviews }">
					<c:set var="sum" value="${ sum + grade.grade }"/>
				</c:forEach>
				<c:set var="length" value="${ fn:length(spotReviews) }"/>	
				<fmt:formatNumber var="avg" value="${ sum / length }" pattern=".0"/>
				<!-- end 리뷰 평균 구하기 -->
				
				<!-- reviews area -->
				<div class="field is-horizontal">
					<div class="field-body">
						<h3 style="color: purple;"><strong style="color: black;">리뷰</strong>&nbsp; &nbsp;( ${ length } )</h3>
						<div class="field is-horizontal">
							<div class="field-body">
								<div class="field is-grouped" style="justify-content: flex-end;">
									<i class="fas fa-smile" style="color: red; font-size: 30px;"></i> &nbsp; &nbsp;
									<div class="field">
										<h2 style="color: red; font-size: 25px;">${ avg } </h2> &nbsp; &nbsp;
									</div>
								</div>
							</div>
						</div>
					</div> <!-- end header -->
				</div> <!-- end reviews area -->
					
			<!-- insert review area -->
			<form action="insertSpotReview.sp" method="post">
				<div class="field" style="border: 0.3px solid gray; padding:10px;">
					<c:if test="${ !empty loginUser }">
						<input type="hidden" value="${ loginUser.memberId }" name="memberId">
						<input type="hidden" value="${ spotList.spotId }" name="spotId">
						<label class="label">${ loginUser.userName }</label>
					</c:if>
					<c:if test="${ empty loginUser }">
						<label class="label" style="width: 100%;">익명의 사용자</label>
					</c:if>
					<div class="field is-horizontal">
						<div class="field-body">
							<div class="field" style="width: 15%;">		
								<div class="field" align="center">
										<i class="fas fa-grin-hearts" style="font-size: 70px; color: #ff0066;" id="gradeIcon"></i>
						          </div>				
								<span class="select" style="margin-top: 10px; width: 100%;">
						            <select name="grade" style="width: 100%;" id="gradeOption">
						              <option value="5" selected>꼭 가봐야 해요!(5)</option>
						              <option value="4">꽤 가볼만해요(4)</option>
						              <option value="3">가볼만해요(3)</option>
						              <option value="2">아쉬워요(2)</option>
						              <option value="1">별로예요(1)</option>
						            </select>
						          </span>					          
							</div>
							
							<!-- text area -->
							<div class="field" style="width: 60%;">
					           <div class="control">
					             <textarea class="textarea" placeholder="댓글을 남겨주세요." id="reviewContent" name="reviewContent"></textarea>
					           </div>
					        </div> <!--  end text area -->
					        
					        <div class="field buttons" style="width: 5%;">
					        	<button class="button is-info is-outlined" style="width: 100%; height: 100%;" onclick="return insertReview();"> 등록하기 </button>
					        </div>
						</div>
					</div>					
				</div> <!--  end insert review area -->
			</form>
			
			<!-- review list -->
			<c:forEach var="reviews" items="${ spotReviews }">
				<div class="field" style="border: 0.3px solid gray; padding:10px; background-color: #f7e6ff; margin-top: 10px;">
				
					<div class="field is-horizontal">
						<div class="field-body">
							<div class="field" style="width: 15%; padding-top: 10px;" align="center">	
								<c:choose>
									<c:when test="${ reviews['grade'] eq 1 }"> 
										<i class="fas fa-laugh" style="font-size: 70px; color: #ff0066;" id="gradeIcon"></i>
										<label class="label" style="width: 100%;">별로예요</label>
									 </c:when>
									<c:when test="${ reviews['grade'] eq 2 }"> 
										<i class="fas fa-grin-beam-sweat" style="font-size: 70px; color: #ff0066;" id="gradeIcon"></i> 
										<label class="label" style="width: 100%;">아쉬워요</label>
									</c:when>
									<c:when test="${ reviews['grade'] eq 3 }"> 
										<i class="fas fa-grin-beam" style="font-size: 70px; color: #ff0066;" id="gradeIcon"></i>
										<label class="label" style="width: 100%;">가볼만해요</label> 
									</c:when>
									<c:when test="${ reviews['grade'] eq 4 }"> 
										<i class="fas fa-grin-squint" style="font-size: 70px; color: #ff0066;" id="gradeIcon"></i> 
										<label class="label" style="width: 100%;">꽤 가볼만 해요</label>
									</c:when>
									<c:when test="${ reviews['grade'] eq 5 }"> 
										<i class="fas fa-grin-hearts" style="font-size: 70px; color: #ff0066;" id="gradeIcon"></i> 
										<label class="label" style="width: 100%;">꼭 가봐야 해요!</label>
									</c:when>
								</c:choose>
							</div>
							<!-- text area -->
							<div class="field" style="width: 85%;">
										
								<div class="field is-horizontal">
									<div class="field-body">
										<label class="label" style="width: 80%;" > ${ reviews['userName'] } </label>
										<c:if test="${ loginUser.memberId eq reviews['memberId'] }">
											<div class="field" align="right">
												<a href="#" style="color: #666699;">수정</a> &nbsp; &nbsp;
												<a href="#" style="color: #666699;">삭제</a> 
											</div>
										</c:if>
									</div>
								</div>
								
					           <div class="control">
					             <textarea class="textarea" readonly> ${ reviews['reviewContent'] } </textarea>
					           </div>
					        </div> <!--  end text area -->					       
						</div> <!-- end field-body -->
					</div> <!-- end is-horizontal -->
				</div> 
			</c:forEach><!-- end review list -->
				
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
  	
  	function insertReview(){
  		if('${ loginUser}' != null && '${ loginUser}' != "" && '${ loginUser}' != " "){ //로그인 되어 있을 때
  			if($("#reviewContent").val() != null && $("#reviewContent").val() != "" && $("#reviewContent").val() != " "){
  				return true
  			} else {
  				alert("리뷰 내용을 입력해 주세요");
  				return false;
  			}
  		} else { //로그인 되지 않았을 때
  			alert("로그인 후 리뷰 등록이 가능합니다.");
  			return false;
  		}
  	} //end func
  	
  	$(function(){
  		$('.toggle.example .rating')
	  	  .rating({
	  	    initialRating: 2,
	  	    maxRating: 4
	  	  });
  		
  		$("#gradeOption").change(function(){
  			console.log($("#gradeOption option:selected").val());
  			var value = $("#gradeOption option:selected").val();
  			var classVar = "";
  			switch(value){
	  			case "1" : classVar = "fas fa-laugh"; break;
	  			case "2" : classVar = "fas fa-grin-beam-sweat"; break;
	  			case "3" : classVar = "fas fa-grin-beam"; break;
	  			case "4" : classVar = "fas fa-grin-squint"; break;
	  			case "5" : classVar = "fas fa-grin-hearts"; break;
  			} //end switch
  			
  			$("#gradeIcon").attr("class", classVar);
  			
  		});
  	});
  </script> <!-- end script -->
</body>
</html>