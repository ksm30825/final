<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.tabs.is-fullwidth {
		margin-bottom: 0.5em;
	}
	
   #calendar{
      display: inline-block;
      width: 35%;
      height: 400px;
      border: 1px solid black;
      margin-right: 2%;
      overflow: scroll;
      overflow-x:hidden;
      float: left;
   }
   #calendarArea {
      text-align: left;
      width: 100%;
      white-space:nowrap; 
      overflow:auto; 
   }
   .calendarTable {
      width: 100%;
   }
   .calendarTable th {
      text-align: center;
   }
   .calendarTable td {
      text-align: center;
   }
   
   #mapArea{
      display: inline-block;
      width: 62%;
      height: 400px;
      border: 1px solid black;
      overflow: scroll;
      float: right;
      z-index: 3;
      position: relative;
   }
   #map {
      width:100%;
      height: 100%;
      z-index: 1;
      position: absolute;
   }
   #mapDaySelect {
      width: 100px;
      float: right;
      margin: 1em;
      z-index: 2;
      position: absolute;
   }
</style>
<body>
	<!-- 결제여부에 따른 출력될 일수 설정하기 -->
	<c:choose>
		<c:when test="${ !empty loginUser && detailTb.buyStatus eq 'Y' }">
			<fmt:parseNumber var="showDays" integerOnly="true" value="${ fn:length(detailDay) }"/>
		</c:when>
		<c:otherwise>
			<fmt:parseNumber var="showDays" integerOnly="true" value="${ fn:length(detailDay) / 3 }" />
		</c:otherwise>
	</c:choose>
	<input type="number" hidden="hidden" id="totalDays" value="${ fn:length(detailDay) }">
	<input type="number" hidden="hidden" id="showDays" value="${ showDays }">

	<!-- 서브메뉴 본문(일정표) -->
	<section class="section" id="detailSub">
		<div id="detailSubContent" align="center">
			<div id="calendar">
            	<div class="calendarArea">
            		
            		<c:forEach var="detailDay" items="${ detailDay }" varStatus="st">
      					<!-- 글 하나 -->
	        			<div class="tabs is-fullwidth" style="display: none;" id="day${ detailDay.dayNumber }">
	        			
	        				<!-- day 넘기는 화살표 -->
	        				<ul>
	        					<li>
	        						<a onclick="nextDays('${ detailDay.dayNumber }', 'left')">
	               						<span id="left" class="icon"><i class="fa fa-angle-left"></i></span>
	                              		</a>
	        					</li>
	        					<li>
	        						<span style="font-weight: 1px;"><strong>DAY ${ detailDay.dayNumber }</strong></span>
	        					</li>
	        					<li>
	        						<a onclick="nextDays('${ detailDay.dayNumber }', 'right')">
	                                   <span id="right" class="icon"><i class="fa fa-angle-right"></i></span>
	                                </a>
	        					</li>
	        				</ul>
	        			</div>
            		</c:forEach>
            		
           			<!-- 시간표시 여부 -->
           			<div align="right" style="border-bottom: 1px solid lightgray; padding-bottom: 0.3em;">
           				<input type="checkbox" id="timeCheck">
		            	<label for="timeCheck">시간 표시</label>
		            </div>
		            
		            <c:forEach var="detailDay" items="${ detailDay }" varStatus="st">
		            
		            <table class="calendarTable" id="calendarTable-day${ detailDay.dayNumber }" style="display: none;">
		            	<c:choose>
		            		<c:when test="${ fn:length(detailDay.trvSchedule) > 0 }">
		            			
		            			<c:choose>
		            				<c:when test="${ totalDays < 3 || showDays >= st.count }">
		            					<c:forEach var="trvSch" items="${ detailDay.trvSchedule }">
				            				<tr>
					            				<c:choose>
					            					<c:when test="${ trvSch.isTimeset eq 'Y' }">
					            						<th class="times" style="display: none;">${ trvSch.startTime } ~ ${ trvSch.endTime }</th>
					            					</c:when>
					            					<c:otherwise>
					            						<th class="times" style="display: none;"><span style="color: lightgray;">시간정보 없음</span></th>
					            					</c:otherwise>
					            				</c:choose>
				            					
				            					<c:choose>
					            					<c:when test="${ !empty trvSch.plcName }">
					            						<td>
					            							<span><i class="fas fa-map-marker-alt" style="color: #8e44ad"></i>&nbsp; ${ trvSch.plcName }</span>
					            						</td>
					            					</c:when>
					            					<c:otherwise>
					            						<td style="display: none;"><span style="color: lightgray;">장소정보 없음</span></td>
					            					</c:otherwise>
					            				</c:choose>
				            					
				            				</tr>
				            			</c:forEach>
		            				</c:when>
		            				
		            				<c:otherwise>
		            					<tr>
		            						<td>
		            							<i class="fas fa-exclamation-circle"></i> 미리보기 종료<br>
		            							해당 일정을 구매하셔야 볼 수 있습니다.
		            						</td>
		            					</tr>
		            				</c:otherwise>
		            			</c:choose>
		            			
		            		</c:when>
		            		
		            		<c:otherwise>
		            			<tr>
		            				<td><p>상세스케줄 없음</p></td>
		            			</tr>
		            		</c:otherwise>
		            	</c:choose>
		            	
		            </table>
		            </c:forEach>
		            
            </div>
         </div>
         
         <div id="mapArea">
         	<select id="mapDaySelect" onchange="dayMapSelect()">
         		<c:forEach var="detailDay" items="${ detailDay }" varStatus="st">
         			<c:choose>
	         			<c:when test="${ totalDays < 3 || showDays >= st.count }">
	         				<option value="${ detailDay.dayNumber }">DAY ${ detailDay.dayNumber }</option>
	         			</c:when>
	         			
	         			<c:otherwise>
	         				<option value="${ detailDay.dayNumber }" disabled="disabled">DAY ${ detailDay.dayNumber }</option>
	         			</c:otherwise>
         			</c:choose>
         		</c:forEach>
            </select>   
            <div id="map"></div>
         </div>
         
         <script>
         //지도보기
         var map;
           function initMap() {
             map = new google.maps.Map(document.getElementById('map'), {
               center: {lat: -33.93979965825738, lng: 151.171365661621},
               zoom: 13
             });
           }
         </script>
         <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD19cUtWTevnQL9Nh6Nd8BMgPoQs6OWyX0&callback=initMap" async defer></script>
         
      </div>
   </section>
   
<script>
   function dayMapSelect() {
      var day = $("#mapDaySelect").val();
      console.log(day);
      
      $.ajax({
         url : "dayMapSelect.tb",
         type : "post",
         data : {day : day},
         success : function(data) {
            alert("지도에 정보 뿌릴 예정");
         }
      });
   }
   
   $("#timeCheck").change(function() {
      if($(this).prop("checked")) {
         $(".times").removeAttr("style");
      }else {
         console.log("시간해제");
         $(".times").css("display","none");
      }
   });
   
   $(document).ready(function() {
	   $("#day1").removeAttr("style");
	   $("#calendarTable-day1").removeAttr("style");
   })
   
   //상세 스케쥴 보기
   function nextDays(day, text) {
	   
	   var nextDay = 0;
	   var totalDay = $("#totalDays").val();
	   var showDay = $("#showDays").val();
	   
	   if(text == 'left') {
		   nextDay = Number(Number(day) - 1);
	   }else {
		   nextDay = Number(Number(day) + 1);
	   }
	   
	   if(nextDay != 0 && nextDay <= totalDay) {
		   $(".is-fullwidth").css("display","none");
		   $("#day" + nextDay).removeAttr("style");
		   
		   $(".calendarTable").css("display","none");
		   $("#calendarTable-day" + nextDay).removeAttr("style");
	   }
	   
	   
   }
   
</script>

</body>
</html>