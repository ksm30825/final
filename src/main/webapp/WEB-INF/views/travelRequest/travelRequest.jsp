<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.is-half {
	margin-top: 5%;
	margin-left: auto;
	margin-right: auto;
}

.message-header {
	font-size: 1.5em;
}

.message-header b {
	margin-right: auto;
	margin-left: auto;
}

.table {
	margin-right: auto;
	margin-left: auto;
	width: 100%;
}

.table th {
	text-align: center !important;
}

.table td {
	text-align: center !important;
}

.pagination {
	width: 70%;
	margin-right: auto !important;
	margin-left: auto !important;
}

.pagination-list {
	margin-left: 30%;
}

.table tr {
	cursor: pointer;
}

.button {
	margin-left: 4%;
}
</style>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	<br>
	<br>
	<br>
	<br>
	<article class="message is-info">
		<div class="message-header">
			<b>여행 의뢰 게시판</b>
		</div>
	</article>
	<hr>
	<br>
	<section class="section" id="table">
		<table class="table">
			<a class="button is-info is-active" href="request.tr"> 의뢰하기 </a>
			<br>
			<br>
			<thead>
				<tr>
					<th>의뢰번호</th>
					<th>제목</th>
					<th>의뢰자</th>
					<th>의뢰가격</th>
					<th>예산</th>
					<th>마감일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><b>1</b></td>
					<td>여행제목</td>
					<td>user01</td>
					<td>30,000원</td>
					<td>700,000원</td>
					<td>2019/07/10</td>
				</tr>
				<tr>
					<td><b>2</b></td>
					<td>여행제목</td>
					<td>user01</td>
					<td>30,000원</td>
					<td>700,000원</td>
					<td>2019/07/10</td>
				</tr>
				<tr>
					<td><b>3</b></td>
					<td>여행제목</td>
					<td>user01</td>
					<td>30,000원</td>
					<td>700,000원</td>
					<td>2019/07/10</td>
				</tr>
				<tr>
					<td><b>4</b></td>
					<td>여행제목</td>
					<td>user01</td>
					<td>30,000원</td>
					<td>700,000원</td>
					<td>2019/07/10</td>
				</tr>
				<!-- <tr class="is-selected"> -->
				<tr>
					<td><b>5</b></td>
					<td>여행제목</td>
					<td>user01</td>
					<td>30,000원</td>
					<td>700,000원</td>
					<td>2019/07/10</td>
				</tr>
			</tbody>
		</table>
	</section>

	<section class="section" id="pagination">
		<hr>
		<nav class="pagination is-rounded" role="navigation"
			aria-label="pagination">
			<ul class="pagination-list">
				<li><a class="pagination-previous">이전</a></li>
				<li><a class="pagination-link" aria-label="Goto page 1">1</a></li>
				<li><a class="pagination-link" aria-label="Goto page 45">45</a></li>
				<li><a class="pagination-link is-current" aria-label="Page 46"
					aria-current="page">46</a></li>
				<li><a class="pagination-link" aria-label="Goto page 47">47</a></li>
				<li><a class="pagination-link" aria-label="Goto page 86">86</a></li>
				<li><a class="pagination-next">다음</a></li>
			</ul>
		</nav>
		<br>
	</section>
</body>
<script>
	$(function() {
		$(".table").find("td").mouseenter(function() {
			$(this).parents("tr").css({
				"background" : "#209CEE",
				"cursor" : "pointer",
				"color" : "white"
			});
		}).mouseout(function() {
			$(this).parents("tr").css({
				"background" : "white",
				"color" : "black"
			});
		}).click(function() {
			console.log($(this).parents().children("td").eq(0).text());
			location = "requestDetail.tr";
		});
	});
</script>
</html>