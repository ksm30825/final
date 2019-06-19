<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
.date {
	height:36px;
}
</style>
</head>
<body>
	<jsp:include page="../../common/adminMainNav.jsp" />
	<div class="columns">
		<div class="column">
			<section class="section" id="table">
				<h1 class="title" style="text-align: center;">1:1문의</h1>
				<div class="field">
					<p class="control">
						<span class="select">
							<select>
								<option>이용</option>
								<option>결제</option>
								<option>기타</option>
							</select>
						</span> &nbsp; &nbsp; &nbsp; 
						<span class="select">
							<select>
								<option>답변 중</option>
								<option>답변 완료</option>
							</select>
						</span> &nbsp; &nbsp; &nbsp;
						<span> 
							<input type="date" class="date">
						</span> &nbsp; &nbsp; &nbsp;
						<a class="button is-info"> 조회 </a>
					</p>
				</div>
				<hr>
				<table class="table">

					<thead>
						<tr>
							<th>문의 번호</th>
							<th>종류</th>
							<th>제목</th>
							<th>작성일</th>
							<th>작성자</th>
							<th>문의 상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><b>1</b></td>
							<td>이용</td>
							<td>여행 의뢰 어떻게 하나요?</td>
							<td>2019/07/10</td>
							<td>user01</td>
							<td>답변 중</td>
						</tr>
						<tr>
							<td><b>2</b></td>
							<td>결제</td>
							<td>환불신청 어떻게 하나요?</td>
							<td>2019/07/10</td>
							<td>user01</td>
							<td>답변 완료</td>
						</tr>
						<tr>
							<td><b>3</b></td>
							<td>이용</td>
							<td>여행 의뢰 어떻게 하나요?</td>
							<td>2019/07/10</td>
							<td>user01</td>
							<td>답변 중</td>
						</tr>
						<tr>
							<td><b>4</b></td>
							<td>이용</td>
							<td>여행 의뢰 어떻게 하나요?</td>
							<td>2019/07/10</td>
							<td>user01</td>
							<td>답변 중</td>
						</tr>
						<!-- <tr class="is-selected"> -->
						<tr>
							<td><b>5</b></td>
							<td>이용</td>
							<td>여행 의뢰 어떻게 하나요?</td>
							<td>2019/07/10</td>
							<td>user01</td>
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
			location = "oneToOneDetail.ad";
		});
	});
</script>
</html>