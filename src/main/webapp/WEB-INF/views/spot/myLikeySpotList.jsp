<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Interface</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
</head>

<style>
	.blurring {
		cursor: pointer;
	}
	.content {
		cursor: pointer;
	}
	#travelListArea {
      padding: 3rem 1.5rem;
      padding-top: 0;
   }
   .card {
      cursor: pointer;
      text-align: center;
   }
   #scrollArea {
   	width: 990px;
   	height: 400px;
	white-space:nowrap;
	overflow-x: auto;
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
					<li style="width: 100%;">
						<a>
						<span class="icon"><i class="fas fa-paper-plane"></i></span>
						<span>여행일정 좋아요</span>
						</a>
					</li>
					<li class="is-active" style="width: 100%;">
						<a>
						<span class="icon"><i class="fas fa-globe-americas"></i></span>
						<span>여행지 좋아요</span>
						</a>
					</li>
				</ul>
			</div>			
		</section>
		
		<!-- 본문 -->
		<!-- spot likey condition search -->
		<section class="section" style="padding-top:0;">
			<div class="field is-horizontal">
				<div class="field-body">				
					<!-- condition keyword -->
					<div class="field has-addons" style="justify-content: flex-end; padding-right: 20px;">
				      <p class="control">
				        <span class="select">
				          <select name="condition" id="condition">
				            <option value="name">국가</option>
				            <option value="email">도시</option>
				          </select>
				       </span>
				      </p>
				      <p class="control">
				        <input class="input" type="text" placeholder="Search Member" name="conditionValue" id="conditionValue">
				      </p>
				      <p class="control">
				        <a class="button" id="conditionBtn"><i class="fas fa-search"></i></a>
				      </p>
				    </div>
				</div><!-- end condition keyword -->
			</div> <!-- end spot likey condition search -->
			
			<!-- 리스트 반복문처리! -->
			<!-- city name area -->
			<div class="field is-horizontal">
				<div class="field-body">
					<i class="fas fa-map" style="color: purple; font-size: 30px; margin-right: 10px;"></i>
					<div class="field">
						<h3 class="title">도시명</h3>
					</div>
				</div>
			</div> <!-- end city name area -->
			
			<!-- list area -->
			<div class="field is-horizontal" id="scrollArea">
				<div class="field-body">
					<c:forEach var="j" begin="1" end="10" step="1">
						<div class="columns" style="width: 400px; height: 200px;">
							<div class="column">
								<div class="field">
									<div class="card">
								     <div class="card-image"> 
								       <figure class="image is-4by3" > <img src="resources/images/main.jpg" alt="Image"> </figure>
								     </div>
								     <div class="card-content">
								       <div class="media">
								         <div class="media-content">
								           <p class="is-4"><strong>명소명</strong></p>
								         </div>
								         <span class="tag is-primary is-medium"> 명소유형 </span>
								       </div>
								     </div>
								   </div> <!-- end cord -->
								</div> <!-- end field -->
							</div>
						</div>
					</c:forEach>
				</div> <!-- end field-body -->
			</div><!-- end list area -->
		</section>
         
      </div>   <!-- class="column" -->
   </div>   <!-- class="columns is-mobile" -->

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
	
	
	function myLikeyTravelCancel(trvId) {
		var answer = confirm("좋아요를 취소하시겠습니까?");
		
		if(answer) {
			$.ajax({
				url : "travelLikeyDelete.tb",
				data : {trvId : trvId, memberId : ${ loginUser.memberId } },
				success : function(data) {
					alert("좋아요 취소 처리");
					location.href="myLikeyTravelListView.tb";
				}
			})
		}
	}
	
	$(function() {
		var menu = $(".myPageMenu li").eq(2);
          menu.addClass('is-active');
          menu.siblings().removeClass('is-active');
	});
	
</script>

</body>
</html>