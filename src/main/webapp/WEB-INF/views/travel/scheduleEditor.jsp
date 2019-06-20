<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TI - Schedule Editor</title>
</head>
<style>
	
	.panel-heading {
		background:#C09BE3;
	}
	.panel-tabs {
		overflow-x:auto;
	}
	.notification {
		background:#C6E4F3;
	}
	.tag.is-primary {
		color:white !important;
		text-decoration:none !important;
	}
		
</style>
<body>
	<div class="columns">
		<div class="column">
			<section class="section">
				<div class="columns">
					<div class="column is-3">
						<nav class="panel">
							<p class="panel-heading" align="center">DAY 1</p>
							<p class="panel-tabs">
								<a class="is-active">DAY 1</a> 
								<a>2</a> 
								<a>3</a> 
								<a>4</a>
								<a>5</a>
								<a>6</a>
								<a>7</a>
								<a>8</a>
								<a>9</a>
							</p>
							<label class="panel-block"><input type="checkbox">시간 보이기</label>
							<a class="panel-block is-active"> 
								<span class="panel-icon"><i class="fa fa-book"></i></span> bulma
							</a> 
							<a class="panel-block"> 
								<span class="panel-icon"><i class="fa fa-book"></i></span> marksheet
							</a> 
							<a class="panel-block">
								<span class="panel-icon"><i class="fa fa-book"></i></span> minireset.css
							</a> 
							<a class="panel-block"> 
								<span class="panel-icon"> <i class="fa fa-book"></i></span> jgthms.github.io
							</a>
							</a>
							<a class="panel-block"> 
								<span class="panel-icon"> <i class="fa fa-book"></i></span> jgthms.github.io
							</a>
							<a class="panel-block"> 
								<span class="panel-icon"> <i class="fa fa-book"></i></span> jgthms.github.io
							</a> 
							<div class="panel-block">
								<button class="button is-primary is-outlined is-fullwidth">일정 추가</button>
							</div>
						</nav>
					</div>				
					<div class="column is-3">
						<nav class="panel">
							<div class="tabs is-toggle" align="center" style="padding:0">
								<ul>
									<li class="is-active" style="width:50%">
								    	<a>
								        	<span class="icon is-small"><i class="far fa-heart"></i></span>
								          	<span>좋아요장소</span>
								        </a>
								    </li>
								    <li class="is-light" style="width:50%">
								     	<a>
								          	<span class="icon is-small"><i class="fas fa-thumbs-up"></i></span>
								          	<span>추천장소</span>
								        </a>
								    </li>
								</ul>
							</div>
							
							
							<label class="panel-block"><input type="checkbox">선택</label>
							<a class="panel-block is-active"> 
								<span class="panel-icon"><i class="fa fa-book"></i></span> bulma
							</a> 
							<a class="panel-block"> 
								<span class="panel-icon"><i class="fa fa-book"></i></span> marksheet
							</a> 
							<a class="panel-block">
								<span class="panel-icon"><i class="fa fa-book"></i></span> minireset.css
							</a> 
							<a class="panel-block"> 
								<span class="panel-icon"> <i class="fa fa-book"></i></span> jgthms.github.io
							</a>
							<a class="panel-block"> 
								<span class="panel-icon"> <i class="fa fa-book"></i></span> jgthms.github.io
							</a>
							<a class="panel-block"> 
								<span class="panel-icon"> <i class="fa fa-book"></i></span> jgthms.github.io
							</a>
							<a class="panel-block"> 
								<span class="panel-icon"> <i class="fa fa-book"></i></span> jgthms.github.io
							</a> 
							<div class="panel-block">
								<button class="button is-primary is-outlined is-fullwidth">모두 삭제</button>
							</div>
						</nav>
					</div>
					<div class="column is-6">
						<div style="border:1px solid gray; height:400px"></div>
					</div>
				</div>
			</section>			
			<section class="section">
				<div class="notification">
					<h4 class="title is-4">
						<i class="fas fa-hashtag"></i>여행테마 선택
					</h4>
					<div class="tags">
						<span class="tag is-primary"> Primary </span> 
						<span class="tag is-link"> Link </span> 
						<span class="tag is-info"> Info </span> 
						<span class="tag is-success"> Success </span> 
						<span class="tag is-warning"> Warning </span> 
						<span class="tag is-danger"> Danger </span> 
						<span class="tag is-white"> White </span> 
						<span class="tag is-black"> Black </span> 
						<span class="tag is-light"> Light </span> 
						<span class="tag is-dark"> Dark </span>
					</div>
					<hr style="border:1px solid lightgray">
					<h6 class="title is-6">내 여행 테마</h6>
					<div class="field is-grouped is-grouped-multiline">
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Technology</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">CSS</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Flexbox</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Web Design</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Open Source</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Community</a> <a class="tag is-delete"></a>
							</div>
						</div>
	
						<div class="control">
							<div class="tags has-addons">
								<a class="tag is-primary">Documentation</a> <a class="tag is-delete"></a>
							</div>
						</div>
					</div>
				</div>
				
				<!-- <div class="notification ">
			        <button class="delete"></button> 
			        Lorem ipsum dolor sit amet,
			        <a href="#">consectetur</a> 
			        adipiscing elit lorem ipsum dolor sit amet, consectetur adipiscing elit 
			    </div> -->
			</section>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>