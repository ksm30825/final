<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bulmaswatch.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/semantic.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.theme.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.structure.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/semantic.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
</head>
<style>
	* {
		margin: 0; padding: 0;
	}
	.container {
		width: 100%;
		height: 100%;
	}
	.trans {
		transition: all 1s ease;
		-moz-transition: all 1s ease;
		-ms-transition: all 1s ease;
		-o-transition: all 1s ease;
		-webkit-transition: all 1s ease;
	}
	.top {
		display: flex;
		width: 80vw;
		height: 80vh;
		margin-top: 10vh;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 10vh;
	}
	.top ul {
		list-style: none;
		width: 100%;
		height: 100%;
		z-index: 1;
		box-sizing: border-box;
	}
	.top ul li {
		position: relative;
		float: left;
		width: 25%;
		height: 25%;
		overflow: hidden;
	}

	.top ul li::before {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: #000;
		content: '';
		color: white;
		opacity: 0.4;
		text-align: center;
		box-sizing: border-box;
		pointer-events: none;
		transition: all 0.5s ease;
		-moz-transition: all 0.5s ease;
		-ms-transition: all 0.5s ease;
		-o-transition: all 0.5s ease;
		-webkit-transition: all 0.5s ease;
	}
	.top ul li:hover::before {
		opacity: 0;
		background-color: rgba(0,0,0,0.90);
	}
	.top ul li img {
		width: 100%;
		height: auto;
		overflow: hidden;
	}
	.lightbox {
		position: fixed;
		width: 100%;
		height: 100%;
		text-align: center;
		top: 0;
		left: 0;
		background-color: rgba(0,0,0,0.75);
		z-index: 999;
		opacity: 0;
		pointer-events: none;
	}
	.lightbox img {
		max-width: 90%;
		max-height: 80%;
		position: relative;
		top: -100%;
		/* Transition */
		transition: all 1s ease;
		-moz-transition: all 1s ease;
		-ms-transition: all 1s ease;
		-o-transition: all 1s ease;
		-webkit-transition: all 1s ease;
	}
	.lightbox:target {
		outline: none;
		top: 0;
		opacity: 1;
		pointer-events: auto;
		transition: all 1.2s ease;
		-moz-transition: all 1.2s ease;
		-ms-transition: all 1.2s ease;
		-o-transition: all 1.2s ease;
		-webkit-transition: all 1.2s ease;
	}
	.lightbox:target img {
		top: 0;
		top: 50%;
		transform: translateY(-50%);
		-moz-transform: translateY(-50%);
		-ms-transform: translateY(-50%);
		-o-transform: translateY(-50%);
		-webkit-transform: translateY(-50%);
	}

	#galleryTitle {
		text-align: center;
		padding: 3em;
	}
</style>
<body>

	<div id="galleryTitle">
		<p class="title is-3" style="color: rgb(52, 73, 94);"><i class="far fa-image"></i>&nbsp; DAY1 : 장소명</p>
		<hr style="border: 0.5px solid black;">
	</div>
	
	<div class="container">
		<div class="top">
	    	<ul>
	        	<li><a href="#img_1"><img src="https://image.freepik.com/free-photo/from-blue-to-brown_426-19320820.jpg"></a></li>
	            <li><a href="#img_2"><img src="https://image.freepik.com/free-photo/colorful-springtime_385-19321241.jpg"></a></li>
	            <li><a href="#img_3"><img src="https://images.unsplash.com/32/Mc8kW4x9Q3aRR3RkP5Im_IMG_4417.jpg?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=46a85a1451e47aea5152ade8299f2894"></a></li>
	            <li><a href="#img_4"><img src="https://image.freepik.com/free-photo/a-sky-full-of-stars_426-19320899.jpg"></a></li>
	            <li><a href="#img_5"><img src="https://image.freepik.com/free-photo/sunlight-in-the-forest_1004-9.jpg"></a></li>
	            <li><a href="#img_6"><img src="https://image.freepik.com/free-photo/road-curve-landscape_426-19324358.jpg"></a></li>
	            <li><a href="#img_7"><img src="https://image.freepik.com/free-photo/shiny-lights_385-19321244.jpg"></a></li>
	            <li><a href="#img_8"><img src="https://image.freepik.com/free-photo/skyscraper-with-clouds-reflection_23-10.jpg"></a></li>
	            <li><a href="#img_9"><img src="https://image.freepik.com/free-photo/foggy-pine-forest_426-19323742.jpg"></a></li>
	            <li><a href="#img_10"><img src="https://image.freepik.com/free-photo/working-from-bed_385-19324222.jpg"></a></li>
	            <li><a href="#img_11"><img src="https://image.freepik.com/free-photo/a-sky-full-of-stars_426-19320899.jpg"></a></li>
	            <li><a href="#img_12"><img src="https://image.freepik.com/free-photo/city-in-bokeh_426-19322711.jpg"></a></li>
	            <li><a href="#img_13"><img src="https://image.freepik.com/free-photo/desert-and-the-road_426-19314945.jpg"></a></li>
	            <li><a href="#img_14"><img src="https://image.freepik.com/free-photo/sunlight-through-the-grass_385-19321333.jpg"></a></li>
	            <li><a href="#img_15"><img src="https://image.freepik.com/free-photo/colorful-springtime_385-19321241.jpg"></a></li>
	            <li><a href="#img_16"><img src="https://image.freepik.com/free-photo/from-blue-to-brown_426-19320820.jpg"></a></li>
	        </ul>
	        
	        <a href="#_1" class="lightbox trans" id="img_1"><img src="https://image.freepik.com/free-photo/from-blue-to-brown_426-19320820.jpg"></a>
	        <a href="#_2" class="lightbox trans" id="img_2"><img src="https://image.freepik.com/free-photo/colorful-springtime_385-19321241.jpg"></a>
	        <a href="#_3" class="lightbox trans" id="img_3"><img src="https://images.unsplash.com/32/Mc8kW4x9Q3aRR3RkP5Im_IMG_4417.jpg?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&w=1080&fit=max&s=46a85a1451e47aea5152ade8299f2894"></a>
	        <a href="#_4" class="lightbox trans" id="img_4"><img src="https://image.freepik.com/free-photo/a-sky-full-of-stars_426-19320899.jpg"></a>
	        <a href="#_5" class="lightbox trans" id="img_5"><img src="https://image.freepik.com/free-photo/sunlight-in-the-forest_1004-9.jpg"></a>
	        <a href="#_6" class="lightbox trans" id="img_6"><img src="https://image.freepik.com/free-photo/road-curve-landscape_426-19324358.jpg"></a>
	        <a href="#_7" class="lightbox trans" id="img_7"><img src="https://image.freepik.com/free-photo/shiny-lights_385-19321244.jpg"></a>
	        <a href="#_8" class="lightbox trans" id="img_8"><img src="https://image.freepik.com/free-photo/skyscraper-with-clouds-reflection_23-10.jpg"></a>
	        <a href="#_9" class="lightbox trans" id="img_9"><img src="https://image.freepik.com/free-photo/foggy-pine-forest_426-19323742.jpg"></a>
	        <a href="#_10" class="lightbox trans" id="img_10"><img src="https://image.freepik.com/free-photo/working-from-bed_385-19324222.jpg"></a>
	        <a href="#_11" class="lightbox trans" id="img_11"><img src="https://image.freepik.com/free-photo/a-sky-full-of-stars_426-19320899.jpg"></a>
	        <a href="#_12" class="lightbox trans" id="img_12"><img src="https://image.freepik.com/free-photo/city-in-bokeh_426-19322711.jpg"></a>
	        <a href="#_13" class="lightbox trans" id="img_13"><img src="https://image.freepik.com/free-photo/desert-and-the-road_426-19314945.jpg"></a>
	        <a href="#_14" class="lightbox trans" id="img_14"><img src="https://image.freepik.com/free-photo/sunlight-through-the-grass_385-19321333.jpg"></a>
	        <a href="#_15" class="lightbox trans" id="img_15"><img src="https://image.freepik.com/free-photo/colorful-springtime_385-19321241.jpg"></a>
	        <a href="#_16" class="lightbox trans" id="img_16"><img src="https://image.freepik.com/free-photo/from-blue-to-brown_426-19320820.jpg"></a>
	    </div>
	</div>

</body>
</html>