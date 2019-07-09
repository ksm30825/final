<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table td, .table th {
		text-align:center;
	}
	.panelTr>td {
		padding:0;
	}
	.costList {
		height:400px;
		overflow-y:scroll;
	}
</style>
</head>
<body>
	<div class="columns">
		<div class="column">
			<section class="section">
				<nav class="level">
					<div class="level-item has-text-centered">
						<div>
							<p class="subtitle is-4"><strong>전체 예산</strong></p>
						</div>
					</div>
					<div class="level-item has-text-centered">
						<div>
							<p class="heading">TOTAL</p>
							<p class="title is-5">
								<%-- <input type="number" class="input is-primary budgetInput" value="${ wonAmount }" placeholder="원화 총액"  
								id="budgetWon"> --%>
								<input type="text" name="currency-field" id="budgetWon" 
								 pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" class="input is-primary budgetInput"
								 data-type="currency" placeholder="1,000,000.00 원">
							</p>
						</div>
					</div>
					<div class="level-item has-text-centered">
						<div>
							<p class="heading">  
								<span id="exchangeRate" style="color:purple">...</span>
								KRW = 1 ${ trvCityList[0].currencyUnit }
							</p>
							<p class="title is-1">=</p>
						</div>
					</div>
					<div class="level-item has-text-centered">
						<div>
							<p class="heading">TOTAL</p>
							<p class="title is-5">
								<input type="text" name="currency-field" id="budgetLocal" readOnly
								 pattern="^\$\d{1,3}(,\d{3})*(\.\d+)?$" value="" class="input is-primary budgetInput"
								 data-type="currency" placeholder="1,000,000.00 ${ trvCityList[0].currencyUnit }">
							</p>
						</div>
					</div>
					<div class="level-item has-text-centered"><div></div></div>
				</nav>
			</section>
			<section class="section" style="padding-top:0">
				<table class="table is-bordered is-fullwidth is-striped" align="center">
					<thead>
						<tr class="is-selected" style="background:skyblue">
							<th width="12%">
								<i class="fas fa-3x fa-bed"></i>
								<span>숙박</span>
							</th>
							<th width="12%">
								<i class="fas fa-3x fa-taxi"></i>
								<span>교통</span>
							</th>
							<th width="12%">
								<i class="fas fa-3x fa-utensils"></i>
								<span>식비</span>
							</th>
							<th width="12%">
								<i class="fas fa-3x fa-shopping-bag"></i>
								<span>쇼핑</span>
							</th>
							<th width="12%">
								<i class="fab fa-3x fa-tripadvisor"></i>
								<span>관광</span>
							</th>
							<th width="12%">
								<i class="fas fa-3x fa-ellipsis-h"></i>
								<span>기타</span>
							</th>
							<th width="14%" style="background:#C3AFF8">
								<span style="color:black;">TOTAL</span>
							</th>
							<th width="14%">
								<span style="color:black">BALANCE</span>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="accommCost" value="" />
						<c:forEach var="trvDay" items="${ trvDayList }" varStatus="st">
							<c:forEach var="sch" items="${ trvDay.schList }" varStatus="st2">
								<c:if test="${ sch.trvCost ne null }">
									<c:if test="${ sch.trvCost.costType eq '숙박' }">
										${ accommCost }
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
						<tr>
							<td id="accommCostWon"></td>
							<td id="transpCostWon"></td>
							<td id="foodCostWon"></td>
							<td id="shoppingCostWon"></td>
							<td id="tourCostWon"></td>
							<td id="etcCostWon"></td>
							<td id="totalCostWon" style="background:#C3AFF8"></td>
							<td id="balanceWon" style="background:skyblue"></td>
						</tr>
						<tr>
							<td id="accommCostLocal"></td>
							<td id="transpCostLocal"></td>
							<td id="foodCostLocal"></td>
							<td id="shoppingCostLocal"></td>
							<td id="tourCostLocal"></td>
							<td id="etcCostLocal"></td>
							<td id="totalCostLocal" style="background:#C3AFF8"></td>
							<td id="balanceLocal" style="background:skyblue"></td>
						</tr>
					</tbody>
				</table>
			</section>
			<section class="section">
				<div align="right">
					<button class="button is-link" id="downCostBtn">
						<span class="icon is-small"><i class="fas fa-file-excel"></i></span>
						<span>가계부 엑셀로 다운받기</span>
					</button>
					<br>
				</div>
				<div class="columns is-multiline">
					<c:forEach var="trvDay" items="${ trvDayList }" varStatus="st">
						<div class="column is-one-fifth" style="padding: 10.5px 0">
							<nav class="panel costPanel" id="day${ trvDay.dayId }Cost">
								<div class="panel-heading" align="center"
									style="background: whitesmoke; color: black; height: 30px">
									<p class="help">${ trvDay.dayDate }</p>
								</div>
								<div class="panel-heading" align="center" style="margin: 0">
									<span>DAY ${ trvDay.dayNumber }</span>&nbsp; 
									<input type="hidden" value="${ trvDay.dayId }" name="dayId">
									<input class="input dayMemo is-small day${ trvDay.dayId }Memo" type="text" placeholder="MEMO"
										value="${ trvDay.dayMemo }">
								</div>
								<ul class="connectedSortable menu-list costList" style="background: white" id="day${ trvDay.dayNumber }CostList">
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
										<div class="media-right" style="width: 10%">
											<input type="hidden" value="0" name="costId">
											<button class="delete costDeleteBtn" aria-label="close" data-tooptip="일정 삭제"></button>
											<br><br> 
											<span class="icon costInfoBtn"data-tooltip="일정 정보 수정"> 
												<i class="fas fa-edit"></i>
											</span>
											<input type="hidden" value="0" name="schId">
										</div>
									</li>
									<c:forEach var="sch" items="${ trvDay.schList }" varStatus="st" >
										<c:if test="${ sch.trvCost ne null }">
											<li class="panel-block" id="cost_${ sch.trvCost.costId }">
												<div class="media-left" style="width:20%">
													<c:choose >
														<c:when test="${ sch.trvCost.costType eq '숙박' }" >
															<span class="icon costType accomm"><i class="fas fa-bed"></i></span>
														</c:when>
														<c:when test="${ sch.trvCost.costType eq '교통' }" >
															<span class="icon costType transp"><i class="fas fa-taxi"></i></span>
														</c:when>
														<c:when test="${ sch.trvCost.costType eq '식비' }" >
															<span class="icon costType food"><i class="fas fa-utensils"></i></span>
														</c:when>
														<c:when test="${ sch.trvCost.costType eq '쇼핑' }" >
															<span class="icon costType shopping"><i class="fas fa-shopping-bag"></i></span>
														</c:when>
														<c:when test="${ sch.trvCost.costType eq '관광' }" >
															<span class="icon costType tour"><i class="fab fa-tripadvisor"></i></span>
														</c:when>
														<c:otherwise>
															<span class="icon costType etc"><i class="fas fa-ellipsis-h"></i></span>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="media-content" style="width:70%">
													<div class="content">
														<p><strong class="costAmount">${ sch.trvCost.costAmount }</strong> 
															<small class="costCurrency">${ sch.trvCost.currency }</small></p>
														<small class="costContent">${ sch.trvCost.costContent }</small>
													</div>
												</div>
												<div class="media-right" style="width:10%">
													<input type="hidden" value="${ sch.trvCost.costId }" name="costId">
													<button class="delete costDeleteBtn" aria-label="close" data-tooptip="일정 삭제"></button>
													<br><br>	
													<span class="icon costInfoBtn" data-tooltip="일정 정보 수정">
														<i class="fas fa-edit"></i>
													</span>
													<input type="hidden" value="${ sch.trvCost.schId }" name="schId" />
												</div>
											</li>
											
										</c:if>
									</c:forEach>
									<c:forEach var="cost" items="${ trvDay.costList }" varStatus="st" >
										<li class="panel-block" id="cost_${ cost.costId }">
											<div class="media-left" style="width: 20%">
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
														<small class="costCurrency">${ cost.currency }</small>
													</p>
													<small class="costContent">${ cost.costContent }</small>
												</div>
											</div>
											<div class="media-right" style="width: 10%">
												<input type="hidden" value="${ cost.costId }" name="costId">
												<button class="delete costDeleteBtn" aria-label="close" data-tooptip="일정 삭제"></button>
												<br><br> 
												<span class="icon costInfoBtn"data-tooltip="일정 정보 수정">
													<i class="fas fa-edit"></i>
												</span>
												<input type="hidden" value="0" name="schId">
											</div>
										</li>
									</c:forEach>
								</ul>
								<div class="panel-block">
									<button class="button is-link is-outlined is-fullwidth"
										onclick="$('#newCostModal').toggleClass('is-active')">가계부 항목 추가</button>
								</div>
							</nav>
						</div>
					</c:forEach>
				</div>
			</section>
		</div>
	</div>	
	<jsp:include page="newCostModal.jsp" />
	<jsp:include page="costInfoModal.jsp" />
	<script>
		var rate = 1;
		var budgetWon = 0;
		var budgetLocal = 0;
		var accommCostLocal = 0.00;
		var transpCostLocal = 0.00;
		var foodCostLocal = 0.00;
		var shoppingCostLocal = 0.00;
		var tourCostLocal = 0.00;
		var etcCostLocal = 0.00;
		
		$(function() {
			
			//1) 처음 로딩시 budget이 존재하면 input에 넣고 formatting,
			//exchange rate조회해서 localbudget띄워주기
			//summary table 설정해주기
			if("${ trv.budget}" != 0) {
				$("#budgetWon").val(parseFloat("${ trv.budget }"));
				budgetWon = parseFloat("${ trv.budget }");
				formatCurrency($("#budgetWon"), "budgetWon", "blur");
			}
			//2) 처음 로딩시 budget이 0이면 
			//summary table만 설정해주기
			getLocalBudget(budgetWon);
			
		
		
		
			$("input[data-type='currency']").on({
			    keyup: function() {
			      	formatCurrency($(this), $(this).attr("id"));
			    },
			    blur: function() { 
			      	formatCurrency($(this), $(this).attr("id"), "blur");
			      
			      	//원화 변경시
			      	if($(this).attr("id") === "budgetWon") {
			      		var value = $(this).val();
			    	  	var budgetStr = value.substring(0, value.length - 2).replace(/,/g, "");
						budgetWon = parseFloat(budgetStr);
			    	  	//값이 입력안됐을때
						if(budgetStr == "") {
							$(this).val(0);
							formatCurrency($(this), "budgetWon");
							return;
						}
			    	  	//값이 입력됐을 때
						$.ajax({
							url:"updateBudget.trv",
							type:"POST",
							data:{budget:budgetWon, trvId:"${ trv.trvId }"},
							success:function(data) {
								getLocalBudget(budgetWon);
							},
							error:function(err) {
								alert("err", err);
							}
						});
			      }
			      
			    }
			});
			
			
			//가계부 수정
			$(".costInfoBtn").click(function() {
				var li = $(this).parent().parent();
				var dayId = li.parent().prev().find("input[name=dayId]").val();
				var costId = li.find("input[name=costId]").val();
				
				var schId = $(this).next().val();
				var costContent = li.find(".costContent").text();
				var costAmount = li.find(".costAmount").text();
				var costCurrency = li.find(".costCurrency").text();
				var costType = "";
				var span = li.find(".costType");
				if(span.is(".accomm")) {
					costType = "숙박";
				}else if(span.is(".transp")) {
					costType = "교통";
				}else if(span.is(".food")) {
					costType = "식비";
				}else if(span.is(".shopping")) {
					costType = "쇼핑";
				}else if(span.is(".tour")) {
					costType = "관광";
				}else if(span.is(".etc")) {
					costType = "기타";
				}
				console.log(costType);
				$("#costUpdateContent").val(costContent);
				$("#costUpdateId").val(costId);
				$("#costUpdateAmount").val(costAmount);
				$("#costUpdateSchId").val(schId);
				$("#costUpdateDayId").children().each(function() {
					if($(this).val() == dayId) {
						$(this).prop("selected", true);
					}
				});
				if(schId != 0) {
					$("#costUpdateDayId").prop("disabled", true);
				}else {
					$("#costUpdateDayId").prop("disabled", false);
				}
				$("#costUpdateType").children().each(function() {
					if($(this).text() == costType) {
						$(this).prop("selected", true);
					}
				});
				$("#costUpdateCurrency").children().each(function() {
					if($(this).text() == costCurrency) {
						$(this).prop("selected", true);
					}
				});
				$('#costInfoModal').toggleClass('is-active');
			});
			
			$(".costDeleteBtn").click(function() {
				var li = $(this).parent().parent();
				var costId = li.find("input[name=costId]").val();
				var schId = $(this).parent().children().last().val();
				var answer = window.confirm("해당 경비 항목이 삭제됩니다. 계속하시겠습니까?");
				if(answer) {
					$.ajax({
						url:"deleteCost.trv",
						type:"POST",
						data:{costId:costId},
						success:function(data) {
							console.log(data);
							li.remove();
							if(schId != 0) {
								$(".sch" + schId + "Block").find(".costType").remove();
								$(".sch" + schId + "Block").find(".costAmount").remove();
								$(".sch" + schId + "Block").find(".costCurrency").remove();
							}
							
						},
						error:function(err) {
							alert("err");
						}
					});
				}
			});
			
			
			$("#downCostBtn").click(function() {
				location.href="downloadCost.trv?trvId=${ trv.trvId }";
			});
			
		});
		
		//환율 조회	, 전체예산 적용
		function getLocalBudget(amount) {
			
			$.ajax({
				url:'http://data.fixer.io/api/latest?access_key=92d8dd4822a4117acfc28399dc24faff',
				dataType:'jsonp',
				success:function(json) {
					var krw = json.rates.KRW;
					var local = json.rates.${ trvCityList[0].currencyUnit };
					
					rate = Math.round((krw / local) * 1000) / 1000;
					$("#exchangeRate").text(rate);
					budgetLocal = Math.round((amount / rate) * 100) / 100;
					$("#budgetLocal").val(budgetLocal);
					formatCurrency($("#budgetLocal"), "budgetLocal", "blur");
					updateSummary();
				},
				error:function(err) {
					alert("err", err);
				}
			});
		}
		
		
		//summary테이블 update (rate, budgetLocal, budgetWon)
		function updateSummary() {
			accommCostLocal = 0;
			transpCostLocal = 0;
			foodCostLocal = 0;
			shoppingCostLocal = 0;
			tourCostLocal = 0;
			etcCostLocal = 0;
			$(".costAmount").each(function() {
				var cost;
				if($(this).text() != "") {
					cost = parseFloat($(this).text());
				}else {
					cost = 0;
				}
				var icon = $(this).parent().parent().parent().prev().children();
				if(icon.is(".accomm")) {
					accommCostLocal += cost;
				}else if (icon.is(".transp")) {
					transpCostLocal += cost;
				}else if (icon.is(".food")) {
					foodCostLocal += cost;
				}else if (icon.is(".shopping")) {
					shoppingCostLocal += cost;
				}else if (icon.is(".tour")) {
					tourCostLocal += cost;
				}else if (icon.is(".etc")) {
					etcCostLocal += cost;
				}
			});
			
			var totalCostLocal = accommCostLocal + transpCostLocal + foodCostLocal + tourCostLocal 
					+ shoppingCostLocal + etcCostLocal;
			var balanceLocal = Math.round((budgetLocal - totalCostLocal) * 100) / 100;
			
			$("#accommCostLocal").text(accommCostLocal + ' ${ trvCityList[0].currencyUnit }');
			$("#transpCostLocal").text(transpCostLocal + ' ${ trvCityList[0].currencyUnit }');
			$("#foodCostLocal").text(foodCostLocal + ' ${ trvCityList[0].currencyUnit }');
			$("#tourCostLocal").text(tourCostLocal + ' ${ trvCityList[0].currencyUnit }');
			$("#shoppingCostLocal").text(shoppingCostLocal + ' ${ trvCityList[0].currencyUnit }');
			$("#etcCostLocal").text(etcCostLocal + ' ${ trvCityList[0].currencyUnit }');
			$("#totalCostLocal").text(totalCostLocal + ' ${ trvCityList[0].currencyUnit }');
			$("#balanceLocal").text(balanceLocal + ' ${ trvCityList[0].currencyUnit }');
			
			
			var accommCostWon = Math.floor(accommCostLocal * rate);
			var transpCostWon = Math.floor(transpCostLocal * rate);
			var foodCostWon = Math.floor(foodCostLocal * rate);
			var tourCostWon = Math.floor(tourCostLocal * rate);
			var shoppingCostWon = Math.floor(shoppingCostLocal * rate);
			var etcCostWon = Math.floor(etcCostLocal * rate)
			var totalCostWon = accommCostWon + transpCostWon + foodCostWon + tourCostWon
					+ shoppingCostWon + etcCostWon;
			var balanceWon = budgetWon - totalCostWon;
			
			$("#accommCostWon").text(accommCostWon + ' 원');
			$("#transpCostWon").text(transpCostWon + ' 원');
			$("#foodCostWon").text(foodCostWon + ' 원');
			$("#tourCostWon").text(tourCostWon + ' 원');
			$("#shoppingCostWon").text(shoppingCostWon + ' 원');
			$("#etcCostWon").text(etcCostWon + ' 원');
			$("#totalCostWon").text(totalCostWon + ' 원');
			$("#balanceWon").text(balanceWon + ' 원' );
		}
		
		
	
		
		
		
		
		
		
		
		
		//formatting
		function formatNumber(n) {
		  return n.replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",")
		}
	
	
		function formatCurrency(input, id, blur) {
		  	var input_val = input.val();
		  	if (input_val === "") { 
				return; 
			}
		 	// original length
		  	var original_len = input_val.length;
		  	// initial caret position 
		  	var caret_pos = input.prop("selectionStart");
		  	
		  	if (input_val.indexOf(".") >= 0) {
		    	var decimal_pos = input_val.indexOf(".");
	
		    	var left_side = input_val.substring(0, decimal_pos);
		    	var right_side = input_val.substring(decimal_pos);
	
		    	left_side = formatNumber(left_side);
		   		//right_side = formatNumber(right_side);
		    
			    // On blur make sure 2 numbers after decimal
			    if (blur === "blur") {
			      right_side += "00";
		    	}
		    
		    	// Limit decimal to only 2 digits
		    	right_side = right_side.substring(0, 3);
	
		    	if(id == 'budgetWon') {
			    	input_val = left_side + right_side + " 원";
		    	}else {
		    		input_val = left_side + right_side + " ${ trvCityList[0].currencyUnit }";
		    	}
	
		  	} else {
		    	// no decimal entered
		    	// add commas to number
		    	// remove all non-digits
		    	input_val = formatNumber(input_val);
		    	input_val = input_val ;
		    
		    	// final formatting
		    	if (blur === "blur") {
		    		if(id == 'budgetWon') {
		      			input_val += ".00 원";
		    		}else {
		    			input_val += ".00 ${ trvCityList[0].currencyUnit }";
		    		}
		    	}
		  	}
		  
		  	// send updated string to input
		  	input.val(input_val);
	
		  	// put caret back in the right position
		  	var updated_len = input_val.length;
		  	caret_pos = updated_len - original_len + caret_pos;
		  	input[0].setSelectionRange(caret_pos, caret_pos);
		}
		
		
	
	
	
		
	</script>
	
</body>
</html>




















