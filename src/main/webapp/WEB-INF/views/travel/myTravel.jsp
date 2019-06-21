<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 여행 일정</title>
<style>
	.breadcrumb li a {
		color:#A276FF;
	}
	.breadcrumb li a:hover {
		color:#C6ACFE;
	}
	.breadcrumb li.is-active a {
		color:black;
		font-weight:bold;
	}
	.column .columns {
		margin:0 !important;
	}
	.trvCard:hover {
		cursor:pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	
	<div class="columns is-mobile">
		<div class="column">
			<section class="section" id="headerSection">
				<jsp:include page="../common/myPageHeader.jsp" />
			</section>
			<section class="section" id="bredcrumbSection" style="padding-top:0; padding-bottom:0">
				<nav class="breadcrumb">&nbsp;&nbsp;
					<ul style="padding-left:20px">
						<li class="is-active"><a id="open">작성중</a></li>
						<li><a id="closed">작성완료</a></li>
					</ul>
				</nav>
			</section>
			<section class="section" id="cardSection">
				<div class="columns">
					<div class="column is-one-third">
						<div class="card trvCard">
							<div class="card-image">
								<figure class="image" style="margin:0">
									<img src="resources/images/sample1.jpg">
								</figure>
							</div>
							<div class="card-content">
								<div class="media">
									<div class="media-left">
										<p class="title is-4">여자혼자 멜버른, 시드니 자유여행 </p>
										<p class="subtitle is-6">@멜버른@시드니, 호주</p>
										<small>2018-09-01 ~ 2019-09-21</small>&nbsp;&nbsp;
										<a class="button is-small"> 
											<span class="icon is-small"><i class="fa fa-user"></i></span> 
											<span> 홍길동 </span>
										</a>
									</div>
									<div class="media-right">
									</div>
								</div>
								<div class="content">
									<a>#혼자여행</a>
									<a>#자유여행</a> 
									<a>#먹방여행</a>
								</div>
							</div>
						</div>
					</div>
					<div class="column is-one-third">
						<div class="card">
							<div class="card-image">
								<figure class="image" style="margin:0">
									<img src="resources/images/sample2.jpg">
								</figure>
							</div>
							<div class="card-content">
								<div class="media">
									<div class="media-left">
										<p class="title is-4">여자혼자 멜버른, 시드니 자유여행 </p>
										<p class="subtitle is-6">@멜버른@시드니, 호주</p>
										<small>2018-09-01 ~ 2019-09-21</small>&nbsp;&nbsp;
										<a class="button is-small"> 
											<span class="icon is-small"><i class="fa fa-user"></i></span> 
											<span> 홍길동 </span>
										</a>
									</div>
									<div class="media-right">
									</div>
								</div>
								<div class="content">
									<a>#혼자여행</a>
									<a>#자유여행</a> 
									<a>#먹방여행</a>
								</div>
							</div>
						</div>
					</div>
					<div class="column is-one-third">
						<div class="card">
							<div class="card-image">
								<figure class="image" style="margin:0">
									<img src="resources/images/sample3.jpg">
								</figure>
							</div>
							<div class="card-content">
								<div class="media">
									<div class="media-left">
										<p class="title is-4">여자혼자 멜버른, 시드니 자유여행 </p>
										<p class="subtitle is-6">@멜버른@시드니, 호주</p>
										<small>2018-09-01 ~ 2019-09-21</small>&nbsp;&nbsp;
										<a class="button is-small"> 
											<span class="icon is-small"><i class="fa fa-user"></i></span> 
											<span> 홍길동 </span>
										</a>
									</div>
									<div class="media-right">
									</div>
								</div>
								<div class="content">
									<a>#혼자여행</a>
									<a>#자유여행</a> 
									<a>#먹방여행</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		
		</div>
	</div>
	<script>
		$(".trvCard").click(function() {
			location.href="showTrvEditor.trv";
		});
	</script>



</body>
</html>