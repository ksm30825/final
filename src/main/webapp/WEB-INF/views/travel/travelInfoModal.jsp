<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal" id="travelInfoModal">
		<div class="modal-background"></div>
		<div class="modal-card" style="width:480px">
			<header class="modal-card-head">
				<span class="icon is-large"><i class="fas fa-2x fa-plane-departure"></i></span>
				<p class="modal-card-title">여행 정보</p>
				<button class="delete" aria-label="close"></button>
			</header>
			<section class="modal-card-body">
				
				<div class="field">
					<p class="control">
						<input class="input is-primary is-large" type="text" placeholder="여행 제목 입력">
					</p>
				</div>
				<div class="field is-horizontal travelCityField">
					<div class="field-label is-normal">
						<label class="label travelCityLabel">여행지</label>
					</div>
					<div class="field-body">
						<div class="field is-grouped">
							<p class="control is-expanded has-icons-left">
								<span class="icon is-small is-left"><i class="fas fa-globe-americas"></i></span>
								<span class="select"> 
									<select>
										<option>호주</option>
										<option>일본</option>
										<option>중국</option>
										<option>미국</option>
									</select>
								</span>
							</p>
						</div>
						<div class="field">
							<p class="control is-expanded has-icons-left has-icons-right">
								<span class="icon is-small is-left"><i class="fas fa-location-arrow"></i></span> 
								<span class="select"> 
									<select>
										<option>시드니</option>
										<option>멜버른</option>
										<option>브리즈번</option>
										<option>퍼스</option>
									</select>
								</span>
							</p>
						</div>
						<div class="field" style="line-height:40px" align="center">
							<a style="font-size:2em; color:purple" data-tooltip="여행지 추가" class="cityPlusBtn">+</a>
						</div>
					</div>
				</div>
				<div class="field is-horizontal">
					<div class="field-label is-normal">
						<label class="label">여행 기간</label>
					</div>
					<div class="field-body">
						<div class="field is-grouped">
							<p class="control is-expanded has-icons-left">
								<span class="icon is-small is-left"><i class="fas fa-calendar-check"></i></span>
								<input class="input" type="text" id="startPicker" placeholder="시작일"/>
							</p>
						</div>
						<div class="field">
							<p class="control is-expanded has-icons-left has-icons-right">
								<span class="icon is-small is-left"><i class="far fa-calendar-check"></i></span> 
								<input class="input" type="text" id="endPicker" placeholder="종료일" />
							</p>
						</div>
					</div>
				</div>
				<div class="field is-horizontal">
					<div class="field-label is-normal">
						<label class="label">인원수</label>
					</div>
					<div class="field-body">
						<div class="field is-narrow">
							<div class="control">
								<div class="is-fullwidth">
									<input class="input" type="number" min="1" max="20" value="1">
								</div>
							</div>
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