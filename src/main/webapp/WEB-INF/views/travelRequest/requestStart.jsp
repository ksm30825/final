<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.input {
	width: 30% px !important;
}

textarea {
	width: 120%;
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
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	<div class="columns">
		<div class="column">
			<section class="section" id="form">
				<h1 class="title">일정작성</h1>
				<hr>
				<div class="columns">
					<div class="column">
						<br>
						<div class="field">
							<a class="button is-primary"> Day1 </a> &nbsp; <span
								data-balloon="size: 3x" data-balloon-pos="up"
								class="db color-inherit link hover-cyan"><svg
									aria-hidden="true" focusable="false" data-prefix="fas"
									data-icon="times-circle" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
									class="svg-inline--fa fa-times-circle fa-w-16 fa-3x">
									<path fill="currentColor"
										d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm121.6 313.1c4.7 4.7 4.7 12.3 0 17L338 377.6c-4.7 4.7-12.3 4.7-17 0L256 312l-65.1 65.6c-4.7 4.7-12.3 4.7-17 0L134.4 338c-4.7-4.7-4.7-12.3 0-17l65.6-65-65.6-65.1c-4.7-4.7-4.7-12.3 0-17l39.6-39.6c4.7-4.7 12.3-4.7 17 0l65 65.7 65.1-65.6c4.7-4.7 12.3-4.7 17 0l39.6 39.6c4.7 4.7 4.7 12.3 0 17L312 256l65.6 65.1z"
										class=""></path></svg></span> <span data-balloon="size: 3x"
								data-balloon-pos="up" class="db color-inherit link hover-indigo"><svg
									aria-hidden="true" focusable="false" data-prefix="fas"
									data-icon="plus-circle" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
									class="svg-inline--fa fa-plus-circle fa-w-16 fa-3x">
									<path fill="currentColor"
										d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm144 276c0 6.6-5.4 12-12 12h-92v92c0 6.6-5.4 12-12 12h-56c-6.6 0-12-5.4-12-12v-92h-92c-6.6 0-12-5.4-12-12v-56c0-6.6 5.4-12 12-12h92v-92c0-6.6 5.4-12 12-12h56c6.6 0 12 5.4 12 12v92h92c6.6 0 12 5.4 12 12v56z"
										class=""></path></svg></span> <input class="input" type="text"
								placeholder="하루 일정을 입력해주세요(지역 - 지역 - 지역)">
							<p class="control">
								<textarea class="textarea" placeholder="일정 작성"></textarea>
							</p>
						</div>
						<br>
						<hr>
						<br>
						<div class="field">
							<a class="button is-primary"> Day2 </a> &nbsp; <span
								data-balloon="size: 3x" data-balloon-pos="up"
								class="db color-inherit link hover-cyan"><svg
									aria-hidden="true" focusable="false" data-prefix="fas"
									data-icon="times-circle" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
									class="svg-inline--fa fa-times-circle fa-w-16 fa-3x">
									<path fill="currentColor"
										d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm121.6 313.1c4.7 4.7 4.7 12.3 0 17L338 377.6c-4.7 4.7-12.3 4.7-17 0L256 312l-65.1 65.6c-4.7 4.7-12.3 4.7-17 0L134.4 338c-4.7-4.7-4.7-12.3 0-17l65.6-65-65.6-65.1c-4.7-4.7-4.7-12.3 0-17l39.6-39.6c4.7-4.7 12.3-4.7 17 0l65 65.7 65.1-65.6c4.7-4.7 12.3-4.7 17 0l39.6 39.6c4.7 4.7 4.7 12.3 0 17L312 256l65.6 65.1z"
										class=""></path></svg></span> <input class="input" type="text"
								placeholder="하루 일정을 입력해주세요(지역 - 지역 - 지역)">
							<p class="control">
								<textarea class="textarea" placeholder="일정 작성"></textarea>
							</p>
						</div>
						<br>
						<hr>
						<br>
						<div class="field">
							<a class="button is-primary"> Day3 </a> &nbsp; <span
								data-balloon="size: 3x" data-balloon-pos="up"
								class="db color-inherit link hover-cyan"><svg
									aria-hidden="true" focusable="false" data-prefix="fas"
									data-icon="times-circle" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
									class="svg-inline--fa fa-times-circle fa-w-16 fa-3x">
									<path fill="currentColor"
										d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm121.6 313.1c4.7 4.7 4.7 12.3 0 17L338 377.6c-4.7 4.7-12.3 4.7-17 0L256 312l-65.1 65.6c-4.7 4.7-12.3 4.7-17 0L134.4 338c-4.7-4.7-4.7-12.3 0-17l65.6-65-65.6-65.1c-4.7-4.7-4.7-12.3 0-17l39.6-39.6c4.7-4.7 12.3-4.7 17 0l65 65.7 65.1-65.6c4.7-4.7 12.3-4.7 17 0l39.6 39.6c4.7 4.7 4.7 12.3 0 17L312 256l65.6 65.1z"
										class=""></path></svg></span> <input class="input" type="text"
								placeholder="하루 일정을 입력해주세요(지역 - 지역 - 지역)">
							<p class="control">
								<textarea class="textarea" placeholder="일정 작성"></textarea>
							</p>
						</div>
						<br>
						<hr>
						<br>
						<div class="field">
							<a class="button is-primary"> Day4 </a> &nbsp; <span
								data-balloon="size: 3x" data-balloon-pos="up"
								class="db color-inherit link hover-cyan"><svg
									aria-hidden="true" focusable="false" data-prefix="fas"
									data-icon="times-circle" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
									class="svg-inline--fa fa-times-circle fa-w-16 fa-3x">
									<path fill="currentColor"
										d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm121.6 313.1c4.7 4.7 4.7 12.3 0 17L338 377.6c-4.7 4.7-12.3 4.7-17 0L256 312l-65.1 65.6c-4.7 4.7-12.3 4.7-17 0L134.4 338c-4.7-4.7-4.7-12.3 0-17l65.6-65-65.6-65.1c-4.7-4.7-4.7-12.3 0-17l39.6-39.6c4.7-4.7 12.3-4.7 17 0l65 65.7 65.1-65.6c4.7-4.7 12.3-4.7 17 0l39.6 39.6c4.7 4.7 4.7 12.3 0 17L312 256l65.6 65.1z"
										class=""></path></svg></span> <input class="input" type="text"
								placeholder="하루 일정을 입력해주세요(지역 - 지역 - 지역)">
							<p class="control">
								<textarea class="textarea" placeholder="일정 작성"></textarea>
							</p>
						</div>
						<br>
						<hr>
						<br>
						<div class="field">
							<a class="button is-primary"> Day5 </a> &nbsp; <span
								data-balloon="size: 3x" data-balloon-pos="up"
								class="db color-inherit link hover-cyan"><svg
									aria-hidden="true" focusable="false" data-prefix="fas"
									data-icon="times-circle" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
									class="svg-inline--fa fa-times-circle fa-w-16 fa-3x">
									<path fill="currentColor"
										d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm121.6 313.1c4.7 4.7 4.7 12.3 0 17L338 377.6c-4.7 4.7-12.3 4.7-17 0L256 312l-65.1 65.6c-4.7 4.7-12.3 4.7-17 0L134.4 338c-4.7-4.7-4.7-12.3 0-17l65.6-65-65.6-65.1c-4.7-4.7-4.7-12.3 0-17l39.6-39.6c4.7-4.7 12.3-4.7 17 0l65 65.7 65.1-65.6c4.7-4.7 12.3-4.7 17 0l39.6 39.6c4.7 4.7 4.7 12.3 0 17L312 256l65.6 65.1z"
										class=""></path></svg></span> <input class="input" type="text"
								placeholder="하루 일정을 입력해주세요(지역 - 지역 - 지역)">
							<p class="control">
								<textarea class="textarea" placeholder="일정 작성"></textarea>
							</p>
						</div>
						<br>
						<hr>
						<br>
						<div class="field">
							<a class="button is-primary"> Day6 </a> &nbsp; <span
								data-balloon="size: 3x" data-balloon-pos="up"
								class="db color-inherit link hover-cyan"><svg
									aria-hidden="true" focusable="false" data-prefix="fas"
									data-icon="times-circle" role="img"
									xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"
									class="svg-inline--fa fa-times-circle fa-w-16 fa-3x">
									<path fill="currentColor"
										d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm121.6 313.1c4.7 4.7 4.7 12.3 0 17L338 377.6c-4.7 4.7-12.3 4.7-17 0L256 312l-65.1 65.6c-4.7 4.7-12.3 4.7-17 0L134.4 338c-4.7-4.7-4.7-12.3 0-17l65.6-65-65.6-65.1c-4.7-4.7-4.7-12.3 0-17l39.6-39.6c4.7-4.7 12.3-4.7 17 0l65 65.7 65.1-65.6c4.7-4.7 12.3-4.7 17 0l39.6 39.6c4.7 4.7 4.7 12.3 0 17L312 256l65.6 65.1z"
										class=""></path></svg></span> <input class="input" type="text"
								placeholder="하루 일정을 입력해주세요(지역 - 지역 - 지역)">
							<p class="control">
								<textarea class="textarea" placeholder="일정 작성"></textarea>
							</p>
						</div>
						<br>
						<hr>
						<br>
					</div>
					<div class="column map" style="width: 50%;">
						<div class="field is-grouped">
							<p class="control is-expanded">
								<input class="input" type="text" placeholder="장소 검색">
							</p>
							<p class="control">
								<a class="button is-info"> 검색 </a>
							</p>
						</div>
						<div class="card">
							<!-- <div> -->
							<figure id="map" class="image is-4by3">
								<!-- <img src="https://source.unsplash.com/random/800x600"
										alt="Image"> -->
							</figure>
							<!-- </div> -->
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
										<a class="button is-primary"> 일정추가 </a>
									</div>
								</div>
								<div class="content">
									<div class="card">
										<div class="card-content">
											<div class="content">
												<input class="input" type="text" placeholder="여행 제목 입력">
												<hr>
												<textarea class="textarea" placeholder="여행 소개"></textarea>
											</div>
										</div>
										<footer class="card-footer">
											<a class="card-footer-item">중간저장</a> <a
												class="card-footer-item" onclick="back();">돌아가기</a> <a
												class="card-footer-item" data-target="#okModal"
												onclick="$('#okModal').toggleClass('is-active')">최종 저장</a> <a
												class="card-footer-item"
												onclick="$('#loadModal').toggleClass('is-active')">불러오기</a>
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
															<td><textarea>100,000원</textarea></td>
															<td><textarea>100,000원</textarea></td>
															<td><textarea>100,000원</textarea></td>
															<td><textarea>300,000원</textarea></td>
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

	<!-- 최종설계 모달 -->
	<div class="modal" id="okModal">
		<div class="modal-background"></div>
		<div class="modal-card">
			<header class="modal-card-head">
				<p class="modal-card-title">하이라이트 일정</p>
			</header>
			<section class="modal-card-body">
				<p>3개만 선택하세요</p>
				<section class="section choose" id="table">
					<table class="table">
						<tbody>
							<tr>
								<td><input type="checkbox">Day1</td>
								<td><input type="checkbox">Day2</td>
								<td><input type="checkbox">Day3</td>
								<td><input type="checkbox">Day4</td>
								<td><input type="checkbox">Day5</td>
								<td><input type="checkbox">Day6</td>
							</tr>
							<tr>
								<td><input type="checkbox">Day7</td>
								<td><input type="checkbox">Day8</td>
								<td><input type="checkbox">Day9</td>
								<td><input type="checkbox">Day10</td>
								<td><input type="checkbox">Day11</td>
								<td><input type="checkbox">Day12</td>
							</tr>
						</tbody>
					</table>
				</section>
			</section>
			<footer class="modal-card-foot">
				<a type="submit" class="button is-primary"
					onclick="myRequestPlan();">확인</a> <a class="button"
					onclick="cancel();">취소</a>
			</footer>
		</div>
	</div>

	<!-- 불러오기 모달 -->
	<div class="modal" id="loadModal">
		<div class="modal-background"></div>
		<div class="modal-card">
			<header class="modal-card-head">
				<p class="modal-card-title">나의 일정</p>
			</header>
			<section class="modal-card-body">
				<section class="section" id="table">
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th>일정번호</th>
								<th>제목</th>
								<th>여행지</th>
								<th>일정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td><b>1</b></td>
								<td>여행제목</td>
								<td>일본</td>
								<td>2012/07/10 ~ 2012/07/20</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td><b>2</b></td>
								<td>여행제목</td>
								<td>일본</td>
								<td>2012/07/10 ~ 2012/07/20</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td><b>3</b></td>
								<td>여행제목</td>
								<td>일본</td>
								<td>2012/07/10 ~ 2012/07/20</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td><b>4</b></td>
								<td>여행제목</td>
								<td>일본</td>
								<td>2012/07/10 ~ 2012/07/20</td>
							</tr>
							<!-- <tr class="is-selected"> -->
							<tr>
								<td><input type="checkbox"></td>
								<td><b>5</b></td>
								<td>여행제목</td>
								<td>일본</td>
								<td>2012/07/10 ~ 2012/07/20</td>
							</tr>
						</tbody>
					</table>
				</section>
			</section>
			<footer class="modal-card-foot">
				<a class="button is-primary" onclick="ok();">확인</a> <a
					class="button" onclick="cancel();">취소</a>
			</footer>
		</div>
	</div>
	<script>
	$(function() {
		$(".hover-cyan").click(function() {
			alert("일정 삭제하시겠습니까?");
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

	function back() {
		location = "requestDetail.tr";
	}
	
	function myRequestPlan() {
		location = "myRequestPlan.mp"
	}
	function ok() {
		location = location;
	}
	function cancel() {
		location = location;
	}
	
	//구글 맵
	 /* var map;
	 var service;
	 var infowindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 8
        });
      } */
      var map;
      var service;
      var infowindow;

      function initMap() {
        var sydney = new google.maps.LatLng(-33.867, 151.195);

        infowindow = new google.maps.InfoWindow();

        map = new google.maps.Map(
            document.getElementById('map'), {center: sydney, zoom: 15});

        var request = {
          query: 'Museum of Contemporary Art Australia',
          fields: ['name', 'geometry'],
        };

        var service = new google.maps.places.PlacesService(map);

        service.findPlaceFromQuery(request, function(results, status) {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            for (var i = 0; i < results.length; i++) {
              createMarker(results[i]);
            }
            map.setCenter(results[0].geometry.location);
          }
        });
      }
</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBHA8SfsYSWfcmA-kb6Y1Gf4ucjOrvfXZI&callback=initMap&libraries=places"
		async defer></script>

</body>
</html>
<!-- <!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
      var map;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 8
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBHA8SfsYSWfcmA-kb6Y1Gf4ucjOrvfXZI&callback=initMap"
    async defer></script>
  </body>
</html> -->