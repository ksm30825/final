<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.breadcrumb li a {
		color:#A276FF;
	}
	.breadcrumb li a:hover {
		color:#C6ACFE;
	}
	.breadcrumb li.is-active a {
		color:black;
		font-weight:bold;
	}
	.column .columns {
		margin:0 !important;
	}
	.small-title {
		color: rgb(137, 100, 179);
		font-weight: bold;
		font-size: 1.3em;
	}
	
	#bell:hover {
		color: red;
		cursor: pointer;
	}
	.button.is-primary {
		border-radius: 10px;
		margin-left: 1em;
	}
	#detailTitle {
		display: flex;
	}
	.container-left {
		flex: 3;
	}
	.container-right {
		text-align: right;
	}
	#countryTitle {
		color: rgb(137, 100, 179);
		font-weight: bold;
		font-size: 1.2em;
	}
	#dayTitle {
		font-size: 1.2em;
		color: black;
		font-weight: bold;
	}
	.subMenu {
		display: inline-block;
	}
	#detailSub .tabs.is-boxed a{
		font-size: 1.2em;
	}
	.tabs.is-boxed li.is-active a {
		background: rgb(103, 171, 214) !important;
	}
	.is-active a span {
		color: white;
		font-weight: bold;
	}
	

	
	#travelThema {
		background: lightgray;
		padding: 1.5em;
	}
	.title.thema {
		padding-bottom: 0.7em;
	}
	.buttons.themaBtn {
		display: inline;
		padding-left: 1em;
	}
	
	.dayTable {
		width: 100%;
		display: table;
		border: 1px solid lightgray;
	}
	.day {
		background: rgb(52, 73, 94);
		border: 1px solid rgb(52, 73, 94);
		color: white;
		width: 15%;
		vertical-align: middle;
	}
	.dayDetail {
		padding-left: 1em;
		border: 1px solid lightgray;
	}
	.city {
		font-size: 1.6em;
	}
	.number {
		background: rgb(103, 171, 214) !important;
		color: white;
		margin-left: 40%;
	}
	.dayNumber {
		vertical-align: middle;
		align-items: center;
	}
	.photo {
		width: 150px;
		height: 150px;
		background: red;
		margin-top: 1em;
		margin-bottom: 1em;
		margin-right: 1em;
	}
	.title.is-5{
		margin-top: 1em;
	}
	.markerArea {
		float: right;
		margin: 1em;
	}
	.markerArea .subtitle.is-1 {
		padding-left: 1em;
	}
	.traffic {
		background: rgb(178, 214, 237);
	}
	.traffic td {
		padding: 1em;
		vertical-align: middle;
	}
	.button.is-white, .button.is-dark {
		border-radius: 10px;
		margin-left: 1em;
		margin-right: 1em;
	}
	#paymentInfo {
		background: rgb(178, 214, 237);
		padding: 2.5em;
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="travelSearchBar.jsp" />
	
	<div class="columns is-mobile">
		<div class="column">
			
			<!-- 타이틀 부분 -->
			<section class="section" id="headerSection">
				<div class="container" id="detailTitle">
					<div class="container-left">
					<span class="title">[여행스타일] 국가 - 도시 TITLE &nbsp;<i class="fas fa-bell" id="bell" onclick="penalty()"></i></span>
					</div>
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
				<div class="container">
					<span id="countryTitle"><i class="fas fa-map-marker-alt"></i> &nbsp;Australia / 시드니, 멜버른</span><span id="dayTitle">&nbsp;&nbsp;9박 10일</span>
				</div>
			</section>
			
			<jsp:include page="travelDetailSubNav.jsp" />
			
			
			<!-- 여행테마 영역 -->
			<section class="section">
				<div class="container" id="travelThema">
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
				</div>
			</section>
			
			<!-- 여행 상세일정 -->
			<section class="section">
				<div class="container" id="travelDetail">
					<table class="dayTable">
						<tr>
							<th class="day"><p align="center">DAY 1</p></th>
							<th class="dayDetail" colspan="3">2019년 00월 00일 (월)<br><span class="city">도시명, 도시명</span></th>
						</tr>
						
						<tr>
							<td rowspan="2" class="dayNumber">
								<div class="number">1</div>
							</td>
							<td rowspan="2" colspan="1" style="width: 20%;">
								<div class="photo"></div>
							</td>
							<td rowspan="1">
								<p class="title is-5">장소명</p>
								<p class="title is-6">장소분류</p>
							</td>
							<td rowspan="1" colspan="1" class="markerArea">
								<a class="subtitle is-1"><i class="fas fa-info-circle"></i></a>
								<a class="subtitle is-1"><i class="fas fa-map-marker-alt"></i></a>
							</td>
						</tr>
						<tr>
							<td colspan="2" rowspan="1">
								<span>본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문 본문</span>
							</td>
						</tr>
						<tr class="traffic">
							<td><p class="title is-3" align="center"><i class="fas fa-ellipsis-h"></i></p></td>
							<td colspan="3">
								<p>0.00km  |  이동수단  |  00시간 00분 소요  |  $ 0.00  /  ￦ 00000</p>
							</td>
						</tr>
					</table>
				</div>
			</section>
			
			<hr>
			
			<!-- 결제안내 -->
			<section class="section">
				<div class="container" id="paymentInfo">
					<p>이 일정의 더 자세한 내용이 보고 싶으세요?</p>
					<p class="title is-4">[ 1000P ]</p>
					<div id="btnArea">
						<a class="button is-white">결제하기</a>
						<a class="button is-dark" style="color: white;" onclick="location.href='travelList.tr'">목록으로</a>
					</div>
				</div>
			</section>
		</div> <!-- class="column" -->
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
			url : "travelLikey.tr",
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
			url : "selectGallery.tr",
			data : {},
			success : function() {
				alert("갤러리 모달창 띄우기");
			}
		});
	});
	
</script>
</body>
</html>