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
					<div class="item" id="detailSearch"><i class="fas fa-search-plus"></i> 상세검색</div>
				</div>
			</div>
		</div>
		
	<div id="simpleSearchArea" style="display: none;">
		<!-- 기본검색바 -->
		<div class="field has-addons" style="justify-content: flex-end; margin-top: 1em;">
			<a class="button is-primary searchClose" data-tooltip="검색창 닫기" data-position="top right">X</a>
			<p class="control">
				<span class="select">
					<select>
						<option>최신순</option>
						<option>좋아요순</option>
						<option>최신순</option>
					</select>
				</span>
			</p>
			
			<p class="control">
				<input class="input" type="text" placeholder="검색어를 입력하세요">
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
						<option value="혼자여행">혼자여행</option>
						<option value="자유여행">자유여행</option>
						<option value="먹방여행">먹방여행</option>
						<option value="여행스타일">여행스타일</option>
						<option value="여행스타일">여행스타일</option>
						<option value="여행스타일">여행스타일</option>
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
						<option value="Argentina">Argentina</option>
						<option value="Bolivia">Bolivia</option>
						<option value="Brazil">Brazil</option>
						<option value="Chile">Chile</option>
						<option value="Colombia">Colombia</option>
						<option value="Ecuador">Ecuador</option>
						<option value="Guyana">Guyana</option>
						<option value="Paraguay">Paraguay</option>
						<option value="Peru">Peru</option>
						<option value="Suriname">Suriname</option>
						<option value="Uruguay">Uruguay</option>
						<option value="Venezuela">Venezuela</option>
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
var content = [
	  { title: 'Andorra' },
	  { title: 'United Arab Emirates' },
	  { title: 'Afghanistan' },
	  { title: 'Antigua' },
	  { title: 'Anguilla' },
	  { title: 'Albania' },
	  { title: 'Armenia' },
	  { title: 'Netherlands Antilles' },
	  { title: 'Angola' },
	  { title: 'Argentina' },
	  { title: 'American Samoa' },
	  { title: 'Austria' },
	  { title: 'Australia' },
	  { title: 'Aruba' },
	  { title: 'Aland Islands' },
	  { title: 'Azerbaijan' },
	  { title: 'Bosnia' },
	  { title: 'Barbados' },
	  { title: 'Bangladesh' },
	  { title: 'Belgium' },
	  { title: 'Burkina Faso' },
	  { title: 'Bulgaria' },
	  { title: 'Bahrain' },
	  { title: 'Burundi' }
	  // etc
	];
	
	function searchTravelList() {
		$.ajax({
			url : 'searchTravelList.tb',
			data : {},
			success : function(data) {
				alert("검색");
			}
		})
	}
	
	$('.ui.search')
	  .search({
	    source: content
	  })
	;
	
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
		var style = $("#travelStyle").val();
		var tag = '<div class="tags has-addons"><a class="tag is-link style">'+style+'</a><a class="tag is-delete">　</a></div>';
			
		$("#selectStyle").append(tag);
		
	});
	
	$('#countryAdd').click(function() {
		var country = $("#travelCountry").val();
		var tag = '<div class="tags has-addons"><a class="tag is-link style">'+country+'</a><a class="tag is-delete">　</a></div>';
		
		$("#selectCountry").append(tag);
	});
	
	
	
</script>
</html>