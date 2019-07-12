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
	margin-right: 30px;
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
			<br>
			<br>
			<form action="insertNotice.ad" method="post" enctype="multipart/form-data">>
			<br>
				<h1 style="text-align: center;" class="title">공지사항</h1>
				<input type="hidden" value="공지사항" name="boardType">
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
														<input class="input" type="text" placeholder="제목을 입력하세요" name="boardTitle">
													</p>
												</div>
												<hr>
												<div class="field">
													<label class="label">공지 사진</label>
													<div class="img" id="boardImg1">
														<img id="img1">
													</div>
													<div class="img" id="boardImg2">
														<img id="img2">
													</div>
													<div class="img" id="boardImg3">
														<img id="img3">
													</div>
													<div class="img" id="boardImg4">
														<img id="img4">
													</div>
												</div>
												<hr>
												<div class="field">
													<label class="label">공지 내용</label>
													<p class="control">
														<textarea class="textarea" placeholder="공지 내용을 입력하세요" name="boardContent"></textarea>
													</p>
												</div>
												<div id="fileArea">
													<input type="file" id="imgArea1" name=attachmentFile multiple="multiple" onchange="loadImg(this, 1);">
													<input type="file" id="imgArea2" name=attachmentFile multiple="multiple" onchange="loadImg(this, 2);">
													<input type="file" id="imgArea3" name=attachmentFile multiple="multiple" onchange="loadImg(this, 3);">
													<input type="file" id="imgArea4" name=attachmentFile multiple="multiple" onchange="loadImg(this, 4);">
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
			</form>
		</div>
	</div>
</body>
<script>
	$(function() {
		$(".is-link").click(function() {
			location = "adminNoticeList.ad";
		});
		$(".is-primary").click(function() {
			location = "adminNoticeList.ad";
		});

		$("#fileArea").hide();
		$("#boardImg1").click(function() {
			$("#imgArea1").click();
		});
		$("#boardImg2").click(function() {
			$("#imgArea2").click();
		});
		$("#boardImg3").click(function() {
			$("#imgArea3").click();
		});
		$("#boardImg4").click(function() {
			$("#imgArea4").click();
		});
	});
	
	//사진 등록
	function loadImg(value, num) {
		if(value.files && value.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				switch(num) {
				case 1 :
					$("#img1").attr("src", e.target.result);
					break;
				case 2 :
					$("#img2").attr("src", e.target.result);
					break;
				case 3 :
					$("#img3").attr("src", e.target.result);
					break;
				case 4 :
					$("#img4").attr("src", e.target.result);
					break;
				}
			}
			reader.readAsDataURL(value.files[0]);
		}
	}
</script>
</html>