<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal" id="scheduleInfoModal">
		<div class="modal-background"></div>
		<div class="modal-card" style="width:480px">
			<header class="modal-card-head">
				<span class="icon is-large" style="color:purple"><i class="fas fa-2x fa-edit"></i></span>
				<p class="modal-card-title">일정 정보</p>
				<button class="delete" aria-label="close"></button>
			</header>
			<section class="modal-card-body">
				
				<div class="field">
					<p class="control">
						<input class="input is-primary is-large" type="text" placeholder="일정 제목 입력">
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
								<input class="input" type="text" id="costAmount" placeholder="장소정보없음"
									readOnly />
							</p>
						</div>
					</div>
				</div>
				<div class="field is-horizontal">
					<div class="field-label is-normal">
						<label class="label travelCityLabel">일자/시간</label>
					</div>
					<div class="field-body">
						<div class="field is-grouped">
							<p class="control is-expanded has-icons-left">
								<span class="icon is-small is-left"><i class="far fa-calendar-alt"></i></span>
								<span class="select"> 
									<select>
										<option>DAY 1</option>
										<option>DAY 2</option>
										<option>DAY 3</option>
										<option>DAY 4</option>
									</select>
								</span>
							</p>
						</div>
						<div class="field is-narrow">
							<p class="control is-expanded has-icons-left" style="margin:0">
								<span class="icon is-small is-left"><i class="far fa-clock"></i></span> 
								<input class="input" type="number" min="0" max="23" value="1">
							</p>
							<p class="help">시작시간</p>
						</div>
						<div class="field is-narrow">
							<p class="control is-expanded has-icons-left" style="margin:0">
								<span class="icon is-small is-left"><i class="far fa-clock"></i></span> 
								<input class="input" type="number" min="0" max="23" value="1">
							</p>
							<p class="help">종료시간</p>
						</div>
					</div>
				</div>
				<div class="field is-horizontal">
					<div class="field-label is-normal">
						<label class="label travelCityLabel">경비</label>
					</div>
					<div class="field-body">
						<div class="field is-grouped">
							<p class="control is-expanded has-icons-left">
								<span class="icon is-small is-left"><i class="fas fa-tasks"></i></span>
								<span class="select"> 
									<select>
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
								<input class="input" type="text" id="costAmount" placeholder="가격 입력(현지화)"/>
							</p>
						</div>
					</div>
				</div>
				<div class="field is-horizontal">
					<div class="field-label is-normal">
						<label class="label travelCityLabel">교통</label>
					</div>
					<div class="field-body">
						<div class="field">
							<p class="control is-expanded has-icons-left">
								<span class="icon is-small is-left"><i class="fas fa-subway"></i></span>
								<input class="input" type="text" id="costAmount" placeholder="교통정보 입력"/>
							</p>
						</div>
					</div>
				</div>
			</section>
			<footer class="modal-card-foot" >
				<a class="button is-primary okBtn">완료</a> 
				<a class="button cancelBtn">취소</a>
			</footer>
		</div>
	</div>
	<script>
		$(function() {
			$('.modal-background, .modal-card-head>.delete, .cancelBtn').click(function() {
        		$('html').removeClass('is-clipped');
        	    $(this).parents(".modal").removeClass('is-active');
        	});
        	
        	$("#startPicker, #endPicker").datepicker();
        	
        	$(".cityPlusBtn").click(function() {
        		var field = $(this).parents(".travelCityField").clone(true);
        		field.find(".travelCityLabel").text('');
        		field.insertAfter($(this).parents(".travelCityField"));
        	});
        	$(".okBtn").click(function() {
        		location.href="showTrvEditor.trv";
        	});
		});
	</script>
</body>
</html>