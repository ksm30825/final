<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

#box {
	width: 70%;
	margin-right: auto;
	margin-left: auto;
}

#button {
	width:15%;
	margin-right:auto;
	margin-left:auto;
}
.back {
	font-size:1.2em !important;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	<jsp:include page="../common/myPageHeader.jsp" />
	<div class="columns">
		<div class="column">
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
					</tbody>
				</table>
			</section>
			<section class="section" id="box">
				<hr>
				<div class="box">
					<h1>문의내용</h1>
					<article class="media">
						<div class="media-content">
							<div class="content">
								<p>여행의뢰하고 싶은데 알려주세요 몰라요</p>
							</div>
							<h1>답변 내용</h1>
							<div class="content" id="result">
								<p>답변 중입니다</p>
							</div>
						</div>
					</article>
				</div>
			</section>
			<section class="section" id="button">
				<div class="columns">
					<div class="column">
						<div class="buttons">
							<a class="button is-primary back" href="myInquiryList.mp"> 돌아가기 </a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>