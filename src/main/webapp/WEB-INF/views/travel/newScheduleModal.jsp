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
	<div class="modal" id="newScheduleModal">
		<div class="modal-background"></div>
		<div class="modal-card" style="width:600px">
			<header class="modal-card-head">
				<span class="icon is-large" style="color:purple"><i class="fas fa-2x fa-edit"></i></span>
				<p class="modal-card-title">일정 정보</p>
				<button class="delete" aria-label="close"></button>
			</header>
			<section class="modal-card-body">
				<form action="insertSch.trv" method="post" id="newSchForm">
					<div class="field">
						<p class="control">
							<input type="hidden" value="${ trv.trvId }" name="trvId">
							<input class="input is-primary is-large" type="text" placeholder="일정 제목 입력" name="schTitle">
						</p>
					</div>
					<div class="field is-horizontal">
						<div class="field-label is-normal">
							<label class="label travelCityLabel">장소</label>
						</div>
						<div class="field-body">
							<div class="field">
								<p class="control is-expanded has-icons-left">
									<span class="icon is-small is-left"><i class="fas fa-map-marker-alt"></i></span>
									<!-- <input type="hidden" name="plcId"> -->
									<input class="input" type="text" id="costAmount" placeholder="장소정보없음"
										readOnly name="plcName"/>
								</p>
							</div>
						</div>
					</div>
					<div class="field is-horizontal">
						<div class="field-label is-normal">
							<label class="label travelCityLabel">일자</label>
						</div>
						<div class="field-body">
							<div class="field is-grouped">
								<p class="control is-expanded has-icons-left">
									<span class="icon is-small is-left"><i class="far fa-calendar-alt"></i></span>
									<span class="select"> 
										<select name="dayId">
											<c:forEach var="trvDay" items="${ trvDayList }" varStatus="st">
												<option value="${ trvDay.dayId }">DAY ${ trvDay.dayNumber }</option>
											</c:forEach>
										</select>
									</span>
								</p>
							</div>
							<div class="field">
								<p class="control">
									<label class="checkbox"> 
										<input type="checkbox" name="isTimeset">시간 지정 안함
									</label>
								</p>
							</div>
						</div>
					</div>
					<div class="field is-horizontal">
						<div class="field-label is-normal">
							<label class="label travelCityLabel">시간</label>
						</div>
						<div class="field-body">
							<div class="field">
								<p class="control is-expanded has-icons-left" style="margin:0">
									<span class="icon is-small is-left"><i class="far fa-clock"></i></span> 
									<input class="input" type="time" min="0" max="23" value="1" name="startTime">
								</p>
								<p class="help">시작시간</p>
							</div>
							<div class="field">
								<p style="font-size:20px">~</p>
							</div>
							<div class="field">
								<p class="control is-expanded has-icons-left" style="margin:0">
									<span class="icon is-small is-left"><i class="far fa-clock"></i></span> 
									<input class="input" type="time" min="0" max="23" value="1" name="endTime">
								</p>
								<p class="help">종료시간</p>
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
										<select name="costType">
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
									<input class="input" type="text" placeholder="현지화 가격 입력 (선택)" 
									name="costAmount" />
								</p>
							</div>
						</div>
					</div>
					<div class="field is-horizontal">
						<div class="field-label is-normal">
							<label class="label">교통</label>
						</div>
						<div class="field-body">
							<div class="field">
								<p class="control is-expanded has-icons-left">
									<span class="icon is-small is-left"><i class="fas fa-subway"></i></span>
									<input class="input" type="text" placeholder="교통정보 입력(선택)"
									name="schTransp"/>
								</p>
							</div>
						</div>
					</div>
				</form>
			</section>
			<footer class="modal-card-foot" >
				<a class="button is-primary" id="submitSchBtn">완료</a> 
				<a class="button cancelBtn">취소</a>
			</footer>
		</div>
	</div>
	<script>
		var title =  $("input[name=schTitle]");
		var dayId = $("select[name=dayId]");
		var isTimeset = $("input[name=isTimeset]");
		var startTime = $("input[name=startTime]");
		var endTime = $("input[name=endTime]");
		var costAmount = $("input[name=costAmount]");
		var transp = $("input[name=schTransp]");
		$(function() {
			defaultModal = $("#newScheduleModal").children().clone(true);
			
			$('.modal-background, .modal-card-head>.delete, .cancelBtn').click(function() {
        		$('html').removeClass('is-clipped');
        	    $(this).parents(".modal").removeClass('is-active');
        	   	title.val('');
        	   	dayId.val('');
        	   	isTimeset.prop("checked", false);
        	   	startTime.val('');
        	   	endTime.val('');
        	   	costAmount.val('');
        	   	transp.val('');
        		
        	});
			
			$("input[name=isTimeset]").click(function() {
				if($(this).prop("checked")) {
					startTime.val('');
	        		endTime.val('');
				}
			});

        	$("#submitSchBtn").click(function() {
        		console.log("start : " + startTime);
        		console.log("end : " + endTime);
        		if(title.val() == '') {
        			alert("일정제목을 입력해주세요.");
        		}else if(!isTimeset.prop("checked") && (startTime.val() == '' || endTime.val() == '')) {
        			alert('시간을 지정하지 않으시려면 시간미지정 박스에 체크해주세요.');
        		}else if(startTime.val() > endTime.val()) {
        			alert('시작시간과 종료시간을 다시 확인하세요');
        		}else {
        			$("#newSchForm").submit();
        		}
        	});
		});
	</script>
</body>
</html>