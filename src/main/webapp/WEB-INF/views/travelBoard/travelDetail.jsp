<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#bell:hover {
		color: red;
		cursor: pointer;
	}
	.title.thema {
		padding-bottom: 0.7em;
	}
	.buttons.themaBtn {
		display: inline;
		padding-left: 1em;
	}
	.dayTitle span {
		color: rgb(52, 73, 94);
	}
	.description {
		background: rgb(52, 73, 94);
		color: white;
		padding: 1em;
	}
</style>
</head>
<body>
	<jsp:include page="travelSearchBar.jsp" />
	
	
	<div class="coumns">
		<div class="column">
		
			<!-- 버튼영역 -->
			<section class="section" style="padding-top:0; padding-bottom:0;">
				<div class="columns">
				
					<div class="column" id="btnArea" align="right">
						<c:choose>
							<c:when test="${ !empty loginUser }">
								<c:choose>
									<c:when test="${ detailTb.buyStatus eq 'N' }">
										<a class="button is-primary" onclick="travelBuy()">
											<span class="icon" id="starIcon"><i class="fas fa-shopping-cart"></i></span>
								          	<span> &nbsp;일정구매 </span>
					        			</a>
					        			&nbsp;
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${ detailTb.likeyStatus eq 'N' }">
										<a class="button is-primary" onclick="travelLikeyInsert()">
											<span class="icon" id="starIcon"><i class="far fa-star"></i></span>
								          	<span> &nbsp;좋아요 </span>
					        			</a>
									</c:when>
									<c:when test="${ detailTb.likeyStatus eq 'Y' }">
										<a class="button is-primary" onclick="travelLikeyDelete()">
											<span class="icon" id="starIcon"><i class="fas fa-star"></i></span>
								          	<span> &nbsp;좋아요 </span>
						        		</a>
									</c:when>
								</c:choose>
							</c:when>
							
							<c:otherwise>
								<a class="button is-primary" onclick="loginInfo()">
									<span class="icon" id="starIcon"><i class="far fa-star"></i></span>
						          	<span> &nbsp;일정구매 </span>
				        		</a>
				        		&nbsp;
								<a class="button is-dark" onclick="loginInfo()">
									<span class="icon"><i class="far fa-star"></i></span>
						          	<span> &nbsp;좋아요 </span>
				        		</a>
							</c:otherwise>
						</c:choose>
						
						&nbsp;
						
						<a class="button is-primary" onclick="linkCopy()">
							<span class="icon"><i class="fas fa-share-alt"></i></span>
				          	<span> &nbsp;링크공유 </span>
				        </a>
					</div>
					
				</div>
			</section>
			
			 <!-- 상단 타이틀 -->
			<section class="section" style="padding-bottom:0;">
				<div class="columns">
					<div class="column" id="title">
						<h3 class="title is-3">
							<span class="icon" style="color:skyblue">
								<i class="fas fa-plane"></i>
							</span>
							<span>&nbsp; ${ detailTb.trvTitle }</span>
							<span id="bell" data-tooltip="이 글 신고하기"><i class="fas fa-bell" onclick="penalty()"></i></span>
						</h3>
						
						<h6 class="subtitle is-6">
							<i class="fas fa-map-marker-alt"></i>
							<c:choose>
								
								<c:when test="${ fn:length(detailTb.trvCities) > 0 }">
									<c:forEach var="trvCities" items="${ detailTb.trvCities }" varStatus="st">
										<span>${ trvCities.countryNameKo } ${ trvCities.cityNameKo }</span>
										<c:if test="${ st.count ne fn:length(detailTb.trvCities) }">&nbsp;/&nbsp;</c:if>
									</c:forEach>
								</c:when>
							</c:choose>
							<fmt:parseDate var="startDate" value="${ detailTb.startDate }" pattern="yyyy-MM-dd" />
							<fmt:parseNumber value="${ startDate.time / (1000*60*60*24) }" integerOnly="true" var="startDay" />
							<fmt:parseDate var="endDate" value="${ detailTb.endDate }" pattern="yyyy-MM-dd" />
							<fmt:parseNumber value="${ endDate.time / (1000*60*60*24) }" integerOnly="true" var="endDay" />
							&nbsp;&nbsp;<span style="color:gray;"><strong>${ endDay - startDay }박 ${ endDay - startDay + 1 }일</strong></span>
						</h6>
					</div>
				</div>
			</section>	<!-- 상단 타이틀 -->
			
			<!-- 서브메뉴바 -->
			<section class="section" style="padding-top:0;">
				<div class="columns">
					<div class="column" id="title">
						<jsp:include page="travelDetailSubNav.jsp" />
					</div>
				</div>
			</section>	<!-- 서브메뉴바 -->
			
			<!-- 여행테마 영역 -->
			<section class="section" style="background: #C6E4F3; padding: 2em;">
				<ul id="travelThemaTag">
					<li><p class="title thema"><i class="fas fa-tags"></i> 여행테마</p></li>
					<li>
						<c:choose>
							<c:when test="${ fn:length(detailTb.trvTags) > 0 }">
								<c:forEach var="trvTags" items="${ detailTb.trvTags }" varStatus="st">
									<div class="buttons themaBtn">
			     						<a class="button is-info is-rounded">#${ trvTags.tagName }</a>
			   						</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<p>여행태그 없음</p>
							</c:otherwise>
						</c:choose>
						
   						
					</li>
				</ul>
			</section>
			
			<!-- 상세일정 영역 -->
			<div class="columns">
			
				<!-- 상세일정 메뉴바 영역 -->
				<div class="column is-3">
					<section class="section" style="padding-left: 0px;">
						<aside class="menu">
							<p class="menu-label">일자별 상세글</p>
							<ul class="menu-list">
								<li><a class="is-active" href="#day1"><strong>DAY 1</strong></a></li>
								<li><a><strong>DAY 2</strong></a></li>
								<li><a><strong>DAY 3</strong></a></li>
								<li><a><strong>DAY 4</strong></a></li>
								<li><a><strong>DAY 5</strong></a></li>
								<li><a><strong>DAY 6</strong></a></li>
							</ul>
							<p class="menu-label">사진 갤러리</p>
							<ul class="menu-list">
								<li><a>전체보기</a></li>
								<li><a>일자별 모아보기</a>
									<ul>
										<li><a onclick='window.open("about:blank").location.href="travelDetailGallery.tb?num="+"상세일정정보"'>DAY 1</a></li>
										<li><a>DAY 2</a></li>
										<li><a>DAY 3</a></li>
										<li><a>DAY 4</a></li>
										<li><a>DAY 5</a></li>
										<li><a>DAY 6</a></li>
									</ul>
								</li>
							</ul>
						</aside>
					</section>
				</div>	<!-- <div class="column is-3"> -->
				
		<!-- 상세일정 본문 영역 -->
		<div class="column is-9" >
		
		<section class="section" style="margin-top :3.15em;">
						
			<div class="ui divided items">
		
			<!-- 날짜별 타이틀 -->
			<div id="day1" class="dayTitle" style="padding-bottom: 0.5em;">
				<span class="title is-3">DAY 1</span>&nbsp; <span>2019년 00월 00일 (화)</span>
				<p class="city">도시명, 도시명</p>
			</div>
		
			<!-- 날짜별 상세 내용(장소분류) -->
			<div class="item">
				<div class="image" data-tooltip="여행사진보기" onclick='window.open("about:blank").location.href="travelDetailGallery.tb?num="+"상세일정정보"'>
					<img src="resources/images/sample1.jpg">
				</div>
				
				<div class="content">
					<a class="header">1&nbsp; 장소명</a><span>&nbsp; 장소분류</span>
					<div class="meta">
						<span class="cinema">
						본문내용본문내용본문내용본문내용본문내용본문내용본문내용본문내용<br>
						본문내용본문내용본문내용본문내용본문내용본문내용본문내용본문내용<br>
						본문내용본문내용본문내용본문내용본문내용본문내용본문내용본문내용<br>
						본문내용본문내용본문내용본문내용본문내용본문내용본문내용본문내용<br>
						본문내용본문내용본문내용본문내용본문내용본문내용본문내용본문내용<br>
						</span>
					</div>
					
					<div class="extra">
						<div class="ui label" data-tooltip="여행지 정보 보기"><i class="fas fa-info-circle"></i></div>
						<div class="ui label" data-tooltip="지도 위치 보기"><i class="fas fa-map-marker-alt"></i></div>
					</div>
				</div>	<!-- <div class="content"> -->
			</div>	<!-- <div class="item"> -->
			
			<!-- 교통 상세내용 -->
			<div class="description">
				<p><i class="fas fa-ellipsis-h"></i>&nbsp;&nbsp; 0.00km  |  이동수단  |  00시간 00분 소요  |  $ 0.00  /  ￦ 00000</p>
			</div>
			
			<!-- 날짜별 상세 내용(장소분류) -->
			<div class="item">
				<div class="image" data-tooltip="여행사진보기" onclick='window.open("about:blank").location.href="travelDetailGallery.tb?num="+"상세일정정보"'>
					<img src="resources/images/sample1.jpg">
				</div>
				
				<div class="content">
					<a class="header">2&nbsp; 장소명</a><span>&nbsp; 장소분류</span>
					<div class="meta">
						<span class="cinema">
						본문내용본문내용본문내용본문내용본문내용본문내용본문내용본문내용<br>
						본문내용본문내용본문내용본문내용본문내용본문내용본문내용본문내용<br>
						본문내용본문내용본문내용본문내용본문내용본문내용본문내용본문내용<br>
						본문내용본문내용본문내용본문내용본문내용본문내용본문내용본문내용<br>
						본문내용본문내용본문내용본문내용본문내용본문내용본문내용본문내용<br>
						</span>
					</div>
					
					<div class="extra">
						<div class="ui label" data-tooltip="여행지 정보 보기"><i class="fas fa-info-circle"></i></div>
						<div class="ui label" data-tooltip="지도 위치 보기"><i class="fas fa-map-marker-alt"></i></div>
					</div>
				</div>
			</div>	<!-- <div class="item"> -->
			
		</div>

		</section>
		
		</div>	<!-- class="column is-9" -->
		
	</div>	<!-- <div class="columns"> -->
			
			<c:choose>
				<c:when test="${ loginUser.memberId eq detailTb.memberId }">
					<section class="section" align="center">
						<div class="columns">
							<div class="column">
								<a class="button is-primary" href="travelList.tb">
									<span class="icon"><i class="fas fa-list"></i></span>
						          	<span> &nbsp;목록으로 </span>
				        		</a>
				        		&nbsp;
				        		<a class="button is-primary" onclick="location.href='selectTravel.trv?trvId=${ detailTb.trvId }'">
									<span class="icon"><i class="fas fa-pen"></i></span>
						          	<span> &nbsp;수정하기 </span>
				        		</a>
				        		&nbsp;
				        		<a class="button is-primary" onclick="travelDelete()">
									<span class="icon"><i class="fas fa-times"></i></span>
						          	<span> &nbsp;삭제하기 </span>
				        		</a>
							</div>
						</div>
					</section>
				</c:when>
			</c:choose>
			<c:if test="${ !empty loginUser }">
			
		</c:if>	
				
		</div>
	</div>
	
	<!-- 일정만들기 안내 모달 -->
	<section class="section" id="modal">
		<div class="modal" id="travelDeleteModal">
		    <div class="modal-background"></div>
		    <div class="modal-card">
		    
				<header class="modal-card-head">
					<p class="modal-card-title"><i class="fas fa-exclamation-triangle"></i>&nbsp;일정 삭제 안내</p>
					<button class="cancel delete"></button>
				</header>
			
				<section class="modal-card-body" align="center">
					
					<p>
						작성하신 일정글을 삭제할 경우 복구할 수 없습니다.<br>
						삭제하시겠습니까?
					</p>
				</section>
			
				<footer class="modal-card-foot" style="justify-content: center">
					<a class="button is-primary" id="travelDelete">일정삭제</a>
					<a class="button cancel">닫기</a>
				</footer>
			
		    </div>
		</div>
	</section>
	
	<!-- 일정구매 안내 모달 -->
	<section class="section" id="travelBuySection">
		<div class="modal" id="travelBuyModal">
		    <div class="modal-background"></div>
		    <div class="modal-card">
		    
				<header class="modal-card-head">
					<p class="modal-card-title"><i class="fas fa-exclamation-triangle"></i>&nbsp;일정 구매 안내</p>
					<button class="cancel delete"></button>
				</header>
			
				<section class="modal-card-body" align="center">
					
					<p>
						해당 일정글을 구매하시겠습니까?<br>
						현재 보유 포인트 : ${ loginUser.userPoint }P <br>
						일정 결제 포인트 : ${ (endDay - startDay + 1) * 100 }P
					</p>
					<hr style="border: 1px solid lightgray;">
					<p>
						결제 후 잔액 포인트 : ${ loginUser.userPoint - ((endDay - startDay + 1) * 100) }P
					</p>
				</section>
			
				<footer class="modal-card-foot" style="justify-content: center">
					<a class="button is-primary" id="travelBuy">일정구매</a>
					<a class="button cancel">닫기</a>
				</footer>
			
		    </div>
		</div>
	</section>

<script>
	function penalty() {
		var answer = confirm("이 글을 신고하시겠습니까?");
		
		if(answer) {
			var num = "게시판 번호";
			
			$.ajax({
				url : "insertPenalty.pe",
				data : {type : "일정", num : num, reason : "사유", page : "현재 페이지 정보"},
				success : function(data) {
					alert("해당 글을 신고하였습니다.");
				}
			});
		}
	}
	
	function travelLikeyInsert() {
		var trvId = ${ detailTb.trvId };
		var memberId = ${ loginUser.memberId };
		
		console.log("trvId : " + trvId);
		console.log("memberId : " + memberId);
		
		$.ajax({
			url : "travelLikeyInsert.tb",
			data : {trvId : trvId, memberId : memberId},
			success : function(data) {
				
				alert("해당 일정 좋아요 추가");
				
				location.href="travelDetailForm.tb?trvId=" + trvId;
			},
			error:function(data) {
    			alert("서버 전송실패");
    		}
		});
	}
	
	function travelLikeyDelete() {
		var trvId = ${ detailTb.trvId };
		var memberId = ${ loginUser.memberId };
		
		$.ajax({
			url : "travelLikeyDelete.tb",
			data : {trvId : trvId, memberId : memberId},
			success : function(data) {
				
				alert("해당 일정 좋아요 삭제");
				
				location.href="travelDetailForm.tb?trvId=" + trvId;
				
			},
			error:function(data) {
    			alert("서버 전송실패");
    		}
		});
	}
	
	function linkCopy() {
	    alert("현재 주소 복사하기");
	}
	
	$(".photo").click(function() {
		
		$.ajax({
			url : "selectGallery.tb",
			data : {},
			success : function() {
				alert("갤러리 모달창 띄우기");
			}
		});
	});
	
	$(".place").click(function() {
		alert("여행지 정보로 연결");
	});
	
	function loginInfo() {
		alert("로그인이 필요한 서비스입니다.");
	}
	
	function travelDelete() {
		
		$('#travelDeleteModal').toggleClass('is-active').removeAttr('style');
		
		$("#travelDelete").click(function() {
			alert("해당 일정 삭제");
			location.href="travelDelete.tb?trvId=" + ${ detailTb.trvId };
		})
		
		$(".cancel").click(function(){
			$('#travelDeleteModal').removeClass('is-active');
	    });
	}
	
	function travelBuy() {
		
		$("#travelBuyModal").toggleClass('is-active').removeAttr('style');
		
		$("#travelBuy").click(function() {
			
			var memberId = ${ loginUser.memberId };
			var code = ${ detailTb.trvId };
			var userPoint = ${ loginUser.userPoint };
			var payment = ${ (endDay - startDay + 1) * 100 };
			
			if((userPoint - payment) > 0) {
				
				alert("해당 일정을 구매하였습니다.");
				
				location.href="usePoint.po?memberId=" + memberId + "&code=" + code + "&useType=10&uPoint=" + payment;
				
			}else {
				var answer = confirm("잔여 포인트가 부족합니다. 포인트를 충전하시겠습니까?");
				
				if(answer) {
					location.href='toPayView.po';
				}
			}
			
		});
		
		$(".cancel").click(function(){
			$('#travelDeleteModal').removeClass('is-active');
	    });
	}
	
</script>
</body>
</html>