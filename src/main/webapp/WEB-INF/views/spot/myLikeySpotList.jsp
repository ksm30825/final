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
		
		<div class="column">
			<section class="section">
			      
	         <!-- 게시글 영역 -->
	         
			
	         </section>
        </div>
         
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