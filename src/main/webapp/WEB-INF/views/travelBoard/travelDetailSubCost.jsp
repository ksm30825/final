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
	#cost {
		display: flex;
		width: 100%;
	}
	#costBtnArea {
		text-align: right;
		margin-right: 4%;
	}
	
	.nextBtnArea {
		flex: 1;
		display: inline-block;
		margin-top: 12%;
	}
	.button.is-primary.soft {
		background: rgb(159, 125, 191);
	}
	.button.is-primary.soft:hover {
		background: rgb(123, 87, 157);
	}
	
	.costTableArea {
		display: inline-block;
		flex: 3;
	}
	#costTableArea {
		width: 90%;
	}
	#costTableArea p {
		text-align: left;
	}
	#costTable {
		width: 100%;
	}
	#costTable th {
		background: rgb(178, 214, 237, 0.55);
		padding: 1em;
		text-align: center !important;
		font-size: 1.2em;
	}
	#costTable td {
		padding: 1em;
		text-align: center !important;
	}
</style>
<body>
	<!-- 서브메뉴 본문(가계부) -->
	<section class="section" id="detailSub" style="padding-top: 0;">
		<div id="detailSubContent" align="center">
			<div id="costBtnArea">
				<a class="button is-primary" onclick="allCost()">전체</a>
				<a class="button is-primary soft" onclick="dayCost(1)">일별</a>
				<c:if test="구매여부가 true면">
				
				</c:if>
				<c:if test="true">
					<!-- 구매여부가 false면 -->
					<a class="button is-dark" onclick="costDownload()">가계부 엑셀 다운로드</a>
				</c:if>
			</div>
			
			<div id="cost">
				<div class="nextBtnArea" onclick="dayCost(뭘보내야하지)" style="visibility: hidden;">
					<i class="title is-2 fas fa-caret-left"></i>
				</div>
				
				<div id="costTableArea">
				
					<div align="left" class="title is-4">
					<span id="costTitle">전체예산</span>
					<i class="far fa-money-bill-alt"></i>
					<span id=""> 000,000</span>원 = 
					<i class="fas fa-money-bill-alt"></i>
					   000,000AUD
					</div>
					   
					<table id="costTable">
						<tr>
							<th><i class="fas fa fa-bed"></i> 숙박</th>
							<th><i class="fas fa fa-taxi"></i> 교통</th>
							<th><i class="fas fa fa-utensils"></i> 식비</th>
							<th><i class="fas fa fa-shopping-bag"></i> 쇼핑</th>
							<th><i class="fab fa-tripadvisor"></i> 관광</th>
							<th><i class="fas fa-ellipsis-h"></i> 기타</th>
							<th style="color: #209cee; width: 15%">TOTAL</th>
							<th style="color: rgb(142, 68, 173); width: 15%">BALANCE</th>
						</tr>
						<tr>
							<td>원</td>
							<td>원</td>
							<td>원</td>
							<td>원</td>
							<td>원</td>
							<td>원</td>
							<td>원</td>
							<td>원</td>
						</tr>
						<tr>
							<td>달러</td>
							<td>달러</td>
							<td>달러</td>
							<td>달러</td>
							<td>달러</td>
							<td>달러</td>
							<td>달러</td>
							<td>달러</td>
						</tr>
					</table>
				</div>
				
				<div class="nextBtnArea" onclick="dayCost(뭘보내야하지)" style="visibility: hidden;">
					<i class="title is-2 fas fa-caret-right"></i>
				</div>
			</div>
		</div>
	</section>
<script>
	function allCost() {
		var num = "게시판 번호";
		
		$.ajax({
			url : "allCost.tb",
			data : {num : num},
			success : function(data) {
				$("#costTitle").text("전체예산");
				
				$(".nextBtnArea").css("visibility", "hidden");
			}
		});
	}
	
	function dayCost(day) {
		var num = "게시판 번호";
		var day = day;
		
		$.ajax({
			url : "dayCost.tb",
			data : {num : num, day : day},
			success : function(data) {
				$("#costTitle").text("DAY " + day);
				
				$(".nextBtnArea").removeAttr("style");
			}
		});
	}
	
	function costDownload() {
		$.ajax({
			url : "costDownload.tb",
			data : {},
			success : function(data) {
				alert("다운로드 처리");
			}
		});
	}
</script>

</body>
</html>