<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<a class="button is-primary" onclick="travelLikey()">
							<span class="icon"><i class="far fa-star"></i></span>
				          	<span> &nbsp;좋아요 </span>
				        </a>
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
							<span>&nbsp; ${ tb.trvTitle }</span>
							<span id="bell" data-tooltip="이 글 신고하기"><i class="fas fa-bell" onclick="penalty()"></i></span>
						</h3>
						
						<h6 class="subtitle is-6">
							<i class="fas fa-map-marker-alt"></i>
							Australia / 시드니, 멜버른
							&nbsp;&nbsp;<span style="color:gray;"><strong>9박 10일</strong></span>
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
						<div class="buttons themaBtn">
      						<a class="button is-info is-rounded">#여행테마1</a>
    						</div>
    						<div class="buttons themaBtn">
      						<a class="button is-info is-rounded">#여행테마2</a>
   						</div>
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
				
				
				
		</div>
	</div>

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
	
	function travelLikey() {
		var num = "게시판 번호";
		var userId = "유저번호";
		
		$.ajax({
			url : "travelLikey.tb",
			data : {num : num, userId : userId},
			success : function(data) {
				alert("좋아요 하면 버튼 색 변경할 것");
			}
			
		});
	}
	
	function linkCopy() {
		alert("해당 글 링크 복사");
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
	
</script>
</body>
</html>