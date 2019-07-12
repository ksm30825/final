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
					<div style="width:400px;margin-left: 468px;">
				        <a class="button is-primary" style="width:70px;height:20px;float:right;margin-left:2px;" data-tooltip="다운로드를 받으실 수 있습니다.">다운로드</a>
				        <a class="button is-success" style="width:70px;height:20px;float:right;" data-tooltip="선택항목들 지급하기">지급하기</a>	
					</div>
					<div style="width:100%;font-size:25px;color:#209cee;">환급 내역</div>
					<br>
			         <div style="width:100%;height:100%;">
			         	<div>
			         		<div class="field has-addons" style="display:inlin-block;float:right;margin-top:1%;">
								<p class="control">
									<input type="checkbox" style="display:inline-block;float:left;" id="searchNameCheck" name="searchNameCheck">
									<p style="width:70px;display:inline-block;"><label for="searchNameCheck">이름 검색</label></p>
									<input class="input" type="text" placeholder="회원 이름을 검색하세요" style="width:150px;height:20px;display:none;" id="nameArea">
								</p>
					        	<div style="margin-left:1%;width: 77px;">
									<input type="checkbox" style="display:inline-block;float:left;" id="searchDateCheck">
									<p style="display:inline-block;"><label for="searchDateCheck">기간 검색</label></p>
								</div>
								<div style="width:353px;display:none;" id="dateArea">
									<input id="startDate" type="date" class="input is-primary" style="width:140px;height:20px;margin-left:1%;" data-tooltip="검색시작날짜 : 입력을 안하시면 현재 날짜로 검색됩니다.">
									<i class='far fa-calendar-alt' style='font-size:20px;color:purple;margin-right:1%;'></i>~
									<input id="endDate" type="date" class="input is-primary" style="width:140px;height:20px;margin-left:1%;" data-tooltip="검색종료날짜 : 입력을 안하시면 현재 날짜로 검색됩니다.">
									<i class='far fa-calendar-alt' style='font-size:20px;color:purple;'></i>
								</div>
								<div class="select is-small is-primary" style="display:inline-block;float:right;text-align:center;">
						            <select name="rebateSelect" style="height:20px;">
						              <option value="0">--환급지급상태--</option>
						              <option value="10">미지급</option>
						              <option value="20">지급완료</option>
						            </select>
					        	</div>
								<p class="control" id="search" style="margin-left:1%;display:inline-block;float:right;">
									<a class="button is-primary" style="width:60px;height:20px;">
										<i class='fas fa-search' style='font-size:15px'></i>검색
									</a>
								</p>
							</div>
						</div>
			         
			         	<div style="width:100%;height:25px;"></div>
			         </div>
			         
			         <div style="width:100%;height:100%;" id="aRebateArea">
						<table id="aPointTB" class="table is-narrow"align="center"style="width:100%;height:100%;" >
							<thead>
								<tr style="background:#ccccff;">
									<th width="2%"> 
										<input type="checkbox" name="rebateCheck" id="allCheck">
									</th>
									<th width="3%"> No. </th>
									<th width="5%"> 아이디 </th>
									<th width="5%"> 환급신청수익금 </th>
									<th width="5%"> 환급신청일 </th>
									<th width="5%"> 환급지급상태 </th>
								</tr>
							</thead>
							<tbody id="aPointTBody">
								<tr>
									<td>
										<input type="checkbox" name="rebateCheck">
									</td>
									<td> 1 </td>
									<td> user01 </td>
									<td> 310,000 </td>
									<td> 19.06.10 </td>
									<td>
										<a class="button is-success" style="width:70px;height:20px;"> 미지급 </a>
									</td>	
								</tr>
								<tr>
									<td>
										<input type="checkbox" name="rebateCheck">
									</td>
									<td> 2 </td>
									<td> user02 </td>
									<td> 10,000 </td>
									<td> 19.04.10 </td>
									<td>
										<a class="button is-danger" style="width:70px;height:20px;"> 지급완료 </a>
									</td>
								</tr>
							</tbody>
						</table>
			         </div>
					
					<div align="center" class="pagingBtnArea" style="margin-top:3%;">
		    		
					</div>
				</div>
			</section>
			<section class="section" id="modal2">
				<div class="modal" id="myModal2">
					<div class="modal-background" id="back2"></div>
					<div class="modal-card">
						<header class="modal-card-head">
							<p class="modal-card-title" id="modalHeader2" style="font-size:15px;text-align:center"></p>
							<button class="delete" id="del2"></button>
						</header>
						<footer class="modal-card-foot">
							<div style="margin-left:auto;margin-right:auto;">
								<a class="button is-success" style="border-radius:5px; height:25px;width:60px;" id="okay"> 확인 </a>
							</div>
						</footer>
					</div>
				</div>
			</section>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".apointReb").parent().addClass('is-active');
			$(".apointReb").children().css({"color":"#209cee"});
			
			$("#allCheck").click(function(){
				if($("#allCheck").prop("checked")) { 
					$("#aRebateArea input[type=checkbox]").prop("checked",true); 
				}else { 
					$("#aRebateArea input[type=checkbox]").prop("checked",false); 
				}
			});
			//체크 상태에 따라 인풋태그 보여주기
			$("#searchDateCheck").change(function(){
				if($("#searchDateCheck").is(":checked")){
					$("#dateArea").css({"display":"inline-block"});
				}else{
					$("#dateArea").css({"display":"none"});
				}
			});
			//체크 상태에 따라 인풋태그 보여주기
			$("#searchNameCheck").change(function(){
				if($("#searchNameCheck").is(":checked")){
					$("#nameArea").css({"display":"inline-block"});
				}else{
					$("#nameArea").css({"display":"none"});
				}
			});
			//모달 닫기
			$("#back2, #del2").click(function(){
				$('#myModal2').removeClass('is-active');
			});
			var currentPage = 1;
			total(currentPage);
		});
		function total(currentPage){
			var condition = 99;
			/* $.ajax({
				url:"adRebate.po",
				type:"post",
				data:{currentPage:currentPage, condition:condition},
				success:function(data){
					makeTable(data.adRebateList, data.adRebatePi, condition);
				},
				error:function(data){
					console.log('error');
				}
			}); */
		};
		function makeTable(adRebateList, adRebatePi, condition){
			
		}
		function paging(adRebatePi, condition){
			
		}
		function searchFunc(currentPage){
			var condition = 99;
			var status = 99;
			
			var userName = $("#nameArea").val();
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			var rebateSta = $('#rebateSelect').children('option:selected').val();
			//0: 선택안함, 10: 미지급, 20: 지급완료
			
			var dateStart;
			var dateEnd;
			
			if(rebateSta == 0){
				//상태 O
				if($("#searchNameCheck").is(":checked")){
					//이름 O
					if(userName==""){
						status=10;
						msg="검색하실 회원의 이름을 입력해주세요";
					}else{
						if($("#searchDateCheck").is(":checked")){
							//날짜O
							condition = 70;
						}else{
							//날짜X
							condition = 60;
						}
					}
				}else{
					//이름 X
					if($("#searchDateCheck").is(":checked")){
						//날짜O
						condition = 50;
					}else{
						//날짜X
						condition = 40;
					}
				}
			}else{//10: 미지급, 20: 지급완료
				//상태 X
				if($("#searchNameCheck").is(":checked")){
					//이름 O
					if(userName==""){
						status=10;
						msg="검색하실 회원의 이름을 입력해주세요";
					}else{
						if($("#searchDateCheck").is(":checked")){
							//날짜O
							condition = 30;
						}else{
							//날짜X
							condition = 10;
						}
					}
				}else{
					//이름 X
					if($("#searchDateCheck").is(":checked")){
						//날짜O
						condition = 20;
					}else{
						//날짜X
						condition = 99;
					}
				}
			}
			//날짜 시작날짜와 종료날짜 폼 맞추기
			if(startDate ==""){
				dateStart = new Date();
			}else{
				dateStart = startDate;
			}
			if(endDate ==""){
				dateEnd = new Date();
			}else{
				dateEnd = endDate;
			}
			
			var start = new Date(dateStart);
			var startMili = start.getTime();
			
			var end = new Date(dateEnd);
			var endMili = end.getTime();
			
			if(startMili > endMili){
				$('#myModal').removeClass('is-active');
				$('#modalHeader2').text('검색 시작날짜와 종료날짜의 폼은 맞춰주세요');
				$("#myModal2").toggleClass('is-active');
				$("#okay").click(function(){
					$('#myModal2').removeClass('is-active');
				});
			}else if(status ==10){
				$('#myModal').removeClass('is-active');
				$('#modalHeader2').text('검색 조건을 입력해주세요');
				$("#myModal2").toggleClass('is-active');
				$("#okay").click(function(){
					$('#myModal2').removeClass('is-active');
				});
			}else{
				//모두 정상일 때 
				$.ajax({
					url:"searchAdRebate.po",
					type:"post",
					data:{condition:condition, currentPage:currentPage, userName:userName, startDate:startDate, endDate:endDate, rebateSta:rebateSta},
					success:function(data){
						console.log('success');	
						makePayTB(data.adPayList, data.adPayPi, condition);
					},
					error:function(data){
						console.log('error');
					}
				});
				console.log()
			}
			
		}
	</script>
</body>
</html>