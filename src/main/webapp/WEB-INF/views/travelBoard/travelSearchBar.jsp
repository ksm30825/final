<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.styleTag {
		background: #209cee;
	}
	.tags.has-addons {
		display: inline-block;
	}
	
</style>
<body>

	<jsp:include page="../common/mainNav.jsp" />
	
<section class="section">
<div class="columns is-mobile">
	<div class="column" align="right"> 
		
		<!-- 검색조건 -->
		<div class="ui teal buttons">
			<div class="ui button" style="margin-right: 0;">여행 검색</div>
				<div class="ui floating dropdown icon button" style="padding: 0.8em; width: 2.5em;">
					<i class="dropdown icon"></i>
				<div class="menu">
					<div class="item" id="simpleSearch"><i class="fas fa-search"></i> 간편 검색</div>
					<div class="item" id="detailSearch"><i class="fas fa-search-plus"></i> 태그검색</div>
				</div>
			</div>
		</div>
		
	<div id="simpleSearchArea" style="display: none;">
		<!-- 기본검색바 -->
		
		<div class="field has-addons" style="justify-content: flex-end; margin-top: 1em;">
			<a class="button is-primary searchClose" data-tooltip="검색창 닫기" data-position="top right">X</a>
			
			<p class="control">
				<span class="select">
					<select id="orderBy">
						<option value="-">-검색조건-</option>
						<option value="completeDate">최신순</option>
						<option value="likeyCount">좋아요순</option>
						<option value="buyCount">구매순</option>
					</select>
				</span>
			</p>
			<p class="control">
				<span class="select">
					<select id="searchCondition">
						<option value="trvTitle">제목</option>
						<option value="userName">작성자</option>
					</select>
				</span>
			</p>
			<p class="control">
				<input class="input" type="text" id="searchContent" placeholder="검색어를 입력하세요">
			</p>
			<p class="control" onclick="searchTravelList()">
				<a class="button"><i class="fas fa-search"></i></a>
			</p>
		</div>
	</div>	<!-- id="simpleSearchArea" -->
	
	<div id="detailSearchArea" style="display: none;">
	
		<!-- 여행스타일 태그 -->
		<div class="field has-addons" style="width: 35%; margin-top: 1em;">
			<a class="button is-info searchClose" data-tooltip="검색창 닫기" data-position="top right">X</a>
			<p class="control is-expanded" style="color: red;">
				<span class="select is-fullwidth">
					<select id="travelStyle" name="travelStyle">
						<c:forEach var="tagList" items="${ tagList }" varStatus="st">
							<option value="${ tagList.tagId }">${ tagList.tagName }</option>
						</c:forEach>
					</select>
				</span>
			</p>
			<p class="control">
			  <button class="button is-info" id="styleAdd">추가</button>
			</p>
		</div>
		
		<div id="selectStyle">
			
		</div>
		
		<!-- 나라 태그 -->
		<div class="field has-addons" style="width: 35%; margin-top: 1em;">
			<a class="button is-primary searchClose" data-tooltip="검색창 닫기" data-position="top right">X</a>
			<p class="control is-expanded">
				<span class="select is-fullwidth">
					<select name="country" id="travelCountry">
						<c:forEach var="cityList" items="${ cityList }" varStatus="st">
							<option value="${ cityList.countryId }">${ cityList.countryNameKo }</option>
						</c:forEach>
					</select>
				</span>
			</p>
			<p class="control">
			  <button class="button is-primary" id="countryAdd">추가</button>
			</p>
		</div>
		
		<div id="selectCountry">
			
		</div>
		
      	</div>
	</div>
</div>
</section>	
		
</body>

<script>
	//간편검색 서치용
	function searchTravelList() {
		var orderBy = $("#orderBy").children("option:selected").val();
		var searchCondition = $("#searchCondition").children("option:selected").val();
		var searchContent = $("#searchContent").val();
		
		console.log(searchCondition);
		console.log(searchContent);
		
		location.href="searchTravelList.tb?orderBy=" + orderBy + "&searchCondition=" + searchCondition + "&searchContent=" + searchContent;
	};
	
	/* 여행검색 관련 펑션 */
	$('.dropdown').dropdown({
	    transition: 'drop'
	});
	
	$("#simpleSearch").click(function() {
		$("#simpleSearchArea").removeAttr("style");
		$("#detailSearchArea").css("display", "none");
	});
	
	$("#detailSearch").click(function() {
		$("#simpleSearchArea").css("display", "none");
		$("#detailSearchArea").removeAttr("style");
	});
	
	$(".searchClose").click(function() {
		$("#simpleSearchArea").css("display", "none");
		$("#detailSearchArea").css("display", "none");
	});
	
	$('#styleAdd').click(function() {
		var style = $("#travelStyle").children("option:selected").text();
		var tag = '<div class="tags has-addons"><a class="tag is-link style">'+style+'</a><span class="tag is-delete">　</span></div>';
		$("#travelStyle").children("option:selected").attr("disabled", true);
		$("#selectStyle").append(tag);
		
	});
	
	$('#countryAdd').click(function() {
		var country = $("#travelCountry").children("option:selected").text();
		var tag = '<div class="tags has-addons"><a class="tag is-link style">'+country+'</a><a class="tag is-delete" onclick="tagDelete()">　</a></div>';
		
		$("#travelCountry").children("option:selected").attr("disabled", true);
		$("#selectCountry").append(tag);
	});
	
</script>
</html>