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
<style>
   #travelListArea {
      padding: 3rem 1.5rem;
      padding-top: 0;
   }
   .card {
      cursor: pointer;
   }
</style>
</head>
<body>
   <jsp:include page="travelSearchBar.jsp" />
   
   <!-- 본문 -->
   <div class="columns is-mobile" id="travelListArea" align="center">
      <div class="column">
      
         <!-- 게시글 영역 -->
         
         	<c:choose>
         	<c:when test="${ fn:length(tbList) > 0 }">
         	<div class="ui special cards">
            <c:forEach var="tbList" items="${ tbList }" varStatus="status">
            <div class="card" onclick="location.href='travelDetailForm.tb?trvId=${ tbList.trvId }'">
               <div class="blurring dimmable image">
                  <div class="ui dimmer">
                     <div class="content">
                        <div class="center">
                           <p class="title is-4" style="color: white;">${ tbList.trvTitle }</p>
                        </div>
                     </div>
                  </div>
                  <img src="resources/images/sample1.jpg">
               </div>
               
               <div class="content">
                  <div class="header">
                     <p class="title is-3">${ tbList.trvTitle }</p>
                  </div>
                  <div class="meta">
                     <div>
	                     <c:choose>
	                     	<c:when test="${ fn:length(tbList.trvCities) > 0 }">
	                     		<c:forEach var="city" items="${ tbList.trvCities }" varStatus="st">
	                     			<a>@${ city.countryNameKo } ${ city.cityNameKo }</a>
	                     			<c:if test="${ st.count ne fn:length(tbList.trvCities) }">&nbsp;/&nbsp;</c:if>
	                     		</c:forEach>
	                     	</c:when>
	                     	<c:otherwise>
	                     		<p>나라태그 없음</p>
	                     	</c:otherwise>
	                     </c:choose>
                     </div>
                     <fmt:parseDate var="startDate" value="${ tbList.startDate }" pattern="yyyy-MM-dd" />
                     <fmt:parseNumber value="${ startDate.time / (1000*60*60*24) }" integerOnly="true" var="startDay" />
                     <fmt:parseDate var="endDate" value="${ tbList.endDate }" pattern="yyyy-MM-dd" />
                     <fmt:parseNumber value="${ endDate.time / (1000*60*60*24) }" integerOnly="true" var="endDay" />
                     <p class="date"><small>[${ endDay - startDay + 1 }DAYS] ${ tbList.startDate } ~ ${ tbList.endDate }</small></p>
                     <a class="button is-small"> 
                        <span class="icon is-small"><i class="fa fa-user"></i></span> 
                        <span> ${ tbList.userName } </span>
                     </a>
                  </div>
               </div>
               
               <div class="extra content">
					<c:choose>
						<c:when test="${ fn:length(tbList.trvTags) > 0 }">
                     		<c:forEach var="trvTags" items="${ tbList.trvTags }">
                     			<a>#${ trvTags.tagName }</a>
                     		</c:forEach>
                     	</c:when>
                     	<c:otherwise>
                     		<p>여행태그 없음</p>
                     	</c:otherwise>
                     </c:choose>
               	
               </div>
               <div class="extra content">
                  <span>
                     <a data-tooltip="구매수"><i class="fas fa-shopping-cart"></i>&nbsp;&nbsp;${ tbList.buyCount }</a>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <a data-tooltip="좋아요수"><i class="fas fa-star"></i>&nbsp;&nbsp;${ tbList.likeyCount }</a>
                  </span>
               </div>   
            </div>   <!-- class="card" 글 하나-->
            </c:forEach>
            </div>   <!-- class="ui special cards" -->
           </c:when>
           <c:otherwise>
           	<div class="ui special cards" style="justify-content: center;">
           		<div style="width: 500px; height: 500px;">
           			<h3 class="title is-1"><i class="fas fa-search"></i></h3>
           			<p>리스트가 없습니다.</p>
           		</div>
           	</div>
           </c:otherwise>
           </c:choose>
         
         
      </div>   <!-- class="column" -->
   </div>   <!-- class="columns is-mobile" -->
   
   
<script>
   
   //각 글에 마우스 올렸을 때 설명글
   $('.special.cards .image').dimmer({
     on: 'hover'
   });
   
</script>
</body>
</html>