<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
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

.pagination {
	width: 70%;
	margin-right: auto !important;
	margin-left: auto !important;
}

.pagination-list {
	margin-left: 30%;
}

.is-success {
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>
	<jsp:include page="../../common/adminMainNav.jsp" />
	<div class="columns">
		<div class="column">
			<section class="section" id="button">
				<div class="columns">
					<div class="column">
						<div class="buttons">
							<a class="button is-primary is-rounded" href="adminNoticeList.ad">공지사항</a>
							<a class="button is-info is-rounded" href="adminMoreQuestionList.ad">자주 묻는 질문</a>
						</div>
					</div>
				</div>
				<h1 class="title" style="text-align: center;">공지사항</h1>
				<hr>
				<table class="table">
					<thead>
						<tr>
							<th>공지번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><b>1</b></td>
							<td>사이트 이용약관</td>
							<td>2019/07/10</td>
							<td>관리자</td>
							<td>100</td>
						</tr>
						<tr>
							<td><b>2</b></td>
							<td>사이트 이용약관</td>
							<td>2019/07/10</td>
							<td>관리자</td>
							<td>100</td>
						</tr>
						<tr>
							<td><b>3</b></td>
							<td>사이트 이용약관</td>
							<td>2019/07/10</td>
							<td>관리자</td>
							<td>100</td>
						</tr>
						<tr>
							<td><b>4</b></td>
							<td>사이트 이용약관</td>
							<td>2019/07/10</td>
							<td>관리자</td>
							<td>100</td>
						</tr>
						<!-- <tr class="is-selected"> -->
						<tr>
							<td><b>5</b></td>
							<td>사이트 이용약관</td>
							<td>2019/07/10</td>
							<td>관리자</td>
							<td>100</td>
						</tr>
					</tbody>
				</table>
			</section>
			<div class="buttons">
				<a class="button is-success is-rounded" href="insertNoticeForm.ad">작성하기</a>
			</div>
			<section class="section" id="pagination">
				<nav class="pagination is-rounded" role="navigation"
					aria-label="pagination">
					<ul class="pagination-list">
						<li><a class="pagination-previous">이전</a></li>
						<li><a class="pagination-link" aria-label="Goto page 1">1</a></li>
						<li><a class="pagination-link" aria-label="Goto page 45">45</a></li>
						<li><a class="pagination-link is-current"
							aria-label="Page 46" aria-current="page">46</a></li>
						<li><a class="pagination-link" aria-label="Goto page 47">47</a></li>
						<li><a class="pagination-link" aria-label="Goto page 86">86</a></li>
						<li><a class="pagination-next">다음</a></li>
					</ul>
				</nav>
				<br>
			</section>
		</div>
	</div>
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
			location = "adminNoticeDetail.ad";
		});
	});
</script>
</html>