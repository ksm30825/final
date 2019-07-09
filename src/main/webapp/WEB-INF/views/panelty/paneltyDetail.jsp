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

.img {
	display: inline-block;
	margin-right: 70px;
	margin-left: 70px;
	margin-bottom: 30px;
	width: 150px;
	height: 150px;
	border: 1px solid black;
	width: 150px;
}

#button {
	width: 15%;
	margin-right: auto;
	margin-left: auto;
}

.back {
	font-size: 1.2em !important;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	<%-- <jsp:include page="../common/myPageHeader.jsp" /> --%>
	<div class="columns">
		<div class="column">
			<section class="section" id="headerSection">
				<jsp:include page="../common/myPageHeader.jsp" />
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
							<th>처리상태</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><b>1</b></td>
							<td>채팅방</td>
							<td>욕설및 비방</td>
							<td>2019/07/10</td>
							<td>처리 완료</td>
						</tr>
					</tbody>
				</table>
			</section>
			<section class="section" id="box">
				<hr>
				<div class="box">
					<h1>신고내용</h1>
					<article class="media">
						<div class="media-content">
							<div class="content">
								<p>채팅방에서 아무 이유없이 갑자기 욕함</p>
							</div>
							<h1>첨부사진</h1>
							<div class="content">
								<div class="img">
									<img src="resources/images/logo1.png">
								</div>
								<div class="img">
									<img src="resources/images/logo1.png">
								</div>
								<div class="img">
									<img src="resources/images/logo1.png">
								</div>
								<div class="img">
									<img src="resources/images/logo1.png">
								</div>
							</div>
							<h1>처리 내용</h1>
							<div class="content" id="result">
								<p>증거 불충분</p>
							</div>
						</div>
					</article>
				</div>
			</section>
			<section class="section" id="button">
				<div class="columns">
					<div class="column">
						<div class="buttons">
							<a class="button is-primary back" href="paneltyList.pe"> 돌아가기
							</a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
<script>
	$(function() {
		var menu = $(".myPageMenu li").eq(5);
        menu.addClass('is-active');
        menu.siblings().removeClass('is-active');
	});
</script>
</html>