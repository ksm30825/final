<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bulmaswatch.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/semantic.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.theme.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.structure.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/semantic.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<style>
	body {
		overflow-x:visible !important;
	}
	.navbar-item img {
    	max-height: 100% !important;
   	}
	.navbar-burger {
		width:200px !important;
	}
</style>

</head>
<body>
	<nav class="navbar is-white is-fixed-top" style="border-bottom:1px solid skyblue">
    	<div class="navbar-brand">
    		<div class="navbar-item field is-grouped" style="margin:0">
         		<p class="control">
         			<a class="icon is-rounded is-large" onclick="goToMyTravel();"> 
                        <i class="fas fa-3x fa-chevron-circle-left"></i>
                    </a>
            	</p>
            	<p class="control">
                    <a class="button is-rounded" onclick="$('#travelInfoModal').toggleClass('is-active')"> 
                        <i class="fas fa-info-circle"></i>
                        <span>여행정보수정</span>
                    </a>
                </p>
                <p class="control">
                    <a class="button is-info is-rounded" href="#"> 
                        <span>작성완료</span>
                    </a>
                </p>
                <p class="control">
                    <a class="button is-dark is-rounded" href="#"> 
                        <span>삭제하기</span>
                    </a>
                </p>
            </div>
         	<div class="navbar-burger burger is-hidden-tablet">
		        <!-- <a class="button is-primary is-rounded" href="#"> 
                    <i class="fas fa-users"></i>
                </a> -->
		    	<a class="navbar-item" href="index.jsp"> 
		            <img src="resources/images/logoWide.png" width="120px" height="40px">
		        </a>
         	</div> 
		</div>
      	<div id="mainNav" class="navbar-menu">
         	<div class="navbar-start">
			</div>
        	<div class="navbar-end">
        		<!-- <div class="navbar-item field" style="margin:0" data-tooltip="동행초대" data-position="left center">
	         		<p class="control">
	         			<a class="button is-primary is-rounded">
	                        <i class="fas fa-users"></i><br>
	                    </a>
	            	</p>
	            </div> --> 
            	<div class="navbar-brand">
		        	<a class="navbar-item" href="index.jsp"> 
		            	<img src="resources/images/logoWide.png" width="120px" height="40px">
		         	</a>
		        </div>
			</div>
		</div>
	</nav>
	
	<br><br>
	<div class="coumns">
		<div class="column">
			<section class="section" style="padding-bottom:0;">
				<div class="columns">
					<div class="column">
						<h3 class="title is-3">
							<span class="icon" style="color:skyblue">
								<i class="fas fa-plane"></i>
							</span>
							여자혼자 시드니, 멜버른 자유여행
						</h3>
						<h6 class="subtitle is-6">
							<i class="fas fa-map-marker-alt"></i>
							호주/ 시드니, 멜버른
							&nbsp;&nbsp;<span style="color:gray;"><strong>9박 10일</strong></span>
						</h6>
					</div>
					<div class="column" style="line-height:50px;">
						<div class="tabs is-right editorMenu">
						    <ul>
						    	<li>
						    		<div class="navbar-item field" style="margin:0" data-tooltip="동행초대" 
						    		data-variation="mini" data-position="right center">
						         		<p class="control">
						         			<a class="button is-primary is-rounded" style="width:40px">
						                        <i class="fas fa-users"></i><br>
						                    </a>
						            	</p>
						            </div>
						    	</li>
						    	<li class="is-active" >
						        	<a><strong>일정작성</strong></a>
						      	</li> 
						      	<li >
						        	<a><strong>상세글작성</strong></a>
						      	</li>
						      	<li >
						        	<a><strong>일정전체보기</strong></a>
						      	</li>
						      	<li >
						        	<a><strong>가계부</strong></a>
						      	</li>
						    </ul>
						</div>
					</div>
				</div>			
			</section>
		</div>
	</div>
	<div>
		<div id="scheduleEditor">
			<jsp:include page="scheduleEditor.jsp" />
		</div>
		<div id="detailEditor" style="display:none">
			<jsp:include page="detailEditor.jsp" />
		</div>
		<div id="allSchedule" style="display:none; overflow-x:auto">
			<jsp:include page="allSchedule.jsp" />
		</div>
		<div id="costEditor" style="display:none">
			<jsp:include page="costEditor.jsp" />
		</div>
	</div>


	<jsp:include page="travelInfoModal.jsp" />
	<script>
		$(function() {
			$(".editorMenu").tab();
		});
		$(".editorMenu li").click(function() {
			$(this).addClass('is-active');
			$(this).siblings().removeClass('is-active');
			var menu = $(this).children().children().text();
			switch(menu) {
			case '일정작성' : $("#scheduleEditor").show();
							$("#scheduleEditor").siblings().hide(); break;
			case '상세글작성' : $("#detailEditor").show();
							$("#detailEditor").siblings().hide(); break;
			case '일정전체보기' : $("#allSchedule").show();
							$("#allSchedule").siblings().hide(); break;
			case '가계부' : $("#costEditor").show();
							$("#costEditor").siblings().hide(); break;
			}
		});
		function goToMyTravel() {
			location.href="showMyTravel.trv";
		}
	</script>
</body>
</html>