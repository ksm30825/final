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
</head>
<style>
	#cost {
		display: flex;
		width: 100%;
	}
	#costBtnArea {
		text-align: right;
		width: 90%;
	}
	
	.nextBtnArea {
		display: inline-block;
		margin-top: 5%;
		cursor: pointer;
		width: 5%;
	}
	.button.is-primary.soft {
		background: rgb(159, 125, 191);
	}
	.button.is-primary.soft:hover {
		background: rgb(123, 87, 157);
	}
	
	.costTableArea {
		display: inline-block;
		flex: 3;
	}
	#costTableArea {
		width: 90%;
	}
	#costTableArea p {
		text-align: center;
	}
	#costTable {
		width: 100%;
	}
	#costTable th {
		background: rgb(178, 214, 237, 0.55);
		padding: 1em;
		text-align: center !important;
		font-size: 1.2em;
	}
	#costTable td {
		padding: 1em;
		text-align: center !important;
	}
	.detailCostArea {
		width: 90%;
	}
</style>
<body>
	<!-- 결제여부에 따른 출력될 일수 설정하기 -->
	<fmt:parseDate var="startDate" value="${ detailTb.startDate }" pattern="yyyy-MM-dd" />
	<fmt:parseNumber value="${ startDate.time / (1000*60*60*24) }" integerOnly="true" var="startDay" />
	<fmt:parseDate var="endDate" value="${ detailTb.endDate }" pattern="yyyy-MM-dd" />
	<fmt:parseNumber value="${ endDate.time / (1000*60*60*24) }" integerOnly="true" var="endDay" />
	
	<c:choose>
		<c:when test="${ (!empty loginUser && detailTb.buyStatus eq 'Y') || loginUser.memberId eq detailTb.memberId }">
			<fmt:parseNumber var="showDays" integerOnly="true" value="${ endDay - startDay + 1 }"/>
		</c:when>
		<c:otherwise>
			<fmt:parseNumber var="showDays" integerOnly="true" value="${ (endDay - startDay + 1) / 3 }" />
		</c:otherwise>
	</c:choose>
	<fmt:parseNumber var="totalDays" integerOnly="true" value="${ (endDay - startDay + 1) }" />
	
	<input type="number" hidden="hidden" id="totalDays" value="${ endDay - startDay + 1 }">
	<input type="number" hidden="hidden" id="showDays" value="${ showDays }">


	<!-- 서브메뉴 본문(가계부) -->
	<section class="section" id="detailSub" style="padding-top: 0;">
		<div id="detailSubContent" align="center">
			<div id="costBtnArea">
				<a class="button is-primary" onclick="allCost()">전체</a>
				<a class="button is-primary soft" onclick="dayCost(1, 'none')">일별</a>
				<c:choose>
					<c:when test="${ detailTb.buyStatus eq 'N' && loginUser.memberId ne detailTb.memberId }">
						<a class="button is-dark" onclick="buyInfo()">가계부 엑셀 다운로드</a>
					</c:when>
					<c:otherwise>
						<a class="button is-success" onclick="costDownload()">가계부 엑셀 다운로드</a>
					</c:otherwise>
				</c:choose>
				<c:if test="구매여부가 true면">
					
				</c:if>
				<c:if test="">
					
				</c:if>
			</div>
			
			<input type="number" id="costDayNum" hidden="hidden" value="1">
			
			<div id="cost">
				<div class="nextBtnArea" onclick="dayCost($('#costDayNum').val(), 'left')" style="visibility: hidden;">
					<i class="title is-2 fas fa-caret-left"></i>
				</div>
				
				<div id="costTableArea">
				
					<div align="left" class="title is-4">
					<span id="costTitle">전체예산</span>
					<span id="budget">
					<i class="far fa-money-bill-alt"></i>
					<span id="allCost"> ${ detailTb.budget }</span>원 = 
					<i class="fas fa-money-bill-alt"></i>
					   000,000AUD
					</span>
					</div>
					   
					<table id="costTable">
						<tr>
							<th><i class="fas fa fa-bed"></i> 숙박</th>
							<th><i class="fas fa fa-taxi"></i> 교통</th>
							<th><i class="fas fa fa-utensils"></i> 식비</th>
							<th><i class="fas fa fa-shopping-bag"></i> 쇼핑</th>
							<th><i class="fab fa-tripadvisor"></i> 관광</th>
							<th><i class="fas fa-ellipsis-h"></i> 기타</th>
							<th style="color: #209cee; width: 15%">TOTAL</th>
							<th style="color: rgb(142, 68, 173); width: 15%">BALANCE</th>
						</tr>
						
						<c:forEach var="i" begin="1" end="${ totalDays }" step="1" varStatus="st">
							<c:choose>
							
								<c:when test="${ st.count <= showDays }">
									<c:set var="check" value="false" />
									
									<fmt:parseNumber var="roomCharge" integerOnly="true" value="${ 0 }" />
									<fmt:parseNumber var="trafficCharge" integerOnly="true" value="${ 0 }" />
									<fmt:parseNumber var="foodCharge" integerOnly="true" value="${ 0 }" />
									<fmt:parseNumber var="shoppingCharge" integerOnly="true" value="${ 0 }" />
									<fmt:parseNumber var="sightseeingCharge" integerOnly="true" value="${ 0 }" />
									<fmt:parseNumber var="etcCharge" integerOnly="true" value="${ 0 }" />
									<fmt:parseNumber var="totalCost" integerOnly="true" value="${ 0 }" />
									<fmt:parseNumber var="sightseeingCharge" integerOnly="true" value="${ 0 }" />
									<fmt:parseNumber var="balance" integerOnly="true" value="${ detailTb.budget }" />
									
									<c:forEach var="j" begin="0" end="${ totalDays }" step="1">
										<c:if test="${ st.count == allCost[j].dayNumber }">
											<!-- <p>결제전 볼수있음</p> -->
											<tr class="costTable" id="cost${ st.count }" style="display: none;">
												<td>${ allCost[j].roomCharge }</td>
												<td>${ allCost[j].trafficCharge }</td>
												<td>${ allCost[j].foodCharge }</td>
												<td>${ allCost[j].shoppingCharge }</td>
												<td>${ allCost[j].sightseeingCharge }</td>
												<td>${ allCost[j].etcCharge }</td>
												<td>${ allCost[j].totalCost }</td>
												<td>${ balance - allCost[j].totalCost }</td>
											</tr>
											<c:set var="check" value="true" />
										</c:if>
										<fmt:parseNumber var="balance" integerOnly="true" value="${ balance - allCost[j].totalCost }" />
										
										<fmt:parseNumber var="roomCharge" integerOnly="true" value="${ roomCharge + allCost[j].roomCharge }" />
										<fmt:parseNumber var="trafficCharge" integerOnly="true" value="${ trafficCharge + allCost[j].trafficCharge }" />
										<fmt:parseNumber var="foodCharge" integerOnly="true" value="${ foodCharge + allCost[j].foodCharge }" />
										<fmt:parseNumber var="shoppingCharge" integerOnly="true" value="${ shoppingCharge + allCost[j].shoppingCharge }" />
										<fmt:parseNumber var="sightseeingCharge" integerOnly="true" value="${ sightseeingCharge + allCost[j].sightseeingCharge }" />
										<fmt:parseNumber var="etcCharge" integerOnly="true" value="${ etcCharge + allCost[j].etcCharge }" />
										<fmt:parseNumber var="totalCost" integerOnly="true" value="${ totalCost + allCost[j].totalCost }" />
										
									</c:forEach>
									
								</c:when>
								
								<c:otherwise>
									<c:set var="check" value="false" />
									<c:forEach var="j" begin="0" end="${ totalDays }" step="1">
										<c:if test="${ st.count == allCost[j].dayNumber }">
											<!-- <p>결제전 볼수없음</p> -->
											<tr class="costTable" id="cost${ st.count }" style="display: none;">
												<c:choose>
													<c:when test="${ allCost[j].totalCost eq 0 }">
														<td colspan="8" style="color: gray;"><i class="fas fa-exclamation-circle"></i> 미리보기 종료 (가계부 정보 없음)</td>
													</c:when>
													<c:otherwise>
														<td colspan="8" style="color: gray;" onclick="buyInfo()" data-tooltip="상세보기를 원하시면 결제가 필요합니다."><i class="fas fa-exclamation-circle"></i> 미리보기 종료</td>
													</c:otherwise>
												</c:choose>
												
											</tr>
											<c:set var="check" value="true" />
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<tr id="allCostTable" style="">
							<td>${ roomCharge }</td>
							<td>${ trafficCharge }</td>
							<td>${ foodCharge }</td>
							<td>${ shoppingCharge }</td>
							<td>${ sightseeingCharge }</td>
							<td>${ etcCharge }</td>
							<td>${ totalCost }</td>
							<td>${ detailTb.budget - totalCost }</td>
						</tr>
						
					</table>
				</div>
			
			<div class="nextBtnArea" onclick="dayCost($('#costDayNum').val(), 'right')" style="visibility: hidden;">
				<i class="title is-2 fas fa-caret-right"></i>
			</div>
		</div>
		
		<c:forEach var="i" begin="1" end="${ totalDays }" step="1" varStatus="st">
			<c:choose>
			
				<c:when test="${ st.count <= showDays }">
					<c:set var="check" value="false" />
					<c:forEach var="j" begin="0" end="${ fn:length(allCost) }" step="1">
					<c:if test="${ st.count == allCost[j].dayNumber && fn:length(allCost[j].trvCost) > 0}">
							<%-- <p>DAY ${ st.count } 결제 안해도 볼 수 있음(정보 있음)</p> --%>
							
							<div class="column detailCostArea" style="padding: 10.5px 0; display: none;" id="detailCostTable${ st.count }">
								<nav class="panel costPanel">
									<div class="panel-heading" align="center"
										style="background: whitesmoke; color: black; height: 30px">
										<p class="help">${ allCost[j].dayDate }</p>
									</div>
									<div class="panel-heading" align="center" style="margin: 0">
										<span>DAY ${ allCost[j].dayNumber }</span>&nbsp; 
									</div>
									<ul class="connectedSortable menu-list costList" style="background: white">
										<li class="panel-block" style="display:none">
											<div class="media-left" style="width: 20%">
												<span class="icon costType accomm"><i class="fas fa-bed"></i></span>
												<span class="icon costType transp"><i class="fas fa-taxi"></i></span>
												<span class="icon costType food"><i class="fas fa-utensils"></i></span>
												<span class="icon costType shopping"><i class="fas fa-shopping-bag"></i></span>
												<span class="icon costType tour"><i class="fab fa-tripadvisor"></i></span>
												<span class="icon costType etc"><i class="fas fa-ellipsis-h"></i></span>
											</div>
											<div class="media-content" style="width: 70%">
												<div class="content">
													<p>
														<strong class="costAmount"></strong>
														<small class="costCurrency"></small>
													</p>
													<small class="costContent"></small>
												</div>
											</div>
										</li>
										
										<c:forEach var="cost" items="${ allCost[j].trvCost }" varStatus="st" >
											<li class="panel-block">
												<div class="media-left" style="width: 30%">
													<c:choose>
														<c:when test="${ cost.costType eq '숙박' }">
															<span class="icon costType accomm"><i class="fas fa-bed"></i></span>
														</c:when>
														<c:when test="${ cost.costType eq '교통' }">
															<span class="icon costType transp"><i class="fas fa-taxi"></i></span>
														</c:when>
														<c:when test="${ cost.costType eq '식비' }">
															<span class="icon costType food"><i class="fas fa-utensils"></i></span>
														</c:when>
														<c:when test="${ cost.costType eq '쇼핑' }">
															<span class="icon costType shopping"><i
																class="fas fa-shopping-bag"></i></span>
														</c:when>
														<c:when test="${ cost.costType eq '관광' }">
															<span class="icon costType tour"><i
																class="fab fa-tripadvisor"></i></span>
														</c:when>
														<c:otherwise>
															<span class="icon costType etc"><i class="fas fa-ellipsis-h"></i></span>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="media-content" style="width: 70%">
													<div class="content">
														<p>
															<strong class="costAmount">${ cost.costAmount }</strong>
															<small class="costCurrency"></small>
														</p>
														<p><small class="costContent">${ cost.costContent }</small></p>
													</div>
												</div>
											</li>
										</c:forEach>
									</ul>
								</nav>
							</div>
							
							<!--  -->
							<c:set var="check" value="true" />
					</c:if>
					</c:forEach>
					<c:if test="${ check == false }">
						<div class="column detailCostArea" style="padding: 10.5px 0; display: none;" id="detailCostTable${ st.count }">
								<nav class="panel costPanel">
									<div class="panel-heading" align="center" style="background: whitesmoke; color: black; height: 30px">
										<p class="help">${ allCost[st.count-1].dayDate }</p>
									</div>
									<div class="panel-heading" align="center" style="margin: 0">
										<span>DAY ${ st.count }</span>&nbsp; 
									</div>
									<ul class="connectedSortable menu-list costList" style="background: white">
										<li class="panel-block" style="display:none">
											<div class="media-left" style="width: 20%">
												<span class="icon costType accomm"><i class="fas fa-bed"></i></span>
												<span class="icon costType transp"><i class="fas fa-taxi"></i></span>
												<span class="icon costType food"><i class="fas fa-utensils"></i></span>
												<span class="icon costType shopping"><i class="fas fa-shopping-bag"></i></span>
												<span class="icon costType tour"><i class="fab fa-tripadvisor"></i></span>
												<span class="icon costType etc"><i class="fas fa-ellipsis-h"></i></span>
											</div>
											<div class="media-content" style="width: 70%">
												<div class="content">
													<p>
														<strong class="costAmount"></strong>
														<small class="costCurrency"></small>
													</p>
													<small class="costContent"></small>
												</div>
											</div>
										</li>
										
										<li class="panel-block" style="justify-content: center;">
											<p>상세정보없음</p>
										</li>
									</ul>
								</nav>
							</div>
					</c:if>
				</c:when>
				
				<c:otherwise>
				
					<c:set var="check" value="false" />
					<c:forEach var="j" begin="0" end="${ fn:length(allCost) }" step="1">
						<c:if test="${ st.count == allCost[j].dayNumber && fn:length(allCost[j].trvCost) > 0}">
								<%-- <p>DAY ${ st.count } 결제 안하면 볼 수 없음(정보 있음)</p> --%>
								<div class="column detailCostArea" style="padding: 10.5px 0; display: none;" id="detailCostTable${ st.count }">
								<nav class="panel costPanel">
									<div class="panel-heading" align="center" style="background: whitesmoke; color: black; height: 30px">
										<p class="help">${ allCost[st.count-1].dayDate }</p>
									</div>
									<div class="panel-heading" align="center" style="margin: 0">
										<span>DAY ${ st.count }</span>&nbsp; 
									</div>
									<ul class="connectedSortable menu-list costList" style="background: white">
										<li class="panel-block" style="display:none">
											<div class="media-left" style="width: 20%">
												<span class="icon costType accomm"><i class="fas fa-bed"></i></span>
												<span class="icon costType transp"><i class="fas fa-taxi"></i></span>
												<span class="icon costType food"><i class="fas fa-utensils"></i></span>
												<span class="icon costType shopping"><i class="fas fa-shopping-bag"></i></span>
												<span class="icon costType tour"><i class="fab fa-tripadvisor"></i></span>
												<span class="icon costType etc"><i class="fas fa-ellipsis-h"></i></span>
											</div>
											<div class="media-content" style="width: 70%">
												<div class="content">
													<p>
														<strong class="costAmount"></strong>
														<small class="costCurrency"></small>
													</p>
													<small class="costContent"></small>
												</div>
											</div>
										</li>
										
										<li class="panel-block" style="justify-content: center;">
											<p onclick="buyInfo()" data-tooltip="상세보기를 원하시면 결제가 필요합니다."><i class="fas fa-exclamation-circle"></i> 미리보기 종료</p>
										</li>
									</ul>
								</nav>
							</div>
						</c:if>
					</c:forEach>
					<c:if test="${ check == false }">
						<%-- <p>DAY ${ st.count } 결제 안하면 볼 수 없음(정보 없음)</p> --%>
						
						<div class="column detailCostArea" style="padding: 10.5px 0; display: none;" id="detailCostTable${ st.count }">
								<nav class="panel costPanel">
									<div class="panel-heading" align="center" style="background: whitesmoke; color: black; height: 30px">
										<p class="help">${ allCost[st.count-1].dayDate }</p>
									</div>
									<div class="panel-heading" align="center" style="margin: 0">
										<span>DAY ${ st.count }</span>&nbsp; 
									</div>
									<ul class="connectedSortable menu-list costList" style="background: white">
										<li class="panel-block" style="display:none">
											<div class="media-left" style="width: 20%">
												<span class="icon costType accomm"><i class="fas fa-bed"></i></span>
												<span class="icon costType transp"><i class="fas fa-taxi"></i></span>
												<span class="icon costType food"><i class="fas fa-utensils"></i></span>
												<span class="icon costType shopping"><i class="fas fa-shopping-bag"></i></span>
												<span class="icon costType tour"><i class="fab fa-tripadvisor"></i></span>
												<span class="icon costType etc"><i class="fas fa-ellipsis-h"></i></span>
											</div>
											<div class="media-content" style="width: 70%">
												<div class="content">
													<p>
														<strong class="costAmount"></strong>
														<small class="costCurrency"></small>
													</p>
													<small class="costContent"></small>
												</div>
											</div>
										</li>
										
										<li class="panel-block" style="justify-content: center; color: gray;">
											<p><i class="fas fa-exclamation-circle"></i> 미리보기 종료 (가계부 정보 없음)</p>
										</li>
									</ul>
								</nav>
							</div>
					</c:if>
					
				</c:otherwise>
				
			</c:choose>
		</c:forEach>
		</div>
	</section>
<script>
	function allCost() {
		$("#allCostTable").removeAttr("style");
		$(".costTable").css("display","none");
		$(".nextBtnArea").css("visibility","hidden");
		$("#budget").removeAttr("style");
		
		$("#costTitle").text("전체예산");
		
	}
	
	function dayCost(day, text) {
		
		var nextDay = 1;
		var totalDay = $("#totalDays").val();
		var showDay = $("#showDays").val();
		
		if(text == 'left') {
			nextDay = Number(Number(day) - 1);
		}else if(text == 'right') {
			nextDay = Number(Number(day) + 1);
		}else {
			$("#allCostTable").css("display","none");
			$(".nextBtnArea").removeAttr("style");
			$("#budget").css("display","none");
		}
		
		console.log("next : " + nextDay);
		
		if(nextDay != 0 && nextDay <= totalDay) {
			
			$(".costTable").css("display","none");
			$(".detailCostArea").css("display","none");
			$("#cost" + nextDay).removeAttr("style");
			$("#detailCostTable" + nextDay).removeAttr("style");
			$("#costTitle").text("DAY " + nextDay);
			
			$("#costDayNum").val(nextDay);
		}
		
	}
	
	function costDownload() {
		$.ajax({
			url : "costDownload.tb",
			data : {},
			success : function(data) {
				alert("다운로드 처리");
			}
		});
	}
</script>

</body>
</html>