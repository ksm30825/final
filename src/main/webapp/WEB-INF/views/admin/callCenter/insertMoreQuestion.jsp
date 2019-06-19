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
textarea {
	resize: none !important;
}

.result {
	margin-left: auto !important;
	margin-right: auto !important;
}

#box {
	width: 80%;
	height: 40%;
	margin-left: auto;
	margin-right: auto;
}

#form {
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
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="../../common/adminMainNav.jsp" />
	<div class="columns">
		<div class="column">
			<br> <br>
			<h1 style="text-align: center;" class="title">자주 묻는 질문</h1>
			<hr>
			<section class="section" id="box">
				<div class="box">
					<article class="media">
						<div class="media-content">
							<div class="content">
								<section class="section" id="form">
									<div class="columns">
										<div class="column">
											<div class="field">
												<label class="label">제목</label>
												<p class="control">
													<input class="input" type="text" placeholder="제목을 입력하세요">
												</p>
											</div>
											<hr>
											<div class="field">
												<label class="label">공지 사진</label>
												<div class="img">
													<img id="img1" src="resources/images/logo1.png">
												</div>
												<div class="img">
													<img id="img2" src="resources/images/logo1.png">
												</div>
											</div>
											<hr>
											<div class="field">
												<label class="label">공지 내용</label>
												<p class="control">
													<textarea class="textarea" placeholder="공지 내용을 입력하세요"></textarea>
												</p>
											</div>
											<div id="fileArea">
												<input type="file" id="img3" name="img5" onchange="loadImg(this, 5);">
												<input type="file" id="img4" name="img6" onchange="loadImg(this, 6);">
											</div>
										</div>
									</div>
								</section>
							</div>
						</div>
					</article>
				</div>
				<br>
				<div class="field is-grouped">
					<p class="control result">
						<button class="button is-link">돌아가기</button>
					</p>
					<p class="control result">
						<button class="button is-primary">작성하기</button>
					</p>
				</div>
			</section>
		</div>
	</div>
</body>
<script>
	$(function() {
		$(".is-link").click(function() {
			location = "adminMoreQuestionList.ad";
		});
		$(".is-primary").click(function() {
			location = "adminMoreQuestionList.ad";
		});
		
		$("#fileArea").hide();
		$("#img1").click(function() {
			$("#img3").click();
		});
		$("#img2").click(function() {
			$("#img4").click();
		});
	});
</script>
</html>