<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#calendar{
		display: inline-block;
		width: 35%;
		height: 400px;
		border: 1px solid black;
		margin-right: 2%;
		overflow: scroll;
		overflow-x:hidden;
		float: left;
	}
	#calendarArea {
		text-align: left;
		width: 100%;
		white-space:nowrap; 
		overflow:auto; 
	}
	#calendarTable {
		width: 100%;
	}
	#calendarTable th {
		width: 20%;
		text-align: center;
	}
	#calendarTable td {
		text-align: center;
	}
	
	#map{
		display: inline-block;
		width: 62%;
		height: 400px;
		border: 1px solid black;
		overflow: scroll;
		float: right;
	}
	#mapDaySelect {
		width: 100px;
		float: right;
		margin: 1em;
	}
</style>
<body>
	<!-- 서브메뉴 본문(일정표) -->
	<section class="section" id="detailSub">
		<div id="detailSubContent" align="center">
			
			<div id="calendar">
				<div class="calendarArea">
				
					<!-- DAY1 -->
					<div class="tabs is-fullwidth" style="margin-bottom: 0.5em;">
						<ul>
							<li>
								<a>
								<span class="icon"><i class="fa fa-angle-left"></i></span>
								</a>
							</li>
							<li>
								<span><strong>DAY 1</strong></span>
							</li>
							<li>
								<a>
								<span class="icon"><i class="fa fa-angle-right"></i></span>
								</a>
							</li>
						</ul>
					</div>
					<div align="right" style="border-bottom: 1px solid lightgray; padding-bottom: 0.3em;">
						<input type="checkbox" id="timeCheck" checked="checked">
						<label for="timeCheck">시간 표시</label>
					</div>
					<table id="calendarTable">
						<% for(int i = 1; i < 25; i++) { %>
						<tr>
							<% if(i < 10) { %>
							<th class="times">0<%= i %></th>
							<% }else { %>
							<th class="times"><%= i %></th>
							<% } %>
							<td>
								<span><i class="fas fa-map-marker-alt" style="color: #8e44ad"></i>&nbsp; 장소이름</span>
							</td>
						</tr>
						<% } %>
					</table>
					<!-- DAY1 끝 -->
					
				</div>
			</div>
			
			<div id="map">
				<select id="mapDaySelect" onchange="dayMapSelect()">
					<option value="1">DAY 1</option>
					<option value="2">DAY 2</option>
					<option value="3">DAY 3</option>
				</select>
				지도~~
			</div>
		</div>
	</section>
	
<script>
	function dayMapSelect() {
		var day = $("#mapDaySelect").val();
		console.log(day);
		
		$.ajax({
			url : "dayMapSelect.tb",
			type : "post",
			data : {day : day},
			success : function(data) {
				alert("지도에 정보 뿌릴 예정");
			}
		});
	}
	
	$("#timeCheck").change(function() {
		if($(this).prop("checked")) {
			console.log("시간표시");
			$(".times").removeAttr("style");
		}else {
			console.log("시간해제");
			$(".times").css("display","none");
		}
	});
</script>

</body>
</html>