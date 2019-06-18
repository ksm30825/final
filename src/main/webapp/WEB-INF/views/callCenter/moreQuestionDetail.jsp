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
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	<div class="columns">
		<div class="column">
			<section class="section" id="table">
				<h1 class="title" style="text-align: center;">자주 묻는 질문</h1>
				<hr>
				<table class="table">
					<thead>
						<tr>
							<th>공지 번호</th>
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
					</tbody>
				</table>
			</section>
			<section class="section" id="box">
				<div class="box">
					<article class="media">
						<div class="media-content">
							<h1 class="title">공지 사진</h1>
							<div class="content">
								<div class="img">
									<img src="resources/images/logo1.png">
								</div>
								<div class="img">
									<img src="resources/images/logo1.png">
								</div>
							</div>
							<h1 class="title">공지 내용</h1>
							<div class="content">
								<p>있는 웅대한 얼마나 것이다. 설산에서 같이, 관현악이며, 낙원을 맺어, 보는 사람은 인간은 방지하는
									봄바람이다. 수 장식하는 눈이 안고, 청춘의 싸인 싹이 피다. 천지는 예가 그들의 가치를 피부가 방지하는
									황금시대를 열매를 무한한 끓는다. 구하지 커다란 위하여 안고, 따뜻한 듣는다. 고행을 발휘하기 몸이 꽃 곳으로
									위하여서. 얼마나 용기가 구하지 힘있다. 위하여 그들은 바이며, 온갖 무한한 없으면, 때까지 이상 구하지
									부패뿐이다. 얼마나 심장은 우리의 얼음이 못할 그들은 오아이스도 뜨고, 힘차게 있는가? 보는 곧 원질이 일월과
									동력은 더운지라 맺어, 청춘의 속잎나고, 봄바람이다. 없으면 할지라도 없는 생명을 기쁘며, 고동을 뜨거운지라,
									피어나는 뭇 있는가?</p>
							</div>
						</div>
					</article>
					<br><br>
				</div>
			</section>
			<section class="section" id="button">
				<div class="columns">
					<div class="column">
						<div class="buttons">
							<a class="button is-primary back" href="moreQuestionList.cc">돌아가기 </a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>