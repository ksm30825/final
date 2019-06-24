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
	width: 80%;
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

textarea {
	width: 100%;
	resize: none !important;
	border: none;
	text-align: center;
}

.modal-card {
	width: 400px !important;
	height: 800px !important;
}
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	<%-- <jsp:include page="../common/myPageHeader.jsp" /> --%>
	<div class="columns">
		<div class="column">
			<section class="section" id="headerSection">
				<jsp:include page="../common/myPageHeader.jsp" />
				<hr>
				<div class="columns">
					<div class="column cal">
						<div class="buttons">
							<a class="button is-primary is-rounded" onclick="myRequest();">나의
								의뢰</a> <a class="button is-info is-rounded" onclick="myPlan();">나의
								설계</a> <a class="button is-link is-rounded">미리작성</a>
						</div>
					</div>
					<div class="column">
						<div class="field">
							<p class="control">
								<span class="select"> <select>
										<option>설계 참여중</option>
										<option>설계 미참여</option>
								</select>
								</span> &nbsp; &nbsp; &nbsp; <span class="select"> <select>
										<option>채택</option>
										<option>미채택</option>
								</select>
								</span>
							</p>
						</div>
					</div>
					<div class="column">
						<div class="field is-grouped">
							<p class="control">
								<a class="button is-info"> 조회 </a>
							</p>
						</div>
					</div>
				</div>
			</section>
			<!-- <section class="section" id="button"> -->
			<!-- </section> -->
			<section class="section" id="table">

				<hr>
				<table class="table">

					<thead>
						<tr>
							<th>설계번호</th>
							<th>제목</th>
							<th>마감일</th>
							<th>의뢰인</th>
							<th>의뢰가격</th>
							<th>채택상태</th>
							<th>신고하기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><b>1</b></td>
							<td>설계제목</td>
							<td>2019/07/10</td>
							<td>user01</td>
							<td>30,000원</td>
							<td>미채택</td>
							<td class="report"
								onclick="$('#reportModal').toggleClass('is-active')"><i
								class="far fa-bell"></i></td>
						</tr>
						<tr>
							<td><b>2</b></td>
							<td>설계제목</td>
							<td>2019/07/10</td>
							<td>user01</td>
							<td>30,000원</td>
							<td>미채택</td>
							<td class="report"
								onclick="$('#reportModal').toggleClass('is-active')"><i
								class="far fa-bell"></i></td>
						</tr>
						<tr>
							<td><b>3</b></td>
							<td>설계제목</td>
							<td>2019/07/10</td>
							<td>user01</td>
							<td>30,000원</td>
							<td>미채택</td>
							<td class="report"
								onclick="$('#reportModal').toggleClass('is-active')"><i
								class="far fa-bell"></i></td>
						</tr>
						<tr>
							<td><b>4</b></td>
							<td>설계제목</td>
							<td>2019/07/10</td>
							<td>user01</td>
							<td>30,000원</td>
							<td>미채택</td>
							<td class="report"
								onclick="$('#reportModal').toggleClass('is-active')"><i
								class="far fa-bell"></i></td>
						</tr>
						<!-- <tr class="is-selected"> -->
						<tr>
							<td><b>5</b></td>
							<td>설계제목</td>
							<td>2019/07/10</td>
							<td>user01</td>
							<td>30,000원</td>
							<td>미채택</td>
							<td class="report"
								onclick="$('#reportModal').toggleClass('is-active')"><i
								class="far fa-bell"></i></td>
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
	<!-- 의뢰인 신고하기 -->
	<div class="modal" id="reportModal">
		<div class="modal-background"></div>
		<div class="modal-card">
			<header class="modal-card-head">
				<p class="modal-card-title">신고하기</p>
			</header>
			<section class="modal-card-body">
				<div class="column">
					<h1>신고 종류</h1>
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
					<h1>신고사유</h1>
					<h5>의뢰인 : user01</h5>
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
					<h1>첨부파일</h1>
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
				<a type="submit" class="button is-primary" onclick="report();">신고</a>
				<a class="button" onclick="cancel();">취소</a>
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

		$(".far").parent().siblings().click(function() {
			console.log($(this).parents().children("td").eq(0).text());
			location = "requestPlan.tr";
		});
		
		/* 모달띄우기 */
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

	function myRequest() {
		location = "myRequestList.mr";
	}
	function myPlan() {
		location = "myRequestPlan.mr";
	}
	function cancel() {
		location = location;
	}
	function report() {
		location = "paneltyList.pe";
	}
</script>
</html>