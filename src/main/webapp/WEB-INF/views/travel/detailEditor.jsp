<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TI - detailEditor</title>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<style>
	.card-header {
		background:#AFDCF5;
	}
</style>
</head>
<body>
	<div class="columns">
		<div class="column is-3">
			<section class="section">
				<aside class="menu" id="daySideMenu">
					<p class="menu-label">일자별 상세글</p>
					<ul class="menu-list" id="dayList">
						<li><a class="is-active"><strong>DAY 1</strong></a></li>
						<li><a><strong>DAY 2</strong></a></li>
						<li><a><strong>DAY 3</strong></a></li>
						<li><a><strong>DAY 4</strong></a></li>
						<li><a><strong>DAY 5</strong></a></li>
						<li><a><strong>DAY 6</strong></a></li>
						
					</ul>
					<p class="menu-label">사진 갤러리</p>
					<ul class="menu-list" id="gallaryList">
						<li><a>전체보기</a></li>
						<li><a>일자별 모아보기</a>
							<ul>
								<li><a>DAY 1</a></li>
								<li><a>DAY 2</a></li>
								<li><a>DAY 3</a></li>
								<li><a>DAY 4</a></li>
								<li><a>DAY 5</a></li>
								<li><a>DAY 6</a></li>
							</ul>
						</li>
					</ul>
				</aside>
			</section>
		</div>
		<div class="column is-9">
			<section class="section" style="padding-bottom:10px">
				<nav class="level">
					<div class="level-left">
						<div class="level-item">
							<p class="subtitle is-3">
								<strong>DAY 1</strong> 
							</p>
							<p class="help">2019-07-01</p>
						</div>
						<div class="level-item">
							<div class="field">
								<p class="control">
									<input class="input" type="text" placeholder="MEMO">
								</p>
							</div>
						</div>
					</div>
					<div class="level-right" id="weatherArea">
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-danger is-outlined weatherBtn">
								<span class="icon">
									<i class="fas fa-sun"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-dark is-outlined weatherBtn">
								<span class="icon">
									<i class="fas fa-cloud"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-info is-outlined weatherBtn">
								<span class="icon">
									<i class="fas fa-umbrella"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-primary is-outlined weatherBtn">
								<span class="icon">
									<i class="far fa-snowflake"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-warning is-outlined weatherBtn">
								<span class="icon">
									<i class="fas fa-bolt"></i>
								</span>
							</a>
						</p>
					</div>
				</nav>
				<hr style="border:1px solid lightgray">
			</section>
			<% for(int i = 0; i < 10; i++) { %>
			<section class="section dayArea">
				<div class="card">
					<header class="card-header">
						<p class="icon is-large" style="color:#8e44ad; margin:5px">
							<i class="fas fa-2x fa-bookmark"></i>
						</p>
						<p class="card-header-title">
							일정제모오오오오오오오오오옥
						</p>
						<a class="card-header-icon">
							<span class="icon detailEditBtn" 
							style="color:#8e44ad; margin-right:10px; width:100px">
								작성하기
								<i class="fas fa-2x fa-pencil-alt"></i>
							</span>
							<span class="icon detailShowBtn"><i class="fa fa-angle-down"></i></span>
						</a>
					</header>
					<div class="card-content" style="display:none">
						<div class="content editor">
							<!-- <p align="center">
								Lorem ipsum dolor sit amet, <br>
								consectetur adipiscing elit.
								Phasellus nec iaculis mauris. <br>
								<a>@bulmaio</a>. <a>#css</a> <a>#responsive</a>
								<br> 
								<small>11:09 PM - 1 Jan 2016</small>
							</p>
							<figure class="image" style="margin:0">
								<img src="resources/images/sample1.jpg">
							</figure> -->
						</div>
					</div>
					<footer class="card-footer" style="display:none">
						<a class="card-footer-item" style="background:mediumpurple;color:white">Save</a> 
						<a class="card-footer-item" style="background:skyblue;color:white">Edit</a>
						<a class="card-footer-item" style="background:lightgray;color:white">Delete</a>
					</footer>
				</div>
			</section>
			<% } %>
			<section class="section gallaryArea" style="display:none">
				<div class="columns">
					<% for(int i = 0; i < 3; i++) { %>
					<div class="column is-one-third">
							<div class="card trvCard">
								<div class="card-image">
									<figure class="image" style="margin:0">
										<img src="resources/images/sample1.jpg">
									</figure>
								</div>
								<div class="card-content">
									<div class="content" align="right">
										2019-07-01
									</div>
									<div class="content">
										<p>사진1</p>
									</div>
								</div>
							</div>
						</div>
						<% } %>
					</div>
			</section>
			<section class="section gallaryArea" style="padding-bottom:10px; display:none;" >
				<nav class="level">
					<div class="level-left">
						<div class="level-item">
							<p class="subtitle is-3">
								<strong>DAY 2</strong> 
							</p>
							<p class="help">2019-07-01</p>
						</div>
						<div class="level-item">
							<div class="field">
								<p class="control">
									<input class="input" type="text" placeholder="MEMO">
								</p>
							</div>
						</div>
					</div>
					<div class="level-right" id="weatherArea">
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-danger is-outlined weatherBtn">
								<span class="icon">
									<i class="fas fa-sun"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-dark is-outlined weatherBtn">
								<span class="icon">
									<i class="fas fa-cloud"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-info is-outlined weatherBtn">
								<span class="icon">
									<i class="fas fa-umbrella"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-primary is-outlined weatherBtn">
								<span class="icon">
									<i class="far fa-snowflake"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-warning is-outlined weatherBtn">
								<span class="icon">
									<i class="fas fa-bolt"></i>
								</span>
							</a>
						</p>
					</div>
				</nav>
				<hr style="border:1px solid lightgray">
			</section>
			<section class="section gallaryArea" style="display:none">
				<div class="columns">
					<% for(int i = 0; i < 3; i++) { %>
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
										</div>
										<div class="media-right">
											<span>2019-07-01</span>
										</div>
									</div>
									<div class="content">
										<p>사진1</p>
									</div>
								</div>
							</div>
						</div>
						<% } %>
					</div>
			</section>
		</div>
	</div>
	
	<script>
				
		var quills = [];
		$("#dayList>li").click(function() {
			$(this).children("a").addClass('is-active');
			$(this).siblings().children("a").removeClass('is-active');
			$("#gallaryList li>a").removeClass('is-active');
			$(".gallaryArea").hide();
			$(".dayArea").show();
		});
		$("#gallaryList>li:first").click(function() {
			$("#gallaryList>li>ul>li").children("a").removeClass('is-active');
			$(this).children("a").addClass('is-active');
			$("#dayList>li").children("a").removeClass('is-active');
			$(".gallaryArea").show();
			$(".dayArea").hide();
		});
		$("#gallaryList>li>ul>li").click(function() {
			$("#gallaryList>li:first").children("a").removeClass('is-active');
			$(this).children("a").addClass('is-active');
			$(this).siblings().children("a").removeClass('is-active');
			$("#dayList>li").children("a").removeClass('is-active');
		});
		$(".weatherBtn").click(function() {
			$(this).removeClass('is-outlined');
			$(this).parent().siblings().children().addClass('is-outlined')
		});
		$(".detailShowBtn, .detailEditBtn").click(function() {
			$(this).parent().parent().next().toggle();
			$(this).parent().parent().next().next().toggle();
		});
		
		
		
		$(function() {
			var toolbarOptions = [
				  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
				  ['blockquote', 'code-block'],
	
				  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
				  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
				  [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
				  [{ 'direction': 'rtl' }],                         // text direction
	
				  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
	
				  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
				  [{ 'font': [] }],
				  [{ 'align': [] }],
				  
				  ['link', 'image'],
	
				  ['clean']                                         // remove formatting button
			];
			
			$(".editor").each(function() {
				var container = $(this).get(0);
				var quill = new Quill(container, {
					modules : {
						toolbar:toolbarOptions
					},
					placeholder : '멋진 사진과 함께 여행 후기글을 작성해보세요! ',
					theme : 'snow' // or 'bubble'
				});
				quills.push(quill);
			});
		});
	</script>
</body>
</html>