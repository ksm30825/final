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
	width: 70%;
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
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	<jsp:include page="../common/myPageHeader.jsp" />
	<div class="columns">
		<div class="column">
			<section class="section" id="button">
				<hr>
				<div class="columns">
					<div class="column">
						<div class="buttons">
							<a class="button is-primary is-rounded" onclick="myRequest();">나의
								의뢰</a> <a class="button is-info is-rounded" onclick="myPlan();">나의
								설계</a> <a class="button is-link is-rounded">미리작성</a>
						</div>
					</div>
				</div>
			</section>
			<section class="section" id="table">

				<hr>
				<table class="table">

					<thead>
						<tr>
							<th>의뢰번호</th>
							<th>제목</th>
							<th>마감일</th>
							<th>의뢰가격</th>
							<th>채택상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><b>1</b></td>
							<td>의뢰제목</td>
							<td>2019/07/10</td>
							<td>30,000원</td>
							<td>미채택</td>
						</tr>
						<tr>
							<td><b>2</b></td>
							<td>의뢰제목</td>
							<td>2019/07/10</td>
							<td>30,000원</td>
							<td>미채택</td>
						</tr>
						<tr>
							<td><b>3</b></td>
							<td>의뢰제목</td>
							<td>2019/07/10</td>
							<td>30,000원</td>
							<td>미채택</td>
						</tr>
						<tr>
							<td><b>4</b></td>
							<td>의뢰제목</td>
							<td>2019/07/10</td>
							<td>30,000원</td>
							<td>미채택</td>
						</tr>
						<!-- <tr class="is-selected"> -->
						<tr>
							<td><b>5</b></td>
							<td>의뢰제목</td>
							<td>2019/07/10</td>
							<td>30,000원</td>
							<td>미채택</td>
						</tr>
					</tbody>
				</table>
			</section>
			<section class="section" id="pagination">
				<hr>
				<nav class="pagination is-rounded" role="navigation" aria-label="pagination">
					<ul class="pagination-list">
						<li><a class="pagination-previous">이전</a></li>
						<li><a class="pagination-link" aria-label="Goto page 1">1</a></li>
						<li><span class="pagination-ellipsis">…</span></li>
						<li><a class="pagination-link" aria-label="Goto page 45">45</a></li>
						<li><a class="pagination-link is-current"
							aria-label="Page 46" aria-current="page">46</a></li>
						<li><a class="pagination-link" aria-label="Goto page 47">47</a></li>
						<li><span class="pagination-ellipsis">…</span></li>
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
			location = "requestDetail.tr";
		});
	});

	function myRequest() {
		location = "myRequestList.mr";
	}
	function myPlan() {
		location = "myRequestPlan.mr";
	}
</script>
</html>