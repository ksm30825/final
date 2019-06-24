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
	width: 80%;
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
	<jsp:include page="../common/mainNav.jsp" />
	<%-- <jsp:include page="../common/myPageHeader.jsp" /> --%>
	<div class="columns">
		<div class="column">
			<section class="section" id="headerSection">
				<jsp:include page="../common/myPageHeader.jsp" />
				<hr>
				<div class="columns">
					<div class="column cal">
						<div class="buttons">
							<a class="button is-primary is-rounded" href="goInquiry.mr">문의하기</a>
							<a class="button is-info is-rounded" href="myInquiryList.mr">나의
								문의 내역</a> <a class="button is-link is-rounded" href="paneltyList.pe">신고내역</a>
						</div>
					</div>
				</div>
			</section>
			<!-- <section class="section" id="button"> -->
			<!-- </section> -->
			<section class="section" id="table">

				<hr>
				<table class="table">

					<thead>
						<tr>
							<th>문의 번호</th>
							<th>종류</th>
							<th>제목</th>
							<th>작성일</th>
							<th>문의 상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><b>1</b></td>
							<td>이용</td>
							<td>여행 의뢰 어떻게 하나요?</td>
							<td>2019/07/10</td>
							<td>답변 중</td>
						</tr>
						<tr>
							<td><b>2</b></td>
							<td>결제</td>
							<td>환불신청 어떻게 하나요?</td>
							<td>2019/07/10</td>
							<td>답변 완료</td>
						</tr>
						<tr>
							<td><b>3</b></td>
							<td>이용</td>
							<td>여행 의뢰 어떻게 하나요?</td>
							<td>2019/07/10</td>
							<td>답변 중</td>
						</tr>
						<tr>
							<td><b>4</b></td>
							<td>이용</td>
							<td>여행 의뢰 어떻게 하나요?</td>
							<td>2019/07/10</td>
							<td>답변 중</td>
						</tr>
						<!-- <tr class="is-selected"> -->
						<tr>
							<td><b>5</b></td>
							<td>이용</td>
							<td>여행 의뢰 어떻게 하나요?</td>
							<td>2019/07/10</td>
							<td>답변 중</td>
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
			location = "myInquiryDetail.mr";
		});
	});
</script>
</html>