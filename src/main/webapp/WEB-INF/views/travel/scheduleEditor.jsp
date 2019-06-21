<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TI - Schedule Editor</title>
</head>
<style>
	.dayPanel {
		display:inline-block;
	}
	.panel-heading {
		background:#8e44ad;
		color:white;
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
	.tag:hover{
		cursor:pointer;
	}
	.schInfoBtn:hover, .backBtn:hover {
		cursor:pointer;
		color:#7AD9FC;
	}
	.overlay {
	  height: 100%;
	  width: 0;
	  position: fixed;
	  z-index: 10;
	  top: 0;
	  left: 0;
	  background-color: rgb(0,0,0);
	  background-color: rgba(0,0,0, 0.9);
	  overflow-x: auto;
	  transition: 0.9s;
	}
	.overlay-content {
	  position: relative;
	  top: 25%;
	  width: 100%;
	  text-align: center;
	  margin-top: 30px;
	}
	.overlay .closebtn {
	  position: absolute;
	  top: 100px;
	  right: 45px;
	  font-size: 60px;
	}
	@media screen and (max-height: 450px) {
	  .overlay a {font-size: 20px}
	  .overlay .closebtn {
	  font-size: 40px;
	  top: 15px;
	  right: 35px;
	  }
	}
	
</style>
<body>
	<div id="myNav" class="overlay">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<div class="overlay-content">
		
			<% for(int i = 0; i < 9; i++) { %>
			<nav class="panel dayPanel">
				<div class="panel-heading" align="center"
					style="background: whitesmoke; color: black;; height: 30px">
					<p class="help">2019-07-01</p>
				</div>
				<div class="panel-heading columns is-mobile" align="center"
					style="margin: 0">
					<div class="column is-2" style="padding-left: 0">
						<a class="button is-small dayLeftBtn"> 
							<span class="icon">
								<i class="fas fa-2x fa-caret-left"></i>
							</span>
						</a>
					</div>
					<div class="column is-8"
						style="padding-left: 0; padding-right: 0">
						<span>DAY 1</span>&nbsp; <input class="input dayMemo is-small"
							type="text" placeholder="MEMO">
					</div>
					<div class="column is-2" style="padding-right: 0">
						<a class="button is-small dayRightBtn"> 
							<span class="icon">
								<i class="fas fa-2x fa-caret-right"></i>
							</span>
						</a>
					</div>
				</div>
				<!-- <label class="panel-block"><input type="checkbox">시간 보이기</label> -->
				<ul class="connectedSortable menu-list">
					<li class="ui-state-default panel-block">
						<div class="media-left">
							<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
							</span>
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
							<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
							</span>
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
							<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
							</span>
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
							<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
							</span>
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
							<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
							</span>
						</div>
						<div class="media-content">
							<p>Item 5</p>
						</div>
						<div class="media-right">
							<button class="delete" aria-label="close"></button>
						</div>
					</li>
				</ul>
				<ul class="connectedSortable menu-list"
					style="display: none">
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
				<ul class="connectedSortable menu-list"
					style="display: none">
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
			<% } %>
			
		</div>
	</div>



	<!-- ------------------------------------------------------------- -->
	<div class="columns">
		<div class="column">
			<section class="section">
				<div class="columns">
					<div class="column is-3">
						<div style="height:50px">
							<span style="font-size:20px;cursor:pointer" onclick="openNav()">&#9776; 일정 펼쳐보기</span>
						</div>
						<nav class="panel">
							<div class="panel-heading" align="center" 
							style="background:whitesmoke;color:black;;height:30px">
								<p class="help">2019-07-01</p>
							</div>
							<div class="panel-heading columns is-mobile" align="center" style="margin:0">
								<div class="column is-2" style="padding-left:0">
									<a class="button is-small dayLeftBtn">
										<span class="icon"> 
											<i class="fas fa-2x fa-caret-left"></i>
										</span>
									</a>
								</div>
								<div class="column is-8 dayTitle"  style="padding-left:0; padding-right:0">
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
										<span class="icon schInfoBtn">
											<i class="fas fa-edit"></i>
										</span>
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
										<span class="icon schInfoBtn">
											<i class="fas fa-edit"></i>
										</span>
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
										<span class="icon schInfoBtn">
											<i class="fas fa-edit"></i>
										</span>
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
										<span class="icon schInfoBtn">
											<i class="fas fa-edit"></i>
										</span>
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
										<span class="icon schInfoBtn">
											<i class="fas fa-edit"></i>
										</span>
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
						<div style="height:50px;"></div>
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
										<span class="icon backBtn1"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>좋아요 2</p>
									</div>
									<div class="media-right">
										<span class="icon backBtn1"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>좋아요 3</p>
									</div>
									<div class="media-right">
										<span class="icon backBtn1"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>좋아요 4</p>
									</div>
									<div class="media-right">
										<span class="icon backBtn1"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>좋아요 5</p>
									</div>
									<div class="media-right">
										<span class="icon backBtn1"><i class="fas fa-reply"></i></span>	
									</div>
								</li>
							</ul>
							
							<ul id="recommList" class="connectedSortable menu-list" style="display:none">
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>추천 1</p>
									</div>
									<div class="media-right">
										<span class="icon backBtn2"><i class="fas fa-reply"></i></span>
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>추천 2</p>
									</div>
									<div class="media-right">
										<span class="icon backBtn2"><i class="fas fa-reply"></i></span>
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>추천 3</p>
									</div>
									<div class="media-right">
										<span class="icon backBtn2"><i class="fas fa-reply"></i></span>
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>추천 4</p>
									</div>
									<div class="media-right">
										<span class="icon backBtn2"><i class="fas fa-reply"></i></span>
									</div>
								</li>
								<li class="ui-state-highlight panel-block">
									<div class="media-content">
										<p>추천 5</p>
									</div>
									<div class="media-right">
										<span class="icon backBtn2"><i class="fas fa-reply"></i></span>
									</div>
								</li>
							</ul>
							
							<div class="panel-block">
								<button class="button is-primary is-outlined is-fullwidth">모두 삭제</button>
							</div>
						</nav>
					</div>
					<div class="column is-6">
						<div class="field">
							<p class="control">
								<input class="input is-info" type="text" placeholder="지도에서 장소검색" id="searchInput">
							</p>
						</div>
						<div style="border:1px solid gray; height:400px">
							<div id="map" style="height:100%"></div>
						</div>
					</div>
				</div>
			</section>			
			<section class="section">
				<div class="notification">
					<h4 class="title is-4">
						<i class="fas fa-tags"></i>여행테마 선택
					</h4>
					<div class="tags">
						<span class="tag is-white themes"> 혼자여행 </span> 
						<span class="tag is-white themes"> 가족여행 </span> 
						<span class="tag is-white themes"> 커플여행 </span> 
						<span class="tag is-white themes"> 먹방여행 </span> 
						<span class="tag is-white themes"> 휴양 </span> 
						<span class="tag is-white themes"> 밤도깨비 </span> 
					</div>
					<hr style="border:1px solid lightgray">
					<h6 class="title is-6">
						<i class="fas fa-hashtag"></i>내 여행 테마
					</h6>
					<div class="field is-grouped is-grouped-multiline" id="myTagArea">
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
			
			$(".themes").click(function() {
				var text = $(this).text();
				if($(this).is(".is-white")) {
					$(this).removeClass('is-white').addClass('is-link');
					$("#myTagArea").append($('<div class="control"><div class="tags has-addons"><a class="tag is-primary">' 
							+ $(this).text() + '</a><a class="tag is-delete tagDelete"></a></div></div>'));
					
					$(".tagDelete").click(function() {
						console.log("1");
						var text = $(this).prev().text();
						$(this).parent().parent().remove();
						$(".themes").each(function() {
							if($(this).text() == text) {
								$(this).addClass('is-white').removeClass('is-link');
							}
						});
					});
					
				}else {
					$(this).addClass('is-white').removeClass('is-link');
					$("#myTagArea .tags.has-addons").each(function() {
						if($(this).children("a").text() == text) {
							$(this).parent().remove();
						}
					});
				}
			});
			$(".backBtn1").click(function() {
				if(!$(this).parents("ul").is("#likeList")) {
					$(this).parents("li").appendTo($("#likeList"));
				}
			});
			$(".backBtn2").click(function() {
				if(!$(this).parents("ul").is("#recommList")) {
					$(this).parents("li").appendTo($("#recommList"));
				}
			});
			$(".delete").click(function() {
				$(this).parents("li").remove();
			});

		});
		
		
		function openNav() {
			document.getElementById("myNav").style.width = "100%";
		}
		function closeNav() {
			document.getElementById("myNav").style.width = "0%";
		}
	</script>


</body>
</html>