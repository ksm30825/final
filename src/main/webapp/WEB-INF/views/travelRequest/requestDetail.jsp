<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.is-half {
	margin-top: 5%;
	margin-right: auto;
	margin-left: auto;
	margin-right: auto;
}

.section {
	width: 70%;
	margin-right: auto;
	margin-left: auto;
}

.notification b {
	font-size: 1.5em;
}

.table {
	margin-right: auto;
	margin-left: auto;
	width:100%;
}

.table th {
	text-align: center !important;
}

.table td {
	text-align: center !important;
}

.table tr {
	cursor: pointer;
}

.textarea {
	height: 300px !important;
	resize: none !important;
}
.request:hover {
	cursor:pointer;
}
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	<div class="columns">
		<div class="column">
			<section class="section" id="table">
				<hr>
				<table class="table">
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
					</tbody>
				</table>
			</section>
			<section class="section" id="form">
				<div class="field">
					<label class="label">이런 여행을 원해요</label>
					<p class="control">
						<textarea class="textarea" readonly>이런여행을 원해요</textarea>
					</p>
				</div>
				<div class="field is-grouped">
					<p class="control">
						<button class="button is-primary" onclick="start();">설계해주기</button>
					</p>
					<p class="control">
						<button class="button is-link" onclick="reset();">돌아가기</button>
					</p>
				</div>
			</section>
			<section class="section" id="card">
				<h1 class="title">설계글</h1>
				<hr>
				<div class="columns">
					<div class="column">
						<div class="card request">
							<div class="card-image">
								<figure class="image is-4by3">
									<img src="https://source.unsplash.com/random/800x600"
										alt="Image">
								</figure>
							</div>
							<div class="card-content">
								<div class="media">
									<div class="media-left">
										
									</div>
									<div class="media-content">
										<p class="title is-4">설계제목</p>
										<p class="subtitle is-6">설계자</p>
										<p class="subtitle is-6">2019/07/03</p>
									</div>
								</div>
								<div class="content">
									<textarea class="col-lg-12" rows="5" style="resize:none;" readonly>여행 소개</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="column">
						<div class="card request">
							<div class="card-image">
								<figure class="image is-4by3">
									<img src="https://source.unsplash.com/random/800x600"
										alt="Image">
								</figure>
							</div>
							<div class="card-content">
								<div class="media">
									<div class="media-left">
										
									</div>
									<div class="media-content">
										<p class="title is-4">설계제목</p>
										<p class="subtitle is-6">설계자</p>
										<p class="subtitle is-6">2019/07/03</p>
									</div>
								</div>
								<div class="content">
									<textarea class="col-lg-12" rows="5" style="resize:none;" readonly>여행 소개</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="column">
						<div class="card request">
							<div class="card-image">
								<figure class="image is-4by3">
									<img src="https://source.unsplash.com/random/800x600"
										alt="Image">
								</figure>
							</div>
							<div class="card-content">
								<div class="media">
									<div class="media-left">
										
									</div>
									<div class="media-content">
										<p class="title is-4">설계제목</p>
										<p class="subtitle is-6">설계자</p>
										<p class="subtitle is-6">2019/07/03</p>
									</div>
								</div>
								<div class="content">
									<textarea class="col-lg-12" rows="5" style="resize:none;" readonly>여행 소개</textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="columns">
					<div class="column">
						<div class="card request">
							<div class="card-image">
								<figure class="image is-4by3">
									<img src="https://source.unsplash.com/random/800x600"
										alt="Image">
								</figure>
							</div>
							<div class="card-content">
								<div class="media">
									<div class="media-left">
										
									</div>
									<div class="media-content">
										<p class="title is-4">설계제목</p>
										<p class="subtitle is-6">설계자</p>
										<p class="subtitle is-6">2019/07/03</p>
									</div>
								</div>
								<div class="content">
									<textarea class="col-lg-12" rows="5" style="resize:none;" readonly>여행 소개</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="column">
						<div class="card request">
							<div class="card-image">
								<figure class="image is-4by3">
									<img src="https://source.unsplash.com/random/800x600"
										alt="Image">
								</figure>
							</div>
							<div class="card-content">
								<div class="media">
									<div class="media-left">
										
									</div>
									<div class="media-content">
										<p class="title is-4">설계제목</p>
										<p class="subtitle is-6">설계자</p>
										<p class="subtitle is-6">2019/07/03</p>
									</div>
								</div>
								<div class="content">
									<textarea class="col-lg-12" rows="5" style="resize:none;" readonly>여행 소개</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="column">
						<div class="card request">
							<div class="card-image">
								<figure class="image is-4by3">
									<img src="https://source.unsplash.com/random/800x600"
										alt="Image">
								</figure>
							</div>
							<div class="card-content">
								<div class="media">
									<div class="media-left">
										
									</div>
									<div class="media-content">
										<p class="title is-4">설계제목</p>
										<p class="subtitle is-6">설계자</p>
										<p class="subtitle is-6">2019/07/03</p>
									</div>
								</div>
								<div class="content">
									<textarea class="col-lg-12" rows="5" style="resize:none;" readonly>여행 소개</textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
		</div>
	</div>
</body>
<script>
	$(function () {
		$(".request").click(function() {
				location = "requestPlan.tr";
			});
		});
	function start() {
		location = "requestStart.tr";
	}
	function reset() {
		location = "travelRequest.tr";
	}
</script>
</html>