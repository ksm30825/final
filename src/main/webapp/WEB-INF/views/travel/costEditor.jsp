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
								<span id="exchangeRate" style="color:purple"></span>
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
							<th width="14%">
								<span>TOTAL</span>
							</th>
							<th width="14%">
								<span>BALANCE</span>
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
							<td id="accommCostWon">
								<fmt:formatNumber value="" type="currency" />원</td>
							<td id="transpCostWon"></td>
							<td id="foodCostWon"></td>
							<td id="shoppingCostWon"></td>
							<td id="tourCostWon"></td>
							<td id="etcCostWon"></td>
							<td id="totalCostWon"></td>
							<td id="balanceWon"></td>
						</tr>
						<tr>
							<td id="accommCostLocal"></td>
							<td id="transpCostLocal"></td>
							<td id="foodCostLocal"></td>
							<td id="shoppingCostLocal"></td>
							<td id="tourCostLocal"></td>
							<td id="etcCostLocal"></td>
							<td id="totalCostLocal"></td>
							<td id="balanceLocal"></td>
						</tr>
					</tbody>
				</table>
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
								<ul class="connectedSortable menu-list costList" style="background: white">
									<c:forEach var="sch" items="${ trvDay.schList }" varStatus="st" >
										<c:if test="${ sch.trvCost ne null }">
											<li class="panel-block">
												<div class="media-left" style="width:20%">
													<c:choose >
														<c:when test="${ sch.trvCost.costType eq '숙박' }" >
															<span class="icon accomm"><i class="fas fa-bed"></i></span>
														</c:when>
														<c:when test="${ sch.trvCost.costType eq '교통' }" >
															<span class="icon transp"><i class="fas fa-taxi"></i></span>
														</c:when>
														<c:when test="${ sch.trvCost.costType eq '식비' }" >
															<span class="icon food"><i class="fas fa-utensils"></i></span>
														</c:when>
														<c:when test="${ sch.trvCost.costType eq '쇼핑' }" >
															<span class="icon shopping"><i class="fas fa-shopping-bag"></i></span>
														</c:when>
														<c:when test="${ sch.trvCost.costType eq '관광' }" >
															<span class="icon tour"><i class="fab fa-tripadvisor"></i></span>
														</c:when>
														<c:otherwise>
															<span class="icon etc"><i class="fas fa-ellipsis-h"></i></span>
														</c:otherwise>
													</c:choose>
												</div>
												<div class="media-content" style="width:70%">
													<div class="content">
														<p><strong class="costAmount">${ sch.trvCost.costAmount }</strong> 
															<small>(${ sch.trvCost.currency }) </small></p>
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
												</div>
											</li>
											
										</c:if>
									</c:forEach>
								</ul>
								<div class="panel-block">
									<button class="button is-link is-outlined is-fullwidth"
										onclick="$('#costModal').toggleClass('is-active')">가계부
										항목 추가</button>
								</div>
							</nav>
						</div>
					</c:forEach>
				</div>
			</section>
		</div>
	</div>	
	<jsp:include page="costModal.jsp" />
	
	<script>
		var rate = 1;
		var amount = 0;
		var accommCostLocal = 0.00;
		var transpCostLocal = 0.00;
		var foodCostLocal = 0.00;
		var shoppingCostLocal = 0.00;
		var tourCostLocal = 0.00;
		var etcCostLocal = 0.00;
		$(function() {
			if("${ trv.budget}" != null) {
				$("#budgetWon").val(parseFloat("${ trv.budget }"));
				amount = parseFloat("${ trv.budget }");
				formatCurrency($("#budgetWon"), "budgetWon", "blur");
				getLocalAmount();
			}
			
			
			$(".costAmount").each(function() {
				var cost = parseFloat($(this).text());
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
			
			$("#accommCostLocal").text(accommCostLocal + ' AUD');
			$("#transpCostLocal").text(transpCostLocal + ' AUD');
			$("#foodCostLocal").text(foodCostLocal + ' AUD');
			$("#tourCostLocal").text(tourCostLocal + ' AUD');
			$("#shoppingCostLocal").text(shoppingCostLocal + ' AUD');
			$("#etcCostLocal").text(etcCostLocal + ' AUD');
			$("#totalCostLocal").text((acommCostLocal + transpCostLocal + foodCostLocal + tourCostLocal 
					+ shoppingCostLocal + etcCostLocal) + ' AUD');
		
			
			
		});
	
		$("input[data-type='currency']").on({
			
		    keyup: function() {
		      formatCurrency($(this), $(this).attr("id"));
		    },
		    blur: function() { 
		      	formatCurrency($(this), $(this).attr("id"), "blur");
		      
		      	if($(this).attr("id") == "budgetWon") {
		    	  
		    		var budgetWon = $(this).val();
		    	  	var amountStr = budgetWon.substring(0, budgetWon.length - 2).replace(/,/g, "");
					amount = parseFloat(amountStr);
		    	  	if(amountStr == "") {
						$(this).val(0);
						formatCurrency($(this), "budgetWon");
						return;
					}
					
					getLocalAmount();
					
					$.ajax({
						url:"updateBudget.trv",
						type:"POST",
						data:{budget:amount, trvId:"${ trv.trvId }"},
						success:function(data) {
							console.log(data);
						},
						error:function(err) {
							alert("err", err);
						}
					});
		      }
		      
		    }
		});
	
		
		function getLocalAmount() {
			
			
			$.ajax({
				url:'http://data.fixer.io/api/latest?access_key=92d8dd4822a4117acfc28399dc24faff',
				dataType:'jsonp',
				success:function(json) {
					
					var krw = json.rates.KRW;
					var local = json.rates.${ trvCityList[0].currencyUnit };
					
					rate = Math.round((krw/local) * 1000) / 1000;
					$("#exchangeRate").text(rate);
					$("#budgetLocal").val(amount / rate);
					formatCurrency($("#budgetLocal"), "budgetLocal", "blur");
				},
				error:function(err) {
					alert("err", err);
				}
				
			});
			
			
		}
		
	
		function formatNumber(n) {
		  // format number 1000000 to 1,234,567
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
	
		   		right_side = formatNumber(right_side);
		    
			    // On blur make sure 2 numbers after decimal
			    if (blur === "blur") {
			      right_side += "00";
		    	}
		    
		    	// Limit decimal to only 2 digits
		    	right_side = right_side.substring(0, 2);
	
		    	// join number by .
		    	if(id == 'budgetWon') {
			    	input_val = left_side + "." + right_side + " 원";
		    	}else {
		    		input_val = left_side + "." + right_side + " ${ trvCityList[0].currencyUnit }";
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
		
		
	
	
	
		/* $("#budgetWon").change(function() {
			
			var budgetWon = $(this).val();
			if(budgetWon <= 0) {
				return;
			}
			$.ajax({
				url:'http://data.fixer.io/api/latest?access_key=92d8dd4822a4117acfc28399dc24faff',
				dataType:'jsonp',
				success:function(json) {
					
					var krw = json.rates.KRW;
					var local = json.rates.${ trvCityList[0].currencyUnit };
					
					var rate = Math.round((krw/local) * 1000) / 1000;
					$("#exchangeRate").text(rate);
					$("#budgetLocal").val(budgetWon * rate);
				},
				error:function(err) {
					alert("err", err);
				}
				
			});
			
			
			$.ajax({
				url:"updateBudget.trv",
				type:"POST",
				data:{budget:budgetWon, trvId:"${ trv.trvId }"},
				success:function(data) {
					console.log(data);
				},
				error:function(err) {
					alert("err", err);
				}
			});
		}); */
	</script>
	
</body>
</html>




















