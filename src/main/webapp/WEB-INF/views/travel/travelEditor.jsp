<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bulmaswatch.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/semantic.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.theme.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.structure.min.css">
<link rel="stylesheet" href="resources/css/travel/map-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/semantic.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>

<style>
	body {
		overflow-x:visible !important;
	}
	.navbar-item img {
    	max-height: 100% !important;
   	}
	.navbar-burger {
		width:200px !important;
	}
</style>

</head>
<body>
	<%-- <c:set var="trv" value="${ sessionScopetrv }" /> --%>
	<nav class="navbar is-white is-fixed-top" style="border-bottom:1px solid skyblue">
    	<div class="navbar-brand">
    		<div class="navbar-item field is-grouped" style="margin:0">
         		<p class="control">
         			<a class="icon is-rounded is-large" onclick="goToMyTravel();"> 
                        <i class="fas fa-3x fa-chevron-circle-left"></i>
                    </a>
            	</p>
            	<p class="control">
                    <a class="button is-rounded" onclick="showTrvInfoModal();"> 
                        <i class="fas fa-info-circle"></i>
                        <span>여행정보수정</span>
                    </a>
                </p>
                <p class="control">
                    <a class="button is-info is-rounded" onclick="completeTravel();"> 
                        <span>작성완료</span>
                    </a>
                </p>
                <p class="control">
                    <a class="button is-dark is-rounded" onclick="deleteTravel();"> 
                        <span>삭제하기</span>
                    </a>
                </p>
            </div>
         	<div class="navbar-burger burger is-hidden-tablet">
		        <!-- <a class="button is-primary is-rounded" href="#"> 
                    <i class="fas fa-users"></i>
                </a> -->
		    	<a class="navbar-item" href="index.jsp"> 
		            <img src="resources/images/logoWide.png" width="120px" height="40px">
		        </a>
         	</div> 
		</div>
      	<div id="mainNav" class="navbar-menu">
         	<div class="navbar-start">
			</div>
        	<div class="navbar-end">
        		<!-- <div class="navbar-item field" style="margin:0" data-tooltip="동행초대" data-position="left center">
	         		<p class="control">
	         			<a class="button is-primary is-rounded">
	                        <i class="fas fa-users"></i><br>
	                    </a>
	            	</p>
	            </div> --> 
            	<div class="navbar-brand">
		        	<a class="navbar-item" href="index.jsp"> 
		            	<img src="resources/images/logoWide.png" width="120px" height="40px">
		         	</a>
		        </div>
			</div>
		</div>
	</nav>
	
	<br><br>
	<div class="coumns">
		<div class="column">
			<section class="section" style="padding-bottom:0;">
				<div class="columns">
					<div class="column is-6">
						<h3 class="title is-3">
							<span class="icon" style="color:skyblue">
								<i class="fas fa-plane"></i>
							</span>&nbsp;&nbsp;
							<c:out value="${ trv.trvTitle }" />
						</h3>
						<h6 class="subtitle is-6" style="margin:0">
							<i class="fas fa-map-marker-alt"></i>
							<c:forEach var="trvCity" items="${ trvCityList }" varStatus="st">
								${ trvCity.countryNameKo }&nbsp; ${ trvCity.cityNameKo } 
								<c:if test="${ st.count ne trvCityList.size() }">/</c:if>&nbsp;
							</c:forEach>
							<c:set var="end" value="${ trv.endDate.getTime() }" />
							<c:set var="start" value="${ trv.startDate.getTime() }"	/>
							<c:set var="days" value="${ (end - start) / (1000 * 60 * 60 * 24) }"/>
							&nbsp;&nbsp;
							<span><strong>
								(<fmt:formatNumber value="${ days }" pattern="#" />박 
								<fmt:formatNumber value="${ days + 1 }" pattern="#" />일)</strong></span>
							 <%-- <% ${ days } %> --%>
						</h6>
						<p class="help">
							<c:forEach var="trvCity" items="${ trvCityList }" varStatus="st">
								${ trvCity.cityNameEn }, ${ trvCity.countryNameEn }  
								<c:if test="${ st.count ne trvCityList.size() }">/</c:if>&nbsp;
							</c:forEach>
						</p>
					</div>
					<div class="column is-1">
						<div class="dropdown">
							<div class="navbar-item field dropdown-trigger" id="inviteBtn"
								style="margin: 0" data-tooltip="동행초대" data-variation="mini"
								data-position="right center">
								<p class="control">
									<a class="button is-primary is-rounded" aria-haspopup="true"
										aria-controls="inviteDropdown" style="width: 40px"> <i
										class="fas fa-users"></i>
									</a>
								</p>
							</div>
							<div class="dropdown-menu" id="inviteDropdown" role="menu" style="min-width: 25rem;">
								<div class="dropdown-content">
									<div class="dropdown-item">
										<p>함께 여행하는 동행을 초대해서 일정을 공유하고 같이 작성해보세요!</p>
									</div>
									<hr class="dropdown-divider">
									<div class="dropdown-item">
										<p class="control has-icons-left">
											<span class="icon is-small is-left"> 
												<i class="fas fa-search-plus"></i>
											</span> 
											<input class="input is-rounded" type="text" placeholder="ID로 검색">
										</p>
										<p>
											user01 (홍길동) 
											<button class="button is-info is-small is-rounded">추가</button>
										</p>
									</div>
									<hr class="dropdown-divider">
									<div class="dropdown-item">
										<table class="table ">
											<!-- <thead>
												<tr>
													<th >초대된 사람</th>
													<th></th>
												</tr>
											</thead> -->
											<tbody>
												<tr>
													<td width="10%">
														<span class="icon">
															<i class="far fa-user"></i>
														</span>
													</td>
													<td width="70%">user01 (홍길동)</td>
													<td width="20%">
														<button class="button is-dark is-small">삭제</button>
													</td>
												</tr>
												<tr>
													<td width="10%">
														<span class="icon">
															<i class="far fa-user"></i>
														</span>
													</td>
													<td width="70%">user02 (문지원)</td>
													<td width="20%">
														<button class="button is-dark is-small">삭제</button>
													</td>
												</tr>
												<tr>
													<td width="10%">
														<span class="icon">
															<i class="far fa-user"></i>
														</span>
													</td>
													<td width="70%">user03 (천예랑)</td>
													<td width="20%">
														<button class="button is-dark is-small">삭제</button>
													</td>
												</tr>
												
											</tbody>
										</table>
									</div>
									<hr class="dropdown-divider">
									<div class="dropdown-item">
										<button class="button is-small closeBtn">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="column" style="line-height:80px;">
						<div class="tabs is-right editorMenu">
						    <ul>
						    	<li class="is-active" >
						        	<a><strong>일정작성</strong></a>
						      	</li> 
						      	<li >
						        	<a><strong>상세글작성</strong></a>
						      	</li>
						      	<li >
						        	<a><strong>일정전체보기</strong></a>
						      	</li>
						      	<li >
						        	<a><strong>가계부</strong></a>
						      	</li>
						    </ul>
						</div>
					</div>
				</div>			
			</section>
		</div>
	</div>
	<div>
		<div id="scheduleEditor">
			<jsp:include page="scheduleEditor.jsp" />
		</div>
		<div id="detailEditor" style="display:none">
			<jsp:include page="detailEditor.jsp" />
		</div>
		<div id="allSchedule" style="display:none;">
			<jsp:include page="allSchedule.jsp" />
		</div>
		<div id="costEditor" style="display:none">
			<jsp:include page="costEditor.jsp" />
		</div>
	</div>


	<jsp:include page="travelInfoModal.jsp" />
	<script>
		$(function() {
			$(".editorMenu").tab();
			$("#inviteBtn").click(function() {
				$("#inviteDropdown").toggle();
			});
			$(".closeBtn").click(function() {
				$("#inviteDropdown").hide();
			});
			
			//dayMemo
			$(".dayMemo").change(function() {
				var memo = $(this).val();
				var dayId = $(this).prev().val();
				$.ajax({
					url:"updateDayMemo.trv",
					type:"post",
					data:{dayMemo:memo, dayId: dayId},
					success:function(data) {
						console.log(data);
						console.log($(".day" + dayId + "Memo"));
						$(".day" + dayId + "Memo").each(function() {
							$(this).val(memo);
						});
					},
					error:function(data) {
						alert("memo 서버전송 실패");
					}
				});
			});
		});
		
		$(".editorMenu li").click(function() {
			$(this).addClass('is-active');
			$(this).siblings().removeClass('is-active');
			var menu = $(this).children().children().text();
			switch(menu) {
			case '일정작성' : $("#scheduleEditor").show();
							$("#scheduleEditor").siblings().hide(); break;
			case '상세글작성' : $("#detailEditor").show();
							$("#detailEditor").siblings().hide(); break;
			case '일정전체보기' : $("#allSchedule").show();
							$("#allSchedule").siblings().hide(); break;
			case '가계부' : $("#costEditor").show();
							$("#costEditor").siblings().hide(); break;
			}
		});
		function goToMyTravel() {
			location.href="showMyTravel.trv";
		}
		function completeTravel() {
			var answer = window.confirm("작성완료 처리시 사이트에 내 일정이 공개되고 다른 사람들이 구입할 수 있습니다. 공개하시겠습니까?");
			if(answer) {
				location.href="completeTravel.trv?trvId=${ trv.trvId }&memberId=${ sessionScope.loginUser.memberId }";
			}
		}
		function deleteTravel() {
			var answer = window.confirm("정말로 삭제하시겠습니까? 해당 여행의 일정이 모두 삭제됩니다.");
			if(answer) {
				location.href="deleteTravel.trv?trvId=${ trv.trvId }";
			}
		}
		
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7fLkDFvRtLNooR612ov12h_gwdsqDI6Q&libraries=places&callback=initMap"
    async defer></script>
	<script src="resources/js/travel/map-icons.js"></script>
	<!-- <script src="resources/js/travel/travel.js"></script> -->
	<script>
		var map;
		var mapWide;
		var service;
		var infowindow;
		var searchBox;
		var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		var labelIndex = 0;
		var icons = {
			basic:{
				icon:{
					path:mapIcons.shapes.MAP_PIN,
					fillColor: '#8B44F0',
					fillOpacity:1,
					scale:0.8,
					strokeColor:'',
					strokeWeight:0
				},
				map_icon_label : '<span class="map-icon map-icon-postal-code"></span>'
			},
			restaurant:{
				icon:{
					path:mapIcons.shapes.MAP_PIN,
					fillColor: '#F1BF1E',
					fillOpacity:1,
					scale:0.8,
					strokeColor:'',
					strokeWeight:0
				},
				map_icon_label : '<span class="map-icon map-icon-restaurant"></span>'
			},
			bar:{
				icon:{
					path:mapIcons.shapes.MAP_PIN,
					fillColor: '#DE2C26',
					fillOpacity:1,
					scale:0.8,
					strokeColor:'',
					strokeWeight:0
				},
				map_icon_label : '<span class="map-icon map-icon-night-club"></span>'
			},
			cafe:{
				icon:{
					path:mapIcons.shapes.MAP_PIN,
					fillColor: '#926B25',
					fillOpacity:1,
					scale:0.8,
					strokeColor:'',
					strokeWeight:0
				},
				map_icon_label : '<span class="map-icon map-icon-cafe"></span>'
			},
			museum:{
				icon:{
					path:mapIcons.shapes.MAP_PIN,
					fillColor: '#888888',
					fillOpacity:1,
					scale:0.8,
					strokeColor:'',
					strokeWeight:0
				},
				map_icon_label : '<span class="map-icon map-icon-museum"></span>'
			},
			park:{
				icon:{
					path:mapIcons.shapes.MAP_PIN,
					fillColor: '#0C6916',
					fillOpacity:1,
					scale:0.8,
					strokeColor:'',
					strokeWeight:0
				},
				map_icon_label : '<span class="map-icon map-icon-park"></span>'
			},
			shopping_mall:{
				icon:{
					path:mapIcons.shapes.MAP_PIN,
					fillColor: '#44BCF0',
					fillOpacity:1,
					scale:0.8,
					strokeColor:'',
					strokeWeight:0
				},
				map_icon_label : '<span class="map-icon map-icon-grocery-or-supermarket"></span>'
			},
			hotel:{
				icon:{
					path:mapIcons.shapes.MAP_PIN,
					fillColor: '#60D8D0',
					fillOpacity:1,
					scale:0.8,
					strokeColor:'',
					strokeWeight:0
				},
				map_icon_label : '<span class="map-icon map-icon-lodging"></span>'
			}
			
		};
		var markers = [];
		
		function initMap() {
			
			var sydney = new google.maps.LatLng(-33.867, 151.195);
			map = new google.maps.Map(document.getElementById('map'), {zoom:13, center:sydney});
			mapWide = new google.maps.Map(document.getElementById('mapWide'), {zoom:15, center:sydney});
			infowindow = new google.maps.InfoWindow();
			service = new google.maps.places.PlacesService(map);
			searchBox = new google.maps.places.SearchBox(document.getElementById('searchInput'));
			//map.controls[google.maps.ControlPosition.TOP_LEFT].push(document.getElementById('searchInput2'));
			map.controls[google.maps.ControlPosition.LEFT_TOP].push(document.getElementById('left-panel'));
			
			
			var cityRequest = { 
				query:"${ trvCityList[0].cityNameEn }",
				fields:['geometry']
			};
			service.findPlaceFromQuery(cityRequest, function(results, status) {
				if(status === google.maps.places.PlacesServiceStatus.OK) {
					map.setCenter(results[0].geometry.location);
				}
			});
			
			
			var places = [];
			$("#day1").find("input[name=plcId]").each(function() {
				places.push($(this).val());
			});
			showRoute(places);
			
			
			
			map.addListener('bounds_changed', function() {
				searchBox.setBounds(map.getBounds());
			});
	
			
			
			searchBox.addListener('places_changed', function() {
				var places = searchBox.getPlaces();
				if(places.length === 0) {
					return;
				}
				//clear out the old markers
				markers.forEach(function(m) {
					m.setMap(null);
				});
				dayPath.setMap(null);
				markers = [];
				//for each place, get the icon, name, and location
				var bounds = new google.maps.LatLngBounds();
				places.forEach(function (p) {
					if(!p.geometry) {
						return;
					}
					//create marker for each place
					addMarker({
						location:p.geometry.location,
						icon:icons.basic.icon,
						map_icon_label:icons.basic.map_icon_label,
						place_id:p.place_id,
						info: '<h5 class="title is-5">' + p.name + "'</h5>" + p.formatted_address
					});
					
					
					if(p.geometry.viewport) {
						//only geocodes have viewport
						bounds.union(p.geometry.viewport);
					}else {
						bounds.extend(p.geometry.location);
					}
				});
				
				placeDetailSearch(places[0].place_id);
				map.fitBounds(bounds);
			});
	
		}
		
		var dayPath;
		function showRoute(places) {
			
			map.setZoom(13);
			//clear out the old markers
			markers.forEach(function(m) {
				m.setMap(null);
			});
			if(dayPath != undefined) {
				dayPath.setMap(null);
			}
			markers = [];
			coords = [];
			var bounds = new google.maps.LatLngBounds();
			//bounds = map.getBounds();
			var coords = new google.maps.MVCArray();
			
			places.forEach(function(p, index) {
				var request = {
					placeId:p,
					fiels:['geometry', 'name']
				}
					
				service.getDetails(request, function(place, status) {
					if(status == google.maps.places.PlacesServiceStatus.OK) {
						
						var m = new google.maps.Marker({
							map:map,
							/* icon:{
								path: mapIcons.shapes.SQUARE_PIN,
								fillColor: '#FB0303',
								fillOpacity:1,
								scale:0.8,
								strokeColor:'',
								strokeWeight:0
							}, */
							label: {
								fontSize:'20px',
								text:index + 1 + "",
								color:'#fff'
							},
							animation: google.maps.Animation.DROP,
							title: place.name,
							position: place.geometry.location
						});
						
						markers.push(m);
						coords.push(place.geometry.location);
						
						
						/* if(place.geometry.viewport) {
							bounds.union(place.geometry.viewport);
						}else { */
							bounds.extend(m.position);
						//}
						
						if(index == 0) {
							map.setCenter(m.position);
						}
						
						m.addListener('click', function() {
							placeDetailSearch(place.place_id);
						});
					}
				});
				
			});
			
			map.fitBounds(bounds);
			//console.log(markers);
			//map.setCenter(markers[0].position);
			
			console.log(coords);
			dayPath = new google.maps.Polyline({
			    path:coords,
			    geodesic: true,
			    strokeColor: '#FB0303',
			    strokeOpacity: 1.0,
			    strokeWeight: 2
			});
			
			dayPath.setMap(map);
			
			
		}
	
		
		function placeDetailSearch(placeId) {
			var request = {
				placeId: placeId,
				fields:['name', 'formatted_address', 'international_phone_number', 'geometry',
					'rating', 'opening_hours', 'photos', 'reviews', 'website']
			};
			
			service.getDetails(request, function(place, status) {
				if(status == google.maps.places.PlacesServiceStatus.OK) {
					$("#detail-panel").show();
					$("#placeId").val(placeId);
					$("#placeName").text(place.name);
					$("#placeAdd").text(place.formatted_address);
					$("#placePhone").text(place.international_phone_number);
					$("#placePhoto").attr("src", place.photos[0].getUrl());
					$("#openHour").text(place.opening_hours.weekday_text.toString());
					$("#ratingStar").rating("set rating", Math.floor(place.rating));
					$("#placeRating").text(place.rating);
					
					for(var i = 0; i < place.reviews.length; i++) {
						if(i < 5) {
							$('<p><small><em>' + place.reviews[i].text + '(' +  place.reviews[i].relative_time_description 
									+ ') - ' + place.reviews[i].author_name + '</em></small></p>').appendTo($("#placeReview"));
						}
					}
					if(place.reviews.length > 5) {
						$('<p><small><em>.....</em></small></p>').appendTo($("#placeReview"));
					}
					
					
					var m = new google.maps.Marker({
						map:map,
						title: place.name,
						position: place.geometry.location
					});
					
					markers.push(m);
					var bounds = new google.maps.LatLngBounds();
					if(place.geometry.viewport) {
						bounds.union(place.geometry.viewport);
					}else {
						bounds.extend(place.geometry.location);
					}
					map.fitBounds(bounds);
					
					$("#closePlaceDetail").click(function() {
						$("#detail-panel").hide();
						$("#searchInput").val('');
						m.setMap(null);
					});
					
				}
			});
		}
	
	
		function placeTypeSearch(placeType) {
			
			var getNextPage = null;
			var moreBtn = document.getElementById('more');
			moreBtn.onclick = function() {
				moreBtn.disabled = true;
				if(getNextPage) getNextPage();
			};
			
			markers.forEach(function(marker) {
				marker.setMap(null);
			});
			dayPath.setMap(null);
			markers = [];
			var request = {
					location: map.getCenter(),
					radius: '1000',
					type: [placeType]
			};
			service.textSearch(request, function(results, status, pagination) {
				var bounds = new google.maps.LatLngBounds();
				var placeList = document.getElementById('placeList');
				if (status === google.maps.places.PlacesServiceStatus.OK) {
					for (var i = 0; i < results.length; i++) {
						var li = document.createElement('li');
						li.innerHTML += '<input type="hidden" name="placeId" value="' + results[i].place_id + '" />' + '<p><strong>' 
										+ results[i].name + '<small style="color:purple"> review:' + results[i].rating + '/5.0 </small></strong></p><p class="help">' + results[i].formatted_address  + '</p>'
						placeList.appendChild(li);
						bounds.extend(results[i].geometry.location);
						addMarker({
							location:results[i].geometry.location,
							icon:icons[placeType].icon,
							map_icon_label:icons[placeType].map_icon_label,
							place_id:results[i].place_id,
							info: '<h5 class="title is-5">' + results[i].name + "'</h5>" + results[i].formatted_address
						});
					}
					map.fitBounds(bounds);
					moreBtn.disabled = !pagination.hasNextPage;
					getNextPage = pagination.hasNextPage && function() {
						pagination.nextPage();
					}
					map.setCenter(results[0].geometry.location);
				}else return;
				
				$("#placeList").children("li").click(function() {
					var placeId = $(this).children("input[name=placeId]").val();
					console.log(placeId);
					placeDetailSearch(placeId);
				});
				
				$("#typeSearchDelete").click(function() {
					markers.forEach(function(marker) {
						marker.setMap(null);
					});
					markers = [];
					$("#placeList").empty();
				});
				
			});
		}
	
	
		function addMarker(props) {
			var marker = new mapIcons.Marker({
				position: props.location,
				//label: labels[labelIndex++ % labels.length],
				icon:props.icon,
				map_icon_label:props.map_icon_label,
				map: map
			});
			
			markers.push(marker);
			if(props.info) {
				var infoWindow = new google.maps.InfoWindow({
					content:props.info
				});
				marker.addListener('click', function() {
					infoWindow.open(map, marker);
				});
			}
			
			marker.addListener('click', function() {
				
				placeDetailSearch(props.place_id);
			});
			
		}
	
	</script>
</body>
</html>