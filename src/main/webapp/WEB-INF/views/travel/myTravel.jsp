<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 여행 일정</title>
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
	.trvCard:hover {
		cursor:pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	
	<div class="columns is-mobile">
		<div class="column">
			<section class="section" id="headerSection">
				<jsp:include page="../common/myPageHeader.jsp" />
			</section>
			<section class="section" id="bredcrumbSection" style="padding-top:0; padding-bottom:0">
				<nav class="breadcrumb">&nbsp;&nbsp;
					<ul style="padding-left:20px">
						<li class="my-trv-menu is-active" id="private"><a id="open">작성중</a></li>
						<li class="my-trv-menu" id="public"><a id="closed">작성완료</a></li>
					</ul>
				</nav>
			</section>
			<section class="section" id="privateSection">
				<div class="columns">
					<c:forEach var="trv" items="${ privateTrvList }" varStatus="st">
						<div class="column is-one-third">
							<div class="card trvCard">
								<input type="hidden" value="${ trv.trvId }" name="trvId" />
								<div class="card-image">
									<figure class="image" style="margin:0">
										<img src="resources/images/sample1.jpg">
									</figure>
								</div>
								<div class="card-content">
									<div class="media">
										<div class="media-left">
											<p class="title is-4">${ trv.trvTitle }</p>
											<p class="subtitle is-6">
												<c:forEach var="trvCity" items="${ trv.trvCityList }" varStatus="st2">
													${ trvCity.countryNameKo } &nbsp; ${ trvCity.cityNameKo }
													<c:if test="${ st2.count ne trv.trvCityList.size() }">/</c:if>&nbsp;
												</c:forEach>
											</p>
											<small>${ trv.startDate } ~ ${ trv.endDate }</small>&nbsp;&nbsp;
											<a class="button is-small"> 
												<span class="icon is-small"><i class="fa fa-user"></i></span> 
												<span> ${ sessionScope.loginUser.userName } </span>
											</a>
										</div>
										<div class="media-right">
										</div>
									</div>
									<div class="content">
										<a>#혼자여행</a>
										<a>#자유여행</a> 
										<a>#먹방여행</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
			<section class="section" id="publicSection" style="display:none">
				<div class="columns">
					<c:forEach var="trv" items="${ publicTrvList }" varStatus="st">
						<div class="column is-one-third">
							<div class="card trvCard">
								<input type="hidden" value="${ trv.trvId }" name="trvId" />
								<div class="card-image">
									<figure class="image" style="margin:0">
										<img src="resources/images/sample1.jpg">
									</figure>
								</div>
								<div class="card-content">
									<div class="media">
										<div class="media-left">
											<p class="title is-4">${ trv.trvTitle }</p>
											<p class="subtitle is-6">
												<c:forEach var="trvCity" items="${ trv.trvCityList }" varStatus="st2">
													${ trvCity.countryNameKo } &nbsp; ${ trvCity.cityNameKo }
													<c:if test="${ st2.count ne trv.trvCityList.size() }">/</c:if>&nbsp;
												</c:forEach>
											</p>
											<small>${ trv.startDate } ~ ${ trv.endDate }</small>&nbsp;&nbsp;
											<a class="button is-small"> 
												<span class="icon is-small"><i class="fa fa-user"></i></span> 
												<span> ${ sessionScope.loginUser.userName } </span>
											</a>
										</div>
										<div class="media-right">
										</div>
									</div>
									<div class="content">
										<a>#혼자여행</a>
										<a>#자유여행</a> 
										<a>#먹방여행</a>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
		</div>
	</div>
	<script>
		$(function() {
			$(".my-trv-menu").click(function() {
				$(this).addClass('is-active');
				$(this).siblings().removeClass('is-active');
				if($(this).is("#private")) {
					$("#privateSection").show();
					$("#publicSection").hide();
				}else {
					$("#privateSection").hide();
					$("#publicSection").show();
				}
			});
		});
	
		$(".trvCard").click(function() {
			var trvId = $(this).children().eq(0).val();
			location.href="selectTravel.trv?trvId=" + trvId;
		});
	</script>



</body>
</html>