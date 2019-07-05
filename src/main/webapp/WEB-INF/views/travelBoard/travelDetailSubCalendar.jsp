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
   #calendarTable {
      width: 100%;
   }
   #calendarTable th {
      text-align: center;
   }
   #calendarTable td {
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
      z-index: 2;
      position: relative;
   }
   #mapDaySelect {
      width: 100px;
      float: right;
      margin: 1em;
      z-index: 1;
      position: relative;
   }
</style>
<body>
   <!-- 서브메뉴 본문(일정표) -->
   <section class="section" id="detailSub">
      <div id="detailSubContent" align="center">
         
         <div id="calendar">
            <div class="calendarArea">
            
               <c:choose>
                  <%-- <c:when test="${ detailTb.buyStatus eq 'Y' }"> --%>
                  <c:when test="${ !empty loginUser || empty loginUser }">
                     <!-- 로그인 + 일정 구매했을 때 -->
                     <!-- DAY1 -->
                     <div class="tabs is-fullwidth" style="margin-bottom: 0.5em;">
                        <ul>
                           <li>
                              <c:choose>
                                 <c:when test="${ detailDay.dayNumber eq 1 || fn:length(detailDay.trvSchedule) <= 0 }">
                                    <a>
                                       <span id="left" class="icon" style="color: lightgray; cursor: default;"><i class="fa fa-angle-left"></i></span>
                                    </a>
                                 </c:when>
                                 <c:otherwise>
                                    <a onclick="selectTravelDetailDays('left')">
                                       <span id="left" class="icon"><i class="fa fa-angle-left"></i></span>
                                    </a>
                                 </c:otherwise>
                              </c:choose>
                           </li>
                           <li>
                              <span style="font-weight: 1px;">DAY</span><span id="day" style="font-weight: 1px;"> ${ detailDay.dayNumber }</span>
                           </li>
                           <li>
                              <c:choose>
                                 <c:when test="${ detailDay.dayNumber eq fn:length(detailDay.trvSchedule) || fn:length(detailDay.trvSchedule) <= 0 }">
                                    <a>
                                       <span id="right" class="icon" style="color: lightgray; cursor: default;"><i class="fa fa-angle-right"></i></span>
                                    </a>
                                 </c:when>
                                 <c:otherwise>
                                    <a onclick="selectTravelDetailDays('right')">
                                       <span id="right" class="icon"><i class="fa fa-angle-right"></i></span>
                                    </a>
                                 </c:otherwise>
                              </c:choose>
                           </li>
                        </ul>
                     </div>
                     <div align="right" style="border-bottom: 1px solid lightgray; padding-bottom: 0.3em;">
                        <c:choose>
                           <c:when test="${ fn:length(detailDay.trvSchedule) > 0 }">
                           	  <c:choose>
                           	  	<c:when test="${ trvSchedule.isTimeset eq 'Y' }">
                           	  		<input type="checkbox" id="timeCheck">
                              		<label for="timeCheck">시간 표시</label>
                           	  	</c:when>
                           	  	<c:otherwise>
                           	  		<input type="checkbox" id="timeCheck" disabled="disabled">
                              		<label for="timeCheck" style="color: gray">시간 표시</label>
                           	  	</c:otherwise>
                           	  </c:choose>
                           </c:when>
                           <c:otherwise>
                              <input type="checkbox" id="timeCheck" disabled="disabled">
                              <label for="timeCheck" style="color: gray">시간 표시</label>
                           </c:otherwise>
                        </c:choose>
                        
                     </div>
                     <table id="calendarTable">
                        <c:choose>
                           <c:when test="${ fn:length(detailDay.trvSchedule) > 0 }">
                              
                              <c:forEach var="trvSchedule" items="${ detailDay.trvSchedule }">
                                 <tr>
                                 	<c:if test="${ trvSchedule.isTimeset eq 'Y' }">
                                    	<th class="times" style="display: none;">${ trvSchedule.startTime } ~ ${ trvSchedule.endTime }</th>
                                    </c:if>
                                    <td>
                                       <span><i class="fas fa-map-marker-alt" style="color: #8e44ad"></i>&nbsp; ${ trvSchedule.plcName }</span>
                                    </td>
                                 </tr>
                              </c:forEach>
                              
                           </c:when>
                           <c:otherwise>
                              <tr>
                                 <td><p>상세스케줄 없음</p></td>
                              </tr>
                           </c:otherwise>
                        </c:choose>
                     </table>
                     <!-- DAY1 끝 -->
                  </c:when>
                  
               </c:choose>
            </div>
         </div>
         
         <div id="mapArea">
            <select id="mapDaySelect" onchange="dayMapSelect()">
               <option value="1">DAY 1</option>
               <option value="2">DAY 2</option>
               <option value="3">DAY 3</option>
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
   
   //상세 스케쥴 보기
   function selectTravelDetailDays(text) {
      
      var dayNumber = $("#day").text();
      
      if(text == 'left') {
         dayNumber = Number($("#day").text()) - 1;
      }else {
         dayNumber = Number($("#day").text()) + 1;
      }
      var trvId = ${ detailTb.trvId };
      
      console.log("trvId : " + trvId);
      console.log("dayNumber : " + dayNumber);
      
      var lastDay = ${ fn:length(detailDay.trvSchedule) };
      
      if(lastDay == dayNumber) {
         $('#right').css("color", "lightgray");
      }else {
         $('#right').removeAttr("style");
         $('#right').attr("onclick", "selectTravelDetailDays('right')");
      }
      
      if(1 == dayNumber) {
         $('#left').css("color", "lightgray");
      }else {
         $('#left').removeAttr("style");
         $('#left').attr("onclick", "selectTravelDetailDays('left')");
      }
      
      $.ajax({
         url : "travelDetailDays.tb",
         data : {trvId : trvId, dayNumber : dayNumber},
         success : function(detailDay) {
            console.log(detailDay.dayNumber);
            
            $("#day").empty();
            $("#day").append('&nbsp;' + detailDay.dayNumber);
            
            $("#calendarTable > tbody").children().remove();
            
            for (var key in detailDay.trvSchedule) {
               var startTime = detailDay.trvSchedule[key].startTime;
               var endTime = detailDay.trvSchedule[key].endTime;
               var plcName = detailDay.trvSchedule[key].plcName;
               var isTimeset = detailDay.trvSchedule[key].isTimeset;
               
               console.log("startTime : " + startTime);
               console.log("endTime : " + endTime);
               console.log("plcName : " + plcName);
               
               var value;
               
               if(isTimeset == 'N' || isTimeset == null) {
                  $("#timeCheck").attr('disabled', true).css("color", 'gray');
                  
                  value = '<tr><td><p>상세스케줄 없음</p></td></tr>';
                  $("#calendarTable > tbody").append(value).css("text");
               }else {
                  value = '<tr><th class="times" style="display: none;">' + startTime + ' ~ ' + endTime + "</th>"
                  + '<td><span><i class="fas fa-map-marker-alt" style="color: #8e44ad"></i>&nbsp; ' + plcName + '</span></td></tr>';
         
                  $("#calendarTable > tbody").append(value);
               }
            }
            
         },
         error : function(data) {
            alert("연결 실패");
         }
      });
   }
   
</script>

</body>
</html>