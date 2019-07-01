<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.allSchTable {
		overflow-x:scroll !important;
	}
	.allSchTable td, .allSchTable th{
		text-align:center;
	}
	.dayInput {
		width:70%;
	}
	
</style>
</head>
<body>
	<div class="columns">
		<div class="column">
			<section class="section">
				<div style="border:1px solid gray; height:500px">
					<div id="mapWide" style="height:100%"></div>
				</div>
			</section>
			<section class="section">
				<div class="columns is-multiline">
					<c:forEach var="trvDay" items="${ trvDayList }" varStatus="st">
						<div class="column is-one-fifth" style="padding: 10.5px 0">
							<nav class="panel">
								<div class="panel-heading" align="center"
									style="background: whitesmoke; color: black; height: 30px">
									<p class="help">${ trvDay.dayDate }</p>
								</div>
								<div class="panel-heading" align="center" style="margin: 0">
									<span>DAY ${ trvDay.dayNumber }</span>&nbsp; 
									<input type="hidden" value="${ trvDay.dayId }">
									<input class="input dayMemo is-small day${ trvDay.dayId }Memo" type="text" placeholder="MEMO"
										value="${ trvDay.dayMemo }">
								</div>
								<!-- <label class="panel-block"><input type="checkbox">시간 보이기</label> -->
								<ul class="connectedSortable menu-list dayList" style="background: white">
									<c:forEach var="sch" items="${ trvDay.schList }" varStatus="st">
										<li class="panel-block">
											<div class="media-left" style="width:20%">
												<p>${ sch.startTime } - ${ sch.endTime }</p>
												
											</div>
											<div class="media-content" style="width:70%">
												<div class="content">
													<p>
														<strong>${ sch.schTitle }</strong>
													</p>
													<small>${ sch.trvCost.costType } : <strong>${ sch.trvCost.costAmount }</strong> ${ sch.trvCost.currency }</small>
													<small>${ sch.schTransp }</small>
													<small>
														<a style="color:purple">
													 		<span class="icon is-small" style="color:purple"> 
																<i class="fas fa-map-marker-alt"></i>
															</span>
															<c:if test="${ sch.plcName ne null }" >
																${ sch.plcName }
															</c:if>
															<c:if test="${ sch.plcName eq null }" >
																(장소 정보 없음)
															</c:if>
													 	</a>
													</small>
												</div>
											</div>
											<div class="media-right" style="width:10%">
												<input type="hidden" value="${ sch.schId }" name="schId">
												<button class="delete schDeleteBtn" aria-label="close" data-tooptip="일정 삭제"></button>
												<br><br>	
												<span class="icon schInfoBtn" data-tooltip="일정 정보 수정">
													<i class="fas fa-edit"></i>
												</span>
											</div>
										</li>
									</c:forEach>
								</ul>
							</nav>
						</div>
					</c:forEach>
				</div>

			</section>
		</div>
	</div>
</body>
</html>