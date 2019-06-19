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
	height: 36px;
}

textarea {
	width: 100%;
	resize: none !important;
	border: 1px solid black;
	text-align: center;
}

#okModal td {
	border: 1px solid black !important;
}

.subtitle {
	color: black !important;
}

input {
	height:35px;
}
</style>
</head>
<body>
	<jsp:include page="../../common/adminMainNav.jsp" />
	<div class="columns">
		<div class="column">
			<section class="section" id="table">
				<h1 class="title" style="text-align: center;">신고관리</h1>
				<div class="field">
					<p class="control">
						<label>구분</label> &nbsp; &nbsp; <span class="select"> <select>
								<option>채팅방</option>
								<option>리뷰</option>
								<option>여행 일정</option>
								<option>여행 설계</option>
								<option>여행 의뢰</option>
						</select>
						</span> &nbsp; &nbsp; &nbsp; <label>사유</label> &nbsp; &nbsp; <span
							class="select"> <select>
								<option>부적절 게시물</option>
								<option>욕설 및 비방</option>
								<option>저작권 침해 및 명의 도용</option>
								<option>기타</option>
						</select>
						</span> &nbsp; &nbsp; &nbsp; <label>여부</label> &nbsp; &nbsp; <span
							class="select"> <select>
								<option>처리 대기</option>
								<option>승인</option>
								<option>거절</option>
						</select>
						</span> &nbsp; &nbsp; &nbsp; <label>신고일</label> &nbsp; <span> <input
							type="date" class="date">
						</span> &nbsp; &nbsp; &nbsp; <a class="button is-info"> 조회 </a>
					</p>
				</div>
				<hr>
				<table class="table">
					<thead>
						<tr>
							<th>신고 번호</th>
							<th>구분</th>
							<th>사유</th>
							<th>신고자</th>
							<th>대상자</th>
							<th>신고일</th>
							<th>처리 상태</th>
							<th>여부</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><b>1</b></td>
							<td>채팅방</td>
							<td>욕설 및 비방</td>
							<td>user01</td>
							<td>user02</td>
							<td>2019/07/10</td>
							<td>처리 대기</td>
							<td><a class="button is-danger is-rounded"
								onclick="$('#okModal').toggleClass('is-active')">승인 </a> &nbsp;
								&nbsp; <a class="button is-success is-rounded"
								onclick="$('#noModal').toggleClass('is-active')">거절 </a></td>
						</tr>
						<tr>
							<td><b>2</b></td>
							<td>채팅방</td>
							<td>욕설 및 비방</td>
							<td>user01</td>
							<td>user02</td>
							<td>2019/07/10</td>
							<td>처리 대기</td>
							<td><a class="button is-danger is-rounded"
								onclick="$('#okModal').toggleClass('is-active')">승인 </a> &nbsp;
								&nbsp; <a class="button is-success is-rounded"
								onclick="$('#noModal').toggleClass('is-active')">거절 </a></td>
						</tr>
						<tr>
							<td><b>3</b></td>
							<td>채팅방</td>
							<td>욕설 및 비방</td>
							<td>user01</td>
							<td>user02</td>
							<td>2019/07/10</td>
							<td>처리 대기</td>
							<td><a class="button is-danger is-rounded"
								onclick="$('#okModal').toggleClass('is-active')">승인 </a> &nbsp;
								&nbsp; <a class="button is-success is-rounded"
								onclick="$('#noModal').toggleClass('is-active')">거절 </a></td>
						</tr>
						<tr>
							<td><b>4</b></td>
							<td>채팅방</td>
							<td>욕설 및 비방</td>
							<td>user01</td>
							<td>user02</td>
							<td>2019/07/10</td>
							<td>처리 대기</td>
							<td><a class="button is-danger is-rounded"
								onclick="$('#okModal').toggleClass('is-active')">승인 </a> &nbsp;
								&nbsp; <a class="button is-success is-rounded"
								onclick="$('#noModal').toggleClass('is-active')">거절 </a></td>
						</tr>
						<!-- <tr class="is-selected"> -->
						<tr>
							<td><b>5</b></td>
							<td>채팅방</td>
							<td>욕설 및 비방</td>
							<td>user01</td>
							<td>user02</td>
							<td>2019/07/10</td>
							<td>처리 대기</td>
							<td><a class="button is-danger is-rounded"
								onclick="$('#okModal').toggleClass('is-active')">승인 </a> &nbsp;
								&nbsp; <a class="button is-success is-rounded"
								onclick="$('#noModal').toggleClass('is-active')">거절 </a></td>
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
	<!-- 신고하기 모달 -->
	<div class="modal" id="okModal">
		<div class="modal-background"></div>
		<div class="modal-card">
			<header class="modal-card-head">
				<p class="modal-card-title">승인 처리</p>
			</header>
			<section class="modal-card-body">
				<div class="column">
					<h1 class="title">구분</h1>
					<h3 class="subtitle is-3">채팅방</h3>
					<hr>
				</div>
				<!-- <section class="section" id="box"> -->
				<div class="column">
					<h1 class="title">신고 사유</h1>
					<h3 class="subtitle is-3">욕설 및 비방</h3>
					<hr>
				</div>
				<div class="column">
					<h1 class="title">처리 내용</h1>
					<div class="content">
						<textarea placeholder="처리내용을 입력하세요" rows="5"></textarea>
					</div>
					<hr>
				</div>
				<div class="column">
					<!-- <h1 class="title">벌점/패널티</h1>
					<h3 class="subtitle is-3">15점/15일 정지</h3> -->
					<h1 class="title">벌점/패널티</h1>
					<label>벌점</label>
					<input type="number" id="number" min="5" step="5" value="5" required> &nbsp;
					<label>패널티</label>
					<input type="text" value="15일 정지" readonly>
					<hr>
				</div>
			</section>
			<footer class="modal-card-foot">
				<a type="submit" class="button is-primary"
					href="reportControlList.ad">확인</a> <a class="button"
					href="reportControlList.ad">취소</a>
			</footer>
		</div>
	</div>
	
	<!-- 거절하기 모달 -->
	<div class="modal" id="noModal">
		<div class="modal-background"></div>
		<div class="modal-card">
			<header class="modal-card-head">
				<p class="modal-card-title">거절 처리</p>
			</header>
			<section class="modal-card-body">
				<div class="column">
					<h1 class="title">구분</h1>
					<h3 class="subtitle is-3">채팅방</h3>
					<hr>
				</div>
				<!-- <section class="section" id="box"> -->
				<div class="column">
					<h1 class="title">신고 사유</h1>
					<h3 class="subtitle is-3">욕설 및 비방</h3>
					<hr>
				</div>
				<div class="column">
					<h1 class="title">거절 내용</h1>
					<div class="content">
						<textarea placeholder="처리내용을 입력하세요" rows="5"></textarea>
					</div>
					<hr>
				</div>
				<!-- <div class="column">
					<h1 class="title">벌점/패널티</h1>
					<h3 class="subtitle is-3">15점/15일 정지</h3>
					<h1 class="title">벌점/패널티</h1>
					<label>벌점</label>
					<input type="number" id="number" min="5" step="5" value="5" required> &nbsp;
					<label>패널티</label>
					<input type="text" value="15일 정지" readonly>
					<hr>
				</div> -->
			</section>
			<footer class="modal-card-foot">
				<a type="submit" class="button is-primary"
					href="reportControlList.ad">확인</a> <a class="button"
					href="reportControlList.ad">취소</a>
			</footer>
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
		});

		$(".is-danger").parent().siblings().click(function() {
			console.log($(this).parents().children("td").eq(0).text());
			location = "reportControlDetail.ad";
		});
		
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
</script>
</html>