<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.pageingBtn{
		width:30px;
		height:22px;
		background:white;
		color:purple;
		border:1px solid purple;
		border-radius:5px;
	}
	.pageingBtn:hover{
		background:purple;
		color:white;
	}
	#aPointTB *{
		text-align:center;
	}
	tbody *:hover{
		background:#ededff;
		color:#8484ff;
		font-weight:bold;
	}
</style>
</head>
<body>
	<jsp:include page="../../common/adminMainNav.jsp"/>
	<div class="columns is-mobile">
		<div class="column">
			<section class="section" id="headerSection" style="margin-bottom:-60px;">
				<jsp:include page="aPointNav.jsp"/>				
			</section>
			<section class="section">
				<div class="container" style="width:90%;height:100%;">
					<div style="width:100%;font-size:25px;color:#209cee;">수익금 내역</div>
		         <div style="width:100%;height:100%;">
		         	<div>
		         		<div class="field has-addons" style="float:right;">
							<p class="control">
								<input type="checkbox" style="display:inline-block;float:left;" id="searchNameCheck" name="searchNameCheck">
								<p style="width:100px;display:inline-block;"><label for="searchNameCheck">이름 검색하기</label></p>
								<input class="input" type="text" placeholder="회원 이름을 검색하세요" style="width:150px;height:20px;display:none" id="nameArea">
							</p>
							<p class="control" id="search" style="margin-left:1%;display:inline-block;float:right;">
								<a class="button is-primary" style="width:60px;height:20px;">
									<i class='fas fa-search' style='font-size:15px'></i>검색
								</a>
							</p>
							<a class="button is-primary is-outlined" style="width:120px;height:20px;margin-left:2%;" href="allAdRebate.po">환급내역 보러가기</a>
						</div>
					</div>
		         	<div style="width:100%;height:25px;"></div>
		         </div>
		         <div style="width:100%;height:100%;" id="aPointArea">
					<table id="aProceedsTB" class="table is-narrow" align="center"style="width:100%;height:100%;" >
						<thead>
							<tr style="background:#ccccff;">
								<th width="3%"> No. </th>
								<th width="15%"> 이름 </th>
								<th width="15%"> 이메일 </th>
								<th width="20%"> 수익금 </th>
								<th width="20%"> 수익발생일 </th>
								<th width="20%"> 수익발생글 </th>
							</tr>
						</thead>
						<tbody id="aProceedsTBody">
							
						</tbody>
					</table>
		         </div>
					
				<div align="center" class="pagingBtn" style="margin-top:3%;">
		    		
				</div>
				</div>
			</section>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".apointPro").parent().addClass('is-active');
			$(".apointPro").children().css({"color":"#209cee"});
			
			var currentPage = 1;
			//전체 리스트 출력으로 가는 함수
			total(currentPage);
			
		});
		function total(currentPage){
			var condition = 99;
			$.ajax({
				url:"adProceeds.po",
				type:"post",
				data:{currentPage:currentPage, condition:condition},
				success:function(data){
					makeTable(data.adProceedsList, data.adProceedsPi);
				},
				error:function(data){
					console.log('error');
				}
			});
		};
		function makeTable(adProceedsList, adProceedsPi){
			console.log(adProceedsList);
			//console.log(adProceedsPi);
			
			var len = adProceedsList.length;
			//console.log(len);
			$("#aProceedsTBody").empty();
			
			for(var i=0 ; i<len ; i++){
				var list = adProceedsList[i];
				//console.log(list);
				var pi = adProceedsPi;
				//console.log(pi);
				
				var $tr = $("<tr>"); 
				
				var $noTd = $("<td>").text(i+1);
				
				//var $nameTr = $("<td>").text(list.);
				
				$tr.append($noTd);
				$("#aProceedsTBody").append($tr);
			}
		};
	</script>
</body>
</html>