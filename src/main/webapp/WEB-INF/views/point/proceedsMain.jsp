<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#rebateTB *, #proceedsTB *{
		text-align:center;
	}
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
	#rebateTB a, #proceedsTB a{
		height:20px;
		border-radius:5px;
	}
	#proceedsTB a:hover{
		background:white;
		color:purple;
		border-radius:5px;
		border:1px solid purple;
	}
	#rebateArea tbody *:hover,#proceedsArea tbody *:hover{
		background:#ededff;
		color:#adadff;
		font-weight:bold;
	}
</style>
</head>
<body>
	<div id="pt"></div>
	<jsp:include page="../common/mainNav.jsp"/>
	<div class="columns is-mobile">
		<div class="column">
			<section class="section" id="headerSection">
				<jsp:include page="../common/myPageHeader.jsp" />
				<jsp:include page="pointNav.jsp"/>				
			</section>
			<section class="tableSection">
			    <div class="container" style="width:95%;height:100%;border:1px solid #ccccff">
			    	<table style="width:30%;">
			  			<tr>
			  				<td><a class="button is-primary is-outlined" style="height:20px;" href="#">환급신청내역 바로가기</a></td>
			  				<td><a class="button is-primary is-outlined" style="height:20px;" href="#proceedsArea">수익금내역 바로가기</a></td>
			  			</tr>
				  	</table>
				  	<div id="rebateArea">
				  		<div id="rebateTop">
				  			<div id="rebateTitle" style="color:purple; font-size:28px;margin-top:3%;">
				    			수익금 환급신청 내역
			    			</div>
				  			<div class="select" style="display:inline-block;float:right;margin-bottom:4px;">
					            <select name="rebateSelect">
									<option value="defaultOption">--월--</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
					            </select>
					        </div>
					        <div id="rebateTB">
				    		<table class="table is-narrow" align="center" style="width:100%;">
							    <thead style="background:skyblue;">
							      <tr>
							        <th> No </th>
							        <th> 환급신청일 </th>
							        <th> 환급신청액 </th>
							        <th> 환급지급상태 </th>
							      </tr>
							    </thead>
							    <tbody id="rebateTBody">
							      
							    </tbody>
						  	</table>
				    	</div>
				    	<div align="center" class="rebatePagingArea">
				    		<button class="pageingBtn"> << </button>
				    		<button class="pageingBtn"> < </button>
				    		<button class="pageingBtn"> 1 </button>
				    		<button class="pageingBtn"> 2 </button>
				    		<button class="pageingBtn"> > </button>
				    		<button class="pageingBtn"> >> </button>
				    	</div>
				    		<a style="height:20px;color:purple;margin-left:90%;" href="#pt"><i class='fas fa-chevron-circle-up' style='font-size:36px'></i></a>
				  		</div>
				  	</div>
				  	
				  	
				  	
				  	
				 	<div id="proceedsArea" style="border-top:1px solid lightgray">
				 		<div id="proceedsTop">
				 			<div id="proceedsTitle" style="color:purple; font-size:28px;margin-top:3%;">
				    			수익금 달성 내역
			    			</div>
				 			<div class="select" style="display:inline-block;float:right;">
					            <select name="rebateSelect">
					            	<option value="defaultOption">--월--</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
					            </select>
					        </div>
					        <div style="float:right;">
					        	<a class="button is-danger is-outlined" onclick="$('#myModal').toggleClass('is-active')" id="toRebate">환급신청 하기</a>
					        </div>
				 		</div>
				 		<div id="proceedsTB">
				 			<table class="table is-narrow" align="center" style="width:100%;">
							    <thead style="background:skyblue;">
							      <tr>
							        <th> No </th>
							        <th> 달성일 </th>
							        <th> 달성 수익금 </th>
							        <th> 달성 게시글 </th>
							      </tr>
							    </thead>
							    <tbody id="proceedsTBody">
							     
							    </tbody>
						  </table>
						</div>
						<div align="center" class="proceedsPagingArea">
				    		<button class="pageingBtn"> << </button>
				    		<button class="pageingBtn"> < </button>
				    		<button class="pageingBtn"> 1 </button>
				    		<button class="pageingBtn"> 2 </button>
				    		<button class="pageingBtn"> > </button>
				    		<button class="pageingBtn"> >> </button>
			    		</div>
			    		<a style="height:20px;color:purple;margin-left:90%;" href="#pt"><i class='fas fa-chevron-circle-up' style='font-size:36px'></i></a>
				 		</div>
				  	</div>
		    </section>
		    <section class="section" id="modal">
				<div class="modal" id="myModal">
					<div class="modal-background"></div>
					<div class="modal-card">
						<header class="modal-card-head">
							<p class="modal-card-title">환급 하시겠습니까?</p>
							<button class="delete" id="del"></button>
						</header>
						<section class="modal-card-body">
							금액 입력 : <input id="payAmount" type="number" style="width:80%;" min="10000" step="10000" placeholder="10000원 단위로 신청가능합니다.">
							<input type="hidden" value="${sessionScope.loginUser.memberId}">
						</section>
						<footer class="modal-card-foot">
							<div style="margin-left:auto;margin-right:auto;">
								<a class="button is-success yes" id="toApply" style="border-radius:5px; height:25px;width:60px;"> 예 </a>
								<a class="button is-danger no" style="border-radius:5px; height:25px;"> 아니요 </a>
							</div>
						</footer>
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
			var memberId = $("#member").val();
			//console.log(memberId);
			var currentpage = 1;
			var month = 0;
			$.ajax({
				url:"allProceeds.po",
				type:"post",
				data:{memberId:memberId, currentpage:currentpage, month:month},
				success:function(data){
					makeProceedsTB(data.proPi, data.proceedsList);
					$.ajax({
						url:"allRebate.po",
						type:"post",
						data:{memberId:memberId, currentpage:currentpage, month:month},
						success:function(data){
							makeRebateTB(data.rebatePi, data.rebateList);
						},
						error:function(data){
							console.log('rebate main error');
						}
					});
				},
				error:function(data){
					console.log('proceeds main error');
				}
			});
			//수익금 달성 테이블 생성
			function makeProceedsTB(proPi, proceedsList){
				//console.log(proPi);
				console.log(proceedsList);
				//console.log(month);
				$("#proceedsTBody").empty();
				var len = proceedsList.length;
				//console.log(len);
				for(var i=0 ; i<len ; i++){
					var list = proceedsList[i];
					//console.log(list);
					var pi = proPi;
					//console.log(pi);
					
					var $listTr = $("<tr>");
					var $noTd = $("<td width='10px'>").text(i+1);
					
					var date = new Date(list.proceedsDate);
					date = getFormatDate(date);
					var $proceedsDateTd = $("<td>").text(date);
					
					var accumulateProceeds = list.accumulateProceeds;
					accumulateProceeds = comma(accumulateProceeds);
					var $accumulateProceedsTd = $("<td>").text(accumulateProceeds);
					
					var $boardTd =$("<td>");
					var mid, bid, $proceedsIn, $proceedsBtn, $proceedsMidIn, $proceedsBidIn; 
					mid = list.memberId;
					if(list.trvId != 0){
						bid = list.trvId;
						console.log(bid);
						
						$proceedsIn = $('<input type="hidden">').val(list.trvId);
						
						$proceedsBtn = $('<button id="proceedsLink" class="button is-primary" data-mid='+mid+'data-bid='+bid+'style="height:20px;line-height:60%;border-radius:5px;" data-tooltip="해당 글 보러가기" target="_blank">판매된 일정</button>');
						
						$proceedsMidIn = $('<input type="hidden">').val(mid);
						$proceedsBidIn = $('<input type="hidden">').val(bid);
						
						$proceedsBtn.append($proceedsMidIn);
						$proceedsBtn.append($proceedsBidIn);
						
						$boardTd.append($proceedsIn);
						$boardTd.append($proceedsBtn);
					}else{
						bid = list.ptcpId;
						console.log(bid);
						
						$proceedsIn = $('<input type="hidden">').val(list.ptcpId);
						
						$proceedsBtn = $('<button id="requsetLink" class="button is-primary" data-mid='+mid+'data-bid='+bid+'style="height:20px;line-height:60%;border-radius:5px;" data-tooltip="해당 글 보러가기" target="_blank">채택된 설계</button>');
						
						$proceedsMidIn = $('<input type="hidden">').val(mid);
						$proceedsBidIn = $('<input type="hidden">').val(bid);
						
						$proceedsBtn.append($proceedsMidIn);
						$proceedsBtn.append($proceedsBidIn);
						
						$boardTd.append($proceedsIn);
						$boardTd.append($proceedsBtn);
					}
					$listTr.append($noTd);
					$listTr.append($proceedsDateTd);
					$listTr.append($accumulateProceedsTd);
					$listTr.append($boardTd);
					
					$("#proceedsTBody").append($listTr);
				}
			}
			//환급 신청 테이블 생성
			function makeRebateTB(rebatePi, rebateList){
				//console.log(proPi);
				//console.log(proceedsList);
				//console.log(month);
				$("#rebateTBody").empty();
				var len = rebateList.length;
				//console.log(len);
				for(var i=0 ; i<len ; i++){
					var list = rebateList[i];
					//console.log(list);
					var pi = rebatePi;
					//console.log(pi);
					
					var $listTr = $("<tr>");
					var $noTd = $("<td width='10px'>").text(i+1);
					var date = new Date(list.applyDate);
					date = getFormatDate(date);
					var $rebateDateTd = $("<td>").text(date);
					
					var rebate = list.payAmount;
					rebate = comma(rebate);
					var $rebateTd = $("<td>").text(rebate);
					
					var $statusTd =$("<td>");
					var mid, $rebateIn, $rebateBtn, $rebateMidIn, $rebateBidIn; 
					mid = list.memberId;
					if(list.rebateStatus == 10){
						$rebateIn = $('<input type="hidden">').val(list.rebateId);
						
						$rebateBtn = $('<button class="button is-primary" style="height:20px;line-height:60%;border-radius:5px;">승인 대기</button>');
						
						$statusTd.append($rebateIn);
						$statusTd.append($rebateBtn);
					}else if(list.rebateStatus == 20){
						$rebateIn = $('<input type="hidden">').val(list.rebateId);
						
						$rebateBtn = $('<button class="button is-warning" style="height:20px;line-height:60%;border-radius:5px;">지급 대기</button>');
						
						$statusTd.append($rebateIn);
						$statusTd.append($rebateBtn);
					}else if(list.rebateStatus == 30){
						$rebateIn = $('<input type="hidden">').val(list.rebateId);
						
						$rebateBtn = $('<button class="button is-success" style="height:20px;line-height:60%;border-radius:5px;">지급 완료</button>');
						
						$statusTd.append($rebateIn);
						$statusTd.append($rebateBtn);
					}
					$listTr.append($noTd);
					$listTr.append($rebateDateTd);
					$listTr.append($rebateTd);
					$listTr.append($statusTd);
					
					$("#rebateTBody").append($listTr);
				}
			}
			function getFormatDate(date){ 
				//console.log(date);
				//console.log(typeof(date));
				var year = date.getFullYear()+'';	//yyyy 
				year = year.substring( 2, 4 );
				var month = (1 + date.getMonth());	//M 
				month = month >= 10 ? month : '0' + month;	//month 두자리로 저장 
				var day = date.getDate();	//d
				day = day >= 10 ? day : '0' + day;	//day 두자리로 저장
				var hour = date.getHours();
				hour = hour >=10 ? hour : '0' + hour;
				var minu = date.getMinutes();
				minu = minu >=10 ? minu : '0' + minu;
				return year + '/' + month + '/' + day + '	' + hour + ':' + minu; 
			}
			function comma(num){
			    var len, point, str; 
			       
			    num = num + ""; 
			    point = num.length % 3 ;
			    len = num.length; 
			   
			    str = num.substring(0, point); 
			    while (point < len) { 
			        if (str != "") str += ","; 
			        str += num.substring(point, point + 3); 
			        point += 3; 
			    } 
			    return str;
			}
			//해당 글 바로가기
			$("body").on("click", "#proceedsLink",function(){
				var mid = $(this).children().eq(0).val();
				var bid = $(this).children().eq(1).val();
				var url = "oneBoardRPoint.po?mid="+mid+"&bid="+bid;

				window.open(url, "oneBoard", "width=1000,height=700");
			});
			$("body").on("click", "#requsetLink",function(){
				var mid = $(this).children().eq(0).val();
				var bid = $(this).children().eq(1).val();
				var url = "oneBoardRequest.po?mid="+mid+"&bid="+bid;

				window.open(url, "oneBoard", "width=1000,height=700");
			});
			$("body").on("click", "#toApply",function(){
				var payAmountStr = $(this).parent().parent().parent().children().eq(1).children().eq(0).val();
				var memberId =$(this).parent().parent().parent().children().eq(1).children().eq(1).val();
				var payAmount = Number(payAmountStr);
				if(payAmount % 10000 != 0){
					$('#myModal').removeClass('is-active');
					$('#modalHeader2').text('10000원 단위만 환급신청이 가능합니다.');
					$("#myModal2").toggleClass('is-active');
					$("#okay").click(function(){
						$('#myModal2').removeClass('is-active');
					});
				}else{
					var userProceedsString = $("#userProceeds").text();
					var userProceedsStr =  userProceedsString.replace(/[^0-9]/g,"");
					var proceeds = Number(userProceedsStr);
					//console.log(payAmount);
					//console.log(proceeds);
					
					if(payAmount >= proceeds){
						$('#myModal').removeClass('is-active');
    					$('#modalHeader2').text('현재 총 수익금이 모자릅니다.');
    					$("#myModal2").toggleClass('is-active');
    					$("#okay").click(function(){
    						$('#myModal2').removeClass('is-active');
    					});
					}else if(payAmount < proceeds){
						if(proceeds<30000){
							$('#myModal').removeClass('is-active');
	    					$('#modalHeader2').text('총 수익금이 30000원 이상이어야 환급신청이 가능합니다.');
	    					$("#myModal2").toggleClass('is-active');
	    					$("#okay").click(function(){
	    						$('#myModal2').removeClass('is-active');
	    					});
						}else{
							$('#myModal').removeClass('is-active');
	    					$('#modalHeader2').text('환급 신청한 내역이 관리자에게 전달 되었습니다.').append('<p>정산은 매월 15일에 이뤄집니다.</p>');
	    					$("#myModal2").toggleClass('is-active');
	    					$("#okay").click(function(){
	    						$('#myModal2').removeClass('is-active');
	    					});
	    					location.href="rebateProceeds.po?memberId="+memberId+"&payAmount="+payAmount;
						}
    				}
				}
				$("#payAmount").val("");
			});
			$('.modal-background, .modal-close').click(function() {
				$(this).parent().removeClass('is-active');
			});
			$("#del").click(function(){
				$(this).parent().parent().parent().removeClass('is-active');
			});
			$(".no").click(function(){
				$("#payAmount").val("");
				$('#myModal').removeClass('is-active');
				$('#modalHeader2').text('환급신청을 취소하셨습니다.');
				$("#myModal2").toggleClass('is-active');
				$("#okay").click(function(){
					$('#myModal2').removeClass('is-active');
				});
			});
		});
	</script>
</body>
</html>