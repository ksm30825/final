<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TI - Schedule Editor</title>
</head>
<style>
	
	.panel-heading {
		background:#8e44ad;
		color:white;
	}
	.panel-tabs {
		overflow-x:auto;
	}
	.notification {
		background:#C6E4F3;
	}
	.tag.is-primary {
		color:white !important;
		text-decoration:none !important;
	}
	.dayMemo {
		width:60%;
	}
	.tag:hover {
		cursor:pointer;
	}
</style>
<body>
	<div class="columns">
		<div class="column">
			<section class="section">
				<div class="columns">
					<div class="column is-3">
						<nav class="panel">
							<div class="panel-heading" align="center" 
							style="background:whitesmoke;color:black;;height:30px">
								<p class="help">2019-07-01</p>
							</div>
							<div class="panel-heading columns" align="center" style="margin:0">
								<div class="column is-2" style="padding-left:0">
									<a class="button is-small dayLeftBtn">
										<span class="icon"> 
											<i class="fas fa-2x fa-caret-left"></i>
										</span>
									</a>
								</div>
								<div class="column is-8 dayTitle">
									<span>DAY 1</span>&nbsp;
									<input class="input dayMemo is-small" type="text" placeholder="MEMO"></div>
								<div class="column is-2" style="padding-right:0">
									<a class="button is-small dayRightBtn">
										<span class="icon"> 
											<i class="fas fa-2x fa-caret-right"></i>
										</span>
									</a>
								</div>
							</div>
							<!-- <label class="panel-block"><input type="checkbox">시간 보이기</label> -->
							<!-- <div class="panel-block"> -->
							<ul id="day1" class="connectedSortable menu-list">
								<li class="ui-state-default panel-block">
									<div class="media-left">
										<a class="button is-small is-rounded schInfoBtn">
											<i class="fas fa-info-circle"></i>
										</a>
									</div>
									<div class="media-content">
										<p>Item 1</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-left">
										<a class="button is-small is-rounded schInfoBtn">
											<i class="fas fa-info-circle"></i>
										</a>
									</div>
									<div class="media-content">
										<p>Item 2</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-left">
										<a class="button is-small is-rounded schInfoBtn">
											<i class="fas fa-info-circle"></i>
										</a>
									</div>
									<div class="media-content">
										<p>Item 3</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-left">
										<a class="button is-small is-rounded schInfoBtn">
											<i class="fas fa-info-circle"></i>
										</a>
									</div>
									<div class="media-content">
										<p>Item 4</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-left">
										<a class="button is-small is-rounded schInfoBtn">
											<i class="fas fa-info-circle"></i>
										</a>
									</div>
									<div class="media-content">
										<p>Item 5</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
							</ul>
							<ul id="day2" class="connectedSortable menu-list" style="display:none">
								<li class="ui-state-default panel-block">
									<div class="media-content">
										<p>2- Item 1</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-content">
										<p>2- Item 2</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-content">
										<p>2- Item 3</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-content">
										<p>2- Item 4</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-content">
										<p>2- Item 5</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
							</ul>
							<ul id="day3" class="connectedSortable menu-list" style="display:none">
								<li class="ui-state-default panel-block">
									<div class="media-content">
										<p>3- Item 1</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-content">
										<p>3- Item 2</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-content">
										<p>3- Item 3</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-content">
										<p>3- Item 4</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-content">
										<p>3- Item 5</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>	
									</div>
								</li>
							</ul>
							<div class="panel-block">
								<button class="button is-primary is-outlined is-fullwidth"
								onclick="$('#scheduleInfoModal').toggleClass('is-active')">
								일정 추가</button>
							</div>
						</nav>
					</div>				
					<div class="column is-3">
						<nav class="panel">
							<div class="panel-heading" align="center" 
								style="background:whitesmoke;color:black;height:30px">
								<p class="help"><i class="far fa-hand-point-up"></i>
								원하는 장소를 일정에 골라 넣어보세요</p>
							</div>
							<div class="tabs is-toggle placeTab" align="center" style="padding:0;margin:0">
								<ul>
									<li class="is-active" style="width:50%">
								    	<a>
								        	<span class="icon is-small"><i class="far fa-heart"></i></span>
								          	<span>좋아요장소</span>
								        </a>
								    </li>
								    <li style="width:50%">
								     	<a>
								          	<span class="icon is-small"><i class="fas fa-thumbs-up"></i></span>
								          	<span>추천장소</span>
								        </a>
								    </li>
								</ul>
							</div>
							<!-- <label class="panel-block"><input type="checkbox">선택</label> -->
							<ul id="likeList" class="connectedSortable menu-list">
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>좋아요 1</p>
									</div>
									<div class="media-right">
										<span class="icon"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>좋아요 2</p>
									</div>
									<div class="media-right">
										<span class="icon"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>좋아요 3</p>
									</div>
									<div class="media-right">
										<span class="icon"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>좋아요 4</p>
									</div>
									<div class="media-right">
										<span class="icon"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>좋아요 5</p>
									</div>
									<div class="media-right">
										<span class="icon"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
							</ul>
							
							<ul id="recommList" class="connectedSortable menu-list" style="display:none">
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>추천 1</p>
									</div>
									<div class="media-right">
										<span class="icon"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>추천 2</p>
									</div>
									<div class="media-right">
										<span class="icon"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>추천 3</p>
									</div>
									<div class="media-right">
										<span class="icon"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>추천 4</p>
									</div>
									<div class="media-right">
										<span class="icon"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>추천 5</p>
									</div>
									<div class="media-right">
										<span class="icon"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
							</ul>
							
							<div class="panel-block">
								<button class="button is-primary is-outlined is-fullwidth">모두 삭제</button>
							</div>
						</nav>
					</div>
					<div class="column is-6">
						<div style="border:1px solid gray; height:400px"></div>
					</div>
				</div>
			</section>			
			<section class="section">
				<div class="notification">
					<h4 class="title is-4">
						<i class="fas fa-tags"></i>여행테마 선택
					</h4>
					<div class="tags">
						<span class="tag is-white"> 혼자여행 </span> 
						<span class="tag is-white"> 가족여행 </span> 
						<span class="tag is-white"> 커플여행 </span> 
						<span class="tag is-white"> 먹방여행 </span> 
						<span class="tag is-white"> 휴양 </span> 
						<span class="tag is-white"> 밤도깨비 </span> 
					</div>
					<hr style="border:1px solid lightgray">
					<h6 class="title is-6">
						<i class="fas fa-hashtag"></i>내 여행 테마
					</h6>
					<div class="field is-grouped is-grouped-multiline" id="myTagArea">
						<!-- <div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Technology</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">CSS</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Flexbox</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Web Design</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Open Source</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Community</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Documentation</a> <a class="tag is-delete"></a>
							</div>
						</div> -->
					</div>
				</div>
			</section>
		</div>
	</div>
	
	<jsp:include page="scheduleInfoModal.jsp" />

	<script>
		$(function() {
			$("#day1, #day2, #day3").sortable();
			$("#likeList, #recommList").sortable({
				connectWith : "#day1"
			});
			
			$(".placeTab").find("li").click(function() {
				$(this).addClass("is-active");
				$(this).siblings().removeClass("is-active");
				var text = $(this).children().children().eq(1).text();
				if(text == '추천장소') {
					$("#recommList").show();
					$("#likeList").hide();
				}else {
					$("#likeList").show();
					$("#recommList").hide();
				}
			});
			
			$(".dayLeftBtn").click(function() {
				
				var day = $(".dayTitle").children("span").text();
				console.log(day);
				switch(day) {
				case 'DAY 2': $(".dayTitle").children("span").text('DAY 1');
								$("#day1").show();
								$("#day2, #day3").hide(); break;
				case 'DAY 3': $(".dayTitle").children("span").text('DAY 2');
								$("#day2").show();
								$("#day1, #day3").hide(); break;
				}
			});
			$(".dayRightBtn").click(function() {
				
				var day = $(".dayTitle").children("span").text();
				console.log(day);
				switch(day) {
				case 'DAY 1': $(".dayTitle").children("span").text('DAY 2');
								$("#day2").show();
								$("#day1, #day3").hide(); break;
				case 'DAY 2': $(".dayTitle").children("span").text('DAY 3');
								$("#day3").show();
								$("#day2, #day3").hide(); break;
				}
			});
			
			$(".schInfoBtn").click(function() {
				$('#scheduleInfoModal').toggleClass('is-active');
			});
			
			$(".tag.is-white").click(function() {
				$(this).removeClass('is-white').addClass('is-link');
				$("#myTagArea").append($('<div class="control"><div class="tags has-addons"><a class="tag is-primary">' 
						+ $(this).text() + '</a><a class="tag is-delete"></a></div></div>'));
				
			});
			$(".tag.is-link").click(function() {
				console.log('1');
				$(this).removeClass('is-link').addClass('is-white');
			});
		});
	</script>


</body>
</html>