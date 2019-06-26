<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bulmaswatch.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/semantic.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.theme.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.structure.min.css">
<link rel="stylesheet" href="resources/css/travel/map-icons.css">
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
	<%-- <c:set var="trv" value="${ sessionScopetrv }" /> --%>
	<nav class="navbar is-white is-fixed-top" style="border-bottom:1px solid skyblue">
    	<div class="navbar-brand">
    		<div class="navbar-item field is-grouped" style="margin:0">
         		<p class="control">
         			<a class="icon is-rounded is-large" onclick="goToMyTravel();"> 
                        <i class="fas fa-3x fa-chevron-circle-left"></i>
                    </a>
            	</p>
            	<p class="control">
                    <a class="button is-rounded" onclick="showTrvInfoModal();"> 
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
					<div class="column is-6">
						<h3 class="title is-3">
							<span class="icon" style="color:skyblue">
								<i class="fas fa-plane"></i>
							</span>&nbsp;&nbsp;
							<c:out value="${ trv.trvTitle }" />
						</h3>
						<h6 class="subtitle is-6" style="margin:0">
							<i class="fas fa-map-marker-alt"></i>
							<c:forEach var="trvCity" items="${ trvCityList }" varStatus="st">
								${ trvCity.countryNameKo }&nbsp; ${ trvCity.cityNameKo } 
								<c:if test="${ st.count ne trvCityList.size() }">/</c:if>&nbsp;
							</c:forEach>
							<c:set var="days" value="${ ((trv.endDate.getTime() - trv.startDate.getTime()) / (1000 * 60 * 60 * 24)) }"/>
							&nbsp;&nbsp;
							<span><strong>
								(<fmt:formatNumber value="${ days }" pattern="#" />박 
								<fmt:formatNumber value="${ days + 1 }" pattern="#" />일)</strong></span>
							 <%-- <% ${ days } %> --%>
						</h6>
						<p class="help">
							<c:forEach var="trvCity" items="${ trvCityList }" varStatus="st">
								${ trvCity.cityNameEn }, ${ trvCity.countryNameEn }  
								<c:if test="${ st.count ne trvCityList.size() }">/</c:if>&nbsp;
							</c:forEach>
						</p>
					</div>
					<div class="column is-1">
						<div class="dropdown">
							<div class="navbar-item field dropdown-trigger" id="inviteBtn"
								style="margin: 0" data-tooltip="동행초대" data-variation="mini"
								data-position="right center">
								<p class="control">
									<a class="button is-primary is-rounded" aria-haspopup="true"
										aria-controls="inviteDropdown" style="width: 40px"> <i
										class="fas fa-users"></i>
									</a>
								</p>
							</div>
							<div class="dropdown-menu" id="inviteDropdown" role="menu" style="min-width: 25rem;">
								<div class="dropdown-content">
									<div class="dropdown-item">
										<p>함께 여행하는 동행을 초대해서 일정을 공유하고 같이 작성해보세요!</p>
									</div>
									<hr class="dropdown-divider">
									<div class="dropdown-item">
										<p class="control has-icons-left">
											<span class="icon is-small is-left"> 
												<i class="fas fa-search-plus"></i>
											</span> 
											<input class="input is-rounded" type="text" placeholder="ID로 검색">
										</p>
										<p>
											user01 (홍길동) 
											<button class="button is-info is-small is-rounded">추가</button>
										</p>
									</div>
									<hr class="dropdown-divider">
									<div class="dropdown-item">
										<table class="table ">
											<!-- <thead>
												<tr>
													<th >초대된 사람</th>
													<th></th>
												</tr>
											</thead> -->
											<tbody>
												<tr>
													<td width="10%">
														<span class="icon">
															<i class="far fa-user"></i>
														</span>
													</td>
													<td width="70%">user01 (홍길동)</td>
													<td width="20%">
														<button class="button is-dark is-small">삭제</button>
													</td>
												</tr>
												<tr>
													<td width="10%">
														<span class="icon">
															<i class="far fa-user"></i>
														</span>
													</td>
													<td width="70%">user02 (문지원)</td>
													<td width="20%">
														<button class="button is-dark is-small">삭제</button>
													</td>
												</tr>
												<tr>
													<td width="10%">
														<span class="icon">
															<i class="far fa-user"></i>
														</span>
													</td>
													<td width="70%">user03 (천예랑)</td>
													<td width="20%">
														<button class="button is-dark is-small">삭제</button>
													</td>
												</tr>
												
											</tbody>
										</table>
									</div>
									<hr class="dropdown-divider">
									<div class="dropdown-item">
										<button class="button is-small closeBtn">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="column" style="line-height:80px;">
						<div class="tabs is-right editorMenu">
						    <ul>
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
		<div id="allSchedule" style="display:none;">
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
			$("#inviteBtn").click(function() {
				$("#inviteDropdown").toggle();
			});
			$(".closeBtn").click(function() {
				$("#inviteDropdown").hide();
			});
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7fLkDFvRtLNooR612ov12h_gwdsqDI6Q&libraries=places&callback=initMap"
    async defer></script>
	<script src="resources/js/travel/map-icons.js"></script>
	<script src="resources/js/travel/travel.js"></script>
	
</body>
</html>