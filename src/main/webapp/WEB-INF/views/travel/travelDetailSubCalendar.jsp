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
		width: 49%;
		height: 300px;
		border: 1px solid black;
		margin-right: 2%;
		overflow: scroll;
		float: left;
	}
	#calendarArea {
		text-align: left;
		width: 1200px;
		white-space:nowrap; 
		overflow:auto; 
	}
	#calendarTable {
		text-align: left;
		table-layout: fixed;
	}
	#calendarTable tr th {
		width: 300px;
		text-align: center;
		border: 1px solid white;
		background: rgb(198, 151, 217);
		padding-left: 2em;
		padding-right: 2em;	
	}
	#calendarTable tr td {
		border-top: 1px solid lightgray;
	}
	
	#map{
		display: inline-block;
		width: 49%;
		height: 300px;
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
		<div class="container" id="detailSubContent" align="center">
			<div id="calendar">
				<div id="calendarArea">
					<table id="calendarTable">
						<tr>
							<th>DAY 1</th>
							<th>DAY 2</th>
							<th>DAY 3</th>
							<th>DAY 4</th>
							<th>DAY 5</th>
							<th>DAY 6</th>
							<th>DAY 7</th>
							<th>DAY 8</th>
							<th>DAY 9</th>
							<th>DAY 10</th>
						</tr>
						<% for(int i = 1; i < 25; i++) { %>
						<tr>
							<% if(i < 10) { %>
							<td>0<%= i %></td>
							<td>0<%= i %></td>
							<td>0<%= i %></td>
							<td>0<%= i %></td>
							<td>0<%= i %></td>
							<td>0<%= i %></td>
							<td>0<%= i %></td>
							<td>0<%= i %></td>
							<td>0<%= i %></td>
							<td>0<%= i %></td>
							<% }else { %>
							<td><%= i %></td>
							<td><%= i %></td>
							<td><%= i %></td>
							<td><%= i %></td>
							<td><%= i %></td>
							<td><%= i %></td>
							<td><%= i %></td>
							<td><%= i %></td>
							<td><%= i %></td>
							<td><%= i %></td>
							<% } %>
						</tr>
						<% } %>
					</table>
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
			url : "dayMapSelect.tr",
			type : "post",
			data : {day : day},
			success : function(data) {
				alert("지도에 정보 뿌릴 예정");
			}
		});
	}
</script>

</body>
</html>