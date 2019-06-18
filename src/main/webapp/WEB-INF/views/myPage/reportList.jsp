<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

.pagination {
	width: 70%;
	margin-right: auto !important;
	margin-left: auto !important;
}

.pagination-list {
	margin-left: 30%;
}
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp"/>
	<jsp:include page="../common/myPageHeader.jsp"/>
	<div class="columns">
		<div class="column">
			<section class="section" id="button">
				<hr>
				<div class="columns">
					<div class="column cal">
						<div class="buttons">
							<a class="button is-primary is-rounded" href="goInquiry.mp">문의하기</a>
							<a class="button is-info is-rounded" href="myInquiryList.mp">나의 문의 내역</a>
							<a class="button is-link is-rounded" href="reportList.mp">신고내역</a>
						</div>
					</div>
				</div>
			</section>
			<section class="section" id="table">

				<hr>
				<table class="table">

					<thead>
						<tr>
							<th>신고번호</th>
							<th>구분</th>
							<th>신고 종류</th>
							<th>신고일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><b>1</b></td>
							<td>채팅방</td>
							<td>욕설 및 비방</td>
							<td>2019/07/10</td>
							<td>처리완료</td>
						</tr>
						<tr>
							<td><b>2</b></td>
							<td>여행 의뢰</td>
							<td>부적절 게시물</td>
							<td>2019/07/10</td>
							<td>처리중</td>
						</tr>
						<tr>
							<td><b>3</b></td>
							<td>리뷰</td>
							<td>욕설 및 비방</td>
							<td>2019/07/10</td>
							<td>처리중</td>
						</tr>
						<tr>
							<td><b>4</b></td>
							<td>채팅방</td>
							<td>욕설 및 비방</td>
							<td>2019/07/10</td>
							<td>처리완료</td>
						</tr>
						<!-- <tr class="is-selected"> -->
						<tr>
							<td><b>5</b></td>
							<td>채팅방</td>
							<td>욕설 및 비방</td>
							<td>2019/07/10</td>
							<td>처리중</td>
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
	$(function () {
		$(".table").find("td").mouseenter(function () {
			$(this)
			.parents("tr")
			.css({"background":"#209CEE","cursor":"pointer", "color":"white"});
		}).mouseout(function() {
			$(this)
			.parents("tr")
			.css({"background":"white", "color":"black"});
		}).click(function () {
			console.log($(this).parents().children("td").eq(0).text());
			location = "reportDetail.mp";
		});
	});
</script>
</html>