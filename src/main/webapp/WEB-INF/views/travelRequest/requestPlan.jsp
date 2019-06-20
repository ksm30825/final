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
.input {
	width: 30% px !important;
}

textarea {
	width: 100%;
	resize: none !important;
	border: none;
	text-align: center;
}

.introduce {
	height: 100px !important;
}

.hover-indigo {
	margin-left: 65%;
}

.db {
	cursor: pointer;
}

#okModal td {
	border: 1px solid black !important;
}

th, td {
	text-align: center !important;
}

.more {
	margin-left: auto;
	margin-right: auto;
}

.modal-card {
	width: 400px !important;
	height: 800px !important;
}
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	<div class="columns">
		<div class="column">
			<section class="section" id="form">
				<h1 class="title">일정</h1>
				<hr>
				<div class="columns">
					<div class="column">
						<br>
						<div class="field">
							<a class="button is-primary"> Day1 </a>
							<textarea class="textarea" readonly
								style="height: 50px; min-height: 50px;">일정 - 일정 - 일정</textarea>
							<p class="control">
								<textarea class="textarea" readonly>이러한 일정들</textarea>
							</p>
						</div>
						<br>
						<hr>
						<br>
						<div class="field">
							<a class="button is-primary"> Day2 </a>
							<textarea class="textarea" readonly
								style="height: 50px; min-height: 50px;">일정 - 일정 - 일정</textarea>
							<p class="control">
								<textarea class="textarea" readonly>이러한 일정들</textarea>
							</p>
						</div>
						<br>
						<hr>
						<br>
						<div class="field">
							<a class="button is-primary"> Day3 </a>
							<textarea class="textarea" readonly
								style="height: 50px; min-height: 50px;">일정 - 일정 - 일정</textarea>
							<p class="control">
								<textarea class="textarea" readonly>이러한 일정들</textarea>
							</p>
						</div>
						<br>
						<hr>
						<br>
						<div class="buttons">
							<a class="button is-primary is-rounded more" onclick="more();">일정
								더 보기</a>
						</div>
					</div>
					<div class="column map" style="width: 50%;">
						<div class="card">
							<div class="card-image">
								<figure class="image is-4by3">
									<img src="https://source.unsplash.com/random/800x600"
										alt="Image">
								</figure>
							</div>
							<div class="card-content">
								<div class="media">
									<div class="media-left">
										<!-- <figure class="image" style="height: 40px; width: 40px;">
											<img src="https://source.unsplash.com/random/96x96"
												alt="Image">
										</figure> -->
									</div>
									<div class="media-content">
										<p class="title is-4">지역명</p>
									</div>
								</div>
								<div class="content">
									<div class="card">
										<div class="card-content">
											<div class="content">
												<textarea class="textarea" type="text"
													style="height: 50px; min-height: 50px;" readonly>여행제목</textarea>
												<hr>
												<textarea class="textarea" readonly>여행 소개</textarea>
											</div>
										</div>
										<footer class="card-footer">
											<a class="card-footer-item" onclick="back();">돌아가기</a> <a
												class="card-footer-item" onclick="ok();">채택하기</a> <a
												class="card-footer-item"
												onclick="$('#reportModal').toggleClass('is-active')">신고하기</a>
										</footer>
									</div>
								</div>
							</div>
						</div>
						<section class="section" id="box">
							<h1 class="title">가계부</h1>
							<hr>
							<div class="box">
								<article class="media">
									<div class="media-content">
										<div class="content">
											<section class="section" id="table">
												<table class="table">
													<thead>
														<tr>
															<th>숙박</th>
															<th>경비</th>
															<th>기타</th>
															<th>총액</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td><textarea readonly>100,000원</textarea></td>
															<td><textarea readonly>100,000원</textarea></td>
															<td><textarea readonly>100,000원</textarea></td>
															<td><textarea readonly>300,000원</textarea></td>
													</tbody>
												</table>
											</section>
										</div>
									</div>
								</article>
							</div>
						</section>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- 신고하기 모달 -->
	<div class="modal" id="reportModal">
		<div class="modal-background"></div>
		<div class="modal-card">
			<header class="modal-card-head">
				<p class="modal-card-title">신고하기</p>
			</header>
			<section class="modal-card-body">
				<div class="column">
					<h1 class="title">신고 종류</h1>
					<hr>
					<div class="field">
						<p class="control">
							<span class="select"> <select>
									<option>부적절 게시물</option>
									<option>욕설 및 비방</option>
									<option>저작권 침해 및 명의 도용</option>
									<option>기타</option>
							</select>
							</span>
						</p>
					</div>
				</div>
				<section class="section" id="box">
					<h1 class="title">신고사유</h1>
					<h1><b>설계인 : user01</b></h1>
					<hr>
					<div class="box">
						<article class="media">
							<div class="media-content">
								<div class="content">
									<textarea placeholder="신고사유를 입력하세요" rows="5"></textarea>
								</div>
							</div>
						</article>
					</div>
					<h1  class="title">첨부파일</h1>
					<hr>
					<div class="field">
						<div class="file has-name">
							<label class="file-label"> <input class="file-input"
								type="file" name="resume"> <span class="file-cta">
									<span class="file-icon"> <i class="fa fa-upload"></i>
								</span> <span class="file-label"> Choose a file… </span>
							</span> <span class="file-name"> Screen Shot 2017-07-29 at
									15.54.25.png </span>
							</label>
						</div>
					</div>
					<div class="field">
						<div class="file has-name">
							<label class="file-label"> <input class="file-input"
								type="file" name="resume"> <span class="file-cta">
									<span class="file-icon"> <i class="fa fa-upload"></i>
								</span> <span class="file-label"> Choose a file… </span>
							</span> <span class="file-name"> Screen Shot 2017-07-29 at
									15.54.25.png </span>
							</label>
						</div>
					</div>
					<div class="field">
						<div class="file has-name">
							<label class="file-label"> <input class="file-input"
								type="file" name="resume"> <span class="file-cta">
									<span class="file-icon"> <i class="fa fa-upload"></i>
								</span> <span class="file-label"> Choose a file… </span>
							</span> <span class="file-name"> Screen Shot 2017-07-29 at
									15.54.25.png </span>
							</label>
						</div>
					</div>
					<div class="field">
						<div class="file has-name">
							<label class="file-label"> <input class="file-input"
								type="file" name="resume"> <span class="file-cta">
									<span class="file-icon"> <i class="fa fa-upload"></i>
								</span> <span class="file-label"> Choose a file… </span>
							</span> <span class="file-name"> Screen Shot 2017-07-29 at
									15.54.25.png </span>
							</label>
						</div>
					</div>
				</section>
			</section>
			<footer class="modal-card-foot">
				<a type="submit" class="button is-primary" onclick="report();">신고</a> <a class="button"
					onclick="cancel();">취소</a>
			</footer>
		</div>
	</div>
</body>
<script>
	$(function() {
		$('.modal-background, .modal-close').click(function() {
	   		$('html').removeClass('is-clipped');
	    	$(this).parent().removeClass('is-active');
	  	});
	  	$('.theme-switcher').change(function(e) {
	    	if (e.target.value) {
		      window.location.href = '/bulmaswatch/' + e.target.value;
		    }
		  });
	
		  // Get all "navbar-burger" elements
		  var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
	
		  // Check if there are any nav burgers
		  if ($navbarBurgers.length > 0) {
	
		    // Add a click event on each of them
		    $navbarBurgers.forEach(function ($el) {
		      $el.addEventListener('click', () => {
	
		        // Get the target from the "data-target" attribute
		        var target = $el.dataset.target;
		        var $target = document.getElementById(target);
	
		        // Toggle the class on both the "navbar-burger" and the "navbar-menu"
		        $el.classList.toggle('is-active');
		        $target.classList.toggle('is-active');
		      });
		   });
		}
	});

	function back() {
		location = "requestDetail.tr";
	}
	function more() {
		alert("채택해야 상세보기가 가능합니다.");
	}
	function ok() {
		var result = confirm("정말로 채택하시겠습니까?");
		console.log(result);
		if(result == true) {
			location = "myRequestList.mr";
		} else {
			location = location;
		}
	}
	function cancel() {
		location = location;
	}
	function report() {
		location = "paneltyList.pe";
	}
</script>
</html>