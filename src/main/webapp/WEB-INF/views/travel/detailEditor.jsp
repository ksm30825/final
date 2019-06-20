<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TI - detailEditor</title>
</head>
<body>
	<div class="columns">
		<div class="column is-3">
			<section class="section">
				<aside class="menu">
					<p class="menu-label">일자별 상세글</p>
					<ul class="menu-list">
						<li><a class="is-active"><strong>DAY 1</strong></a></li>
						<li><a><strong>DAY 2</strong></a></li>
						<li><a><strong>DAY 3</strong></a></li>
						<li><a><strong>DAY 4</strong></a></li>
						<li><a><strong>DAY 5</strong></a></li>
						<li><a><strong>DAY 6</strong></a></li>
						
					</ul>
					<p class="menu-label">사진 갤러리</p>
					<ul class="menu-list">
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
						</div>
						<div class="level-item">
							<div class="field">
								<p class="control">
									<input class="input" type="text" placeholder="MEMO">
								</p>
							</div>
						</div>
					</div>
					<div class="level-right">
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-danger is-outlined">
								<span class="icon">
									<i class="fas fa-sun"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-dark is-outlined">
								<span class="icon">
									<i class="fas fa-cloud"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-info is-outlined">
								<span class="icon">
									<i class="fas fa-umbrella"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-primary is-outlined">
								<span class="icon">
									<i class="far fa-snowflake"></i>
								</span>
							</a>
						</p>
						<p class="level-item" style="margin:0 10px 0 0">
							<a class="button is-warning is-outlined">
								<span class="icon">
									<i class="fas fa-bolt"></i>
								</span>
							</a>
						</p>
					</div>
				</nav>
				<hr style="border:1px solid lightgray">
			</section>
			<section class="section">
				<div class="card">
					<header class="card-header">
						<p class="card-header-title">일정제모오오오오오오오오오옥</p>
						<a class="card-header-icon"> 
							<span class="icon"><i class="fa fa-angle-down"></i></span>
						</a>
					</header>
					<div class="card-content">
						<div class="content">
							Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Phasellus nec iaculis mauris. <a>@bulmaio</a>. <a>#css</a> <a>#responsive</a>
							<br> <small>11:09 PM - 1 Jan 2016</small>
						</div>
					</div>
					<footer class="card-footer">
						<a class="card-footer-item">Save</a> <a class="card-footer-item">Edit</a>
						<a class="card-footer-item">Delete</a>
					</footer>
				</div>
			</section>
		</div>
	</div>
</body>
</html>