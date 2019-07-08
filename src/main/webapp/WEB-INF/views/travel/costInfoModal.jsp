<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal" id="costInfoModal">
		<div class="modal-background"></div>
		<div class="modal-card" style="width:480px">
			<header class="modal-card-head">
				<span class="icon is-large" style="color:purple"><i class="fas fa-2x fa-wallet"></i></span>
				<p class="modal-card-title">가계부 항목</p>
				<button class="delete" aria-label="close"></button>
			</header>
			<section class="modal-card-body">
				<form id="costUpdateForm" method="POST">
					<div class="field">
						<p class="control">
							<input type="hidden" value="${ trv.trvId }" name="trvId">
							<input type="hidden" name="costId" id="costUpdateId"/>
							<input type="hidden" value="0" id="costUpdateSchId" />
							<input class="input is-primary is-large" type="text" placeholder="내용 입력"
							name="costContent" id="costUpdateContent">
						</p>
					</div>
					<div class="field is-horizontal">
						<div class="field-label is-normal">
							<label class="label">일자</label>
						</div>
						<div class="field-body">
							<div class="field">
								<p class="control is-expanded has-icons-left">
									<span class="icon is-small is-left"><i class="far fa-calendar-alt"></i></span>
									<span class="select"> 
										<select name="dayId" id="costUpdateDayId">
											<c:forEach var="trvDay" items="${ trvDayList }" varStatus="st">
												<option value="${ trvDay.dayId }">DAY ${ trvDay.dayNumber }</option>
											</c:forEach>
										</select>
									</span>
								</p>
							</div>
						</div>
					</div>
					<div class="field is-horizontal">
						<div class="field-label is-normal">
							<label class="label">경비</label>
						</div>
						<div class="field-body">
							<div class="field is-grouped">
								<p class="control is-expanded has-icons-left">
									<span class="icon is-small is-left"><i class="fas fa-tasks"></i></span>
									<span class="select"> 
										<select name="costType" id="costUpdateType">
											<option>숙박</option>
											<option>교통</option>
											<option>식비</option>
											<option>쇼핑</option>
											<option>관광</option>
											<option>기타</option>
										</select>
									</span>
								</p>
							</div>
							<div class="field">
								<p class="control is-expanded has-icons-left">
									<span class="icon is-small is-left"><i class="fas fa-receipt"></i></span>
									<input class="input" type="number" value="0" name="costAmount" id="costUpdateAmount"/>
								</p>
							</div>
							<div class="field">
								<p class="control is-expanded has-icons-left">
									<span class="icon is-small is-left"><i class="fas fa-dollar-sign"></i></span>
									<span class="select"> 
										<select name="currency" id="costUpdateCurrency">
											<c:forEach var="trvCity" items="${ trvCityList }" varStatus="st" >
												<option>${ trvCity.currencyUnit }</option>
											</c:forEach>
										</select>
									</span>
								</p>
							</div>
						</div>
					</div>
				</form>
			</section>
			<footer class="modal-card-foot" >
				<a class="button is-primary" id="costUpdateBtn">완료</a> 
				<a class="button cancelBtn">취소</a>
			</footer>
		</div>
	</div>
	<script>
		var costUpdateContent = $("#costUpdateContent");
		var costUpdateDayId = $("#costUpdateDayId");
		var costUpdateType = $("#costUpdateType");
		var costUpdateAmount = $("#costUpdateAmount");
		var costUpdateCurrency = $("#costUpdateCurrency");
		$(function() {
			$('.modal-background, .modal-card-head>.delete, .cancelBtn').click(function() {
        		$('html').removeClass('is-clipped');
        	    $(this).parents(".modal").removeClass('is-active');
        	    costUpdateContent.val("");
        	    costUpdateDayId.children().eq(0).prop("selected", true);
        	    costUpdateType.children().eq(0).prop("selected", true);
        	    costUpdateAmount.val(0);
        	    costUpdateCurrency.children().eq(0).prop("selected", true);
        	});
        	
        	
        	$("#costUpdateBtn").click(function() {
        		if(costUpdateContent.val() == "") {
        			alert("경비내용을 입력해주세요");
        		}else if(costUpdateAmount.val() == 0) {
        			alert("금액을 입력해주세요");
        		}else {
        			var form = $("#costUpdateForm").serialize();
        			$.ajax({
        				url:"updateCost.trv",
        				type:"POST",
        				data:form,
        				success:function(data) {
        					$('html').removeClass('is-clipped');
        					$('#costInfoModal').removeClass('is-active');
        					costUpdateContent.val("");
        	        	    costUpdateDayId.children().eq(0).prop("selected", true);
        	        	    costUpdateType.children().eq(0).prop("selected", true);
        	        	    costUpdateAmount.val(0);
        	        	    costUpdateCurrency.children().eq(0).prop("selected", true);
        					
        	        	    
        					var cost = data.trvCost;
        					console.log(cost);
        					var dayId = cost.dayId;
        					var type = cost.costType;
        					
        					
        	        	   	var li = $("#cost_" + cost.costId);
        					
        					switch(type) {
        					case '숙박': if(!li.children().eq(0).children().is(".accomm")) {
        									li.children().eq(0).children().remove();
        									li.children().eq(0).append($('<span class="icon costType accomm"><i class="fas fa-bed"></i></span>'));
        								};break;
        					case '교통':if(!li.children().eq(0).children().is(".transp")) {
        									li.children().eq(0).children().remove();
											li.children().eq(0).append($('<span class="icon costType transp"><i class="fas fa-taxi"></i></span>'));
										};break;
        					case '식비':if(!li.children().eq(0).children().is(".food")) {
        									li.children().eq(0).children().remove();
											li.children().eq(0).append($('<span class="icon costType food"><i class="fas fa-utensils"></i></span>'));
										};break;
        					case '쇼핑':if(!li.children().eq(0).children().is(".shopping")) {
        									li.children().eq(0).children().remove();
											li.children().eq(0).append($('<span class="icon costType shopping"><i class="fas fa-shopping-bag"></i></span>'));
										};break;
        					case '관광':if(!li.children().eq(0).children().is(".tour")) {
        									li.children().eq(0).children().remove();
											li.children().eq(0).append($('<span class="icon costType tour"><i class="fas fa-tripadvisor"></i></span>'));
										};break;
        					case '기타':if(!li.children().eq(0).children().is(".etc")) {
        									li.children().eq(0).children().remove();
											li.children().eq(0).append($('<span class="icon costType etc"><i class="fas fa-ellipsis-h"></i></span>'));
										};break;
        					}
        					
        					li.find(".costAmount").text(cost.costAmount);
        					li.find(".costCurrency").text(cost.currency);
        					li.find(".costContent").text(cost.costContent);
        					
        					var ul = li.parent();
        					console.log("ul", ul);
        					
        					if(ul.parent().attr("id") != "day" + dayId + "Cost") {
        						$("#day" + dayId + "Cost").find(".costList").append(li);
        					}        					
        					
        					updateSummary();
        					
        					if($("#costUpdateSchId").val() != 0) {
        						var schId = $("#costUpdateSchId").val();
        						$(".sch" + schId + "Block").find(".costType").text(type + " : ");
								$(".sch" + schId + "Block").find(".costAmount").text(parseFloat(cost.costAmount));
								$(".sch" + schId + "Block").find(".costCurrency").text("(" + cost.currency + ") /");
								$("#sch" + schId + "CardSection").find(".costType").text(type);
								$("#sch" + schId + "CardSection").find(".costAmount").text(parseFloat(cost.costAmount));
								$("#sch" + schId + "CardSection").find(".costCurrency").text(cost.currency);
        					}
        					
        				},
        				error:function(err) {
        					alert(err);
        				}
        			});
        		}
        		
        	});
		});
	</script>
</body>
</html>