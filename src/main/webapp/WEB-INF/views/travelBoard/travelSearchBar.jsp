<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	select {
		width: 12%;
		height: 2em;
		align: right;
		border-radius: 5px;
	}
	input {
		width: 15%;
		height: 2em;
		border-radius: 5px;
	}
	#searchIcon {
		display: inline-block;
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	
	<!-- 본문 -->
	<section class="section" id="travelSearchBarArea">
		<br>
		<div class="container" style="text-align: right;">
			<select>
				<option>최신순</option>
				<option>좋아요순</option>
				<option>최신순</option>
			</select>
			<select>
				<option>-- 여행스타일 --</option>
				<option>스타일1</option>
				<option>스타일2</option>
			</select>
			<select>
				<option>-- 국가명 --</option>
				<option>나라1</option>
				<option>나라2</option>
			</select>
			<input type="text" placeholder="여행을 검색하세요" style="text-align: center">
			&nbsp; <div id="searchIcon" onclick="searchTravelList()"><i class="fas fa-search"></i></div>
		</div>
		<hr>
	</section>
</body>

<script>
	function searchTravelList() {
		location.href='searchTravelList.tr';
	}
</script>
</html>