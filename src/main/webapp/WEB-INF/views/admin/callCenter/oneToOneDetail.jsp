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

.box {
	width: 70%;
	margin-right: auto;
	margin-left: auto;
}

#button {
	width: 15%;
	margin-right: auto;
	margin-left: auto;
}

.back {
	font-size: 1.2em !important;
}

textarea {
	resize: none;
}

.result {
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<jsp:include page="../../common/adminMainNav.jsp" />
	<div class="columns">
		<div class="column">
			<section class="section" id="table">
				<h1 class="title" style="text-align: center;">1:1문의</h1>
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
					</tbody>
				</table>
			</section>
			<div class="box">
				<h1 class="title">문의내용</h1>
				<article class="media">
					<div class="media-content">
						<div class="content">
							<p>여행의뢰하고 싶은데 알려주세요 몰라요</p>
						</div>
						<h1 class="title">답변 내용</h1>
						<div class="content">
							<textarea style="width: 100%;" rows="15" placeholder="답변내용을 적으세요"></textarea>
						</div>
					</div>
				</article>
			</div>
			<div class="field is-grouped">
				<p class="control result">
					<button class="button is-link">돌아가기</button>
				</p>
				<p class="control result">
					<button class="button is-primary">답변하기</button>
				</p>
			</div>
		</div>
	</div>
</body>
<script>
	$(function() {
		$(".is-link").click(function() {
			location = "oneToOneList.ad";
		});
		$(".is-primary").click(function() {
			location = "oneToOneList.ad";
		});
	});
</script>
</html>