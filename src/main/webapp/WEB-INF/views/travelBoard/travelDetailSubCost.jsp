<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin-top: 8%;
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
		font-size: 1.3em;
	}
	#costTable td {
		padding: 1em;
		text-align: center !important;
	}
</style>
<body>
	<!-- 서브메뉴 본문(가계부) -->
	<section class="section" id="detailSub">
		<div class="container" id="detailSubContent" align="center">
			<div id="costBtnArea">
				<a class="button is-primary" onclick="allCost()">전체</a>
				<a class="button is-primary soft" onclick="dayCost(1)">일별</a>
				<a class="button is-dark" onclick="costDownload()">가계부 엑셀 다운로드</a>
			</div>
			
			<div id="cost">
				<div class="nextBtnArea" onclick="dayCost(뭘보내야하지)">
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
							<th><i class="fas fa-bed"></i></th>
							<th><i class="fas fa-subway"></i></th>
							<th><i class="fas fa-utensils"></i></th>
							<th><i class="fas fa-shopping-cart"></i></th>
							<th><i class="fas fa-ellipsis-h"></i></th>
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
						</tr>
						<tr>
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
				
				<div class="nextBtnArea" onclick="dayCost(뭘보내야하지)">
					<i class="title is-2 fas fa-caret-right"></i>
				</div>
			</div>
		</div>
	</section>
<script>
	function allCost() {
		var num = "게시판 번호";
		
		$.ajax({
			url : "allCost.tr",
			data : {num : num},
			success : function(data) {
				alert("전체 가계부 테이블에 출력");
				$("#costTitle").text("전체예산");
			}
		});
	}
	
	function dayCost(day) {
		var num = "게시판 번호";
		var day = day;
		
		$.ajax({
			url : "dayCost.tr",
			data : {num : num, day : day},
			success : function(data) {
				alert("해당 날짜별 가계부 테이블에 출력");
				$("#costTitle").text("DAY " + day);
			}
		});
	}
	
	function costDownload() {
		$.ajax({
			url : "costDownload.tr",
			data : {},
			success : function(data) {
				alert("다운로드 처리");
			}
		});
	}
</script>

</body>
</html>