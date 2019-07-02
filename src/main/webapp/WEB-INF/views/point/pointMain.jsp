<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#chargeTB *, #receiveTB *, #useTB *{
		text-align:center;
	}
	.pagingBtn{
		width:30px;
		height:22px;
		background:white;
		color:purple;
		border:1px solid purple;
		border-radius:5px;
	}
	.pagingBtn:hover{
		background:purple;
		color:white;
	}
	#useTB a, #receiveTB a, #chargeTB a{
		height:20px;
		border-radius:5px;
	}
	#apply:hover, #receiveTB a:hover, #chargeTB a:hover{
		background:white;
		color:purple;
		border-radius:5px;
		border:1px solid purple;
	}
	#chargeArea tbody *:hover, #receiveArea tbody *:hover, #useArea tbody *:hover{
		background:#ededff;
		color:#adadff;
		font-weight:bold;
	}
	#reserveLink, #useLink, #refundStatus{
		border-radius:5px;
		line-height:80%;
	}
	#reserveLink:hover, #useLink:hover, #refundStatus:hover{
		border: 1px solid purple;
	}
</style>
</head>
<body>
	<c:if test="${ empty sessionScope.loginUser }">
		<c:out value="로그인이 필요한 서비스입니다."/>
	</c:if>
	<c:if test="${ !empty sessionScope.loginUser }">
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
				    	<table style="width:50%;">
				  			<tr>
				  				<td><a class="button is-primary is-outlined" style="height:20px;" href="#">포인트 충전내역 바로가기</a></td>
				  				<td><a class="button is-primary is-outlined" style="height:20px;" href="#receiveTop">포인트 지급내역 바로가기</a></td>
				  				<td><a class="button is-primary is-outlined" style="height:20px;" href="#useTitle">포인트 사용내역 바로가기</a></td>
				  			</tr>
					  	</table>
				    	<div id="chargeArea" style="height:100%;">
					    	<div id="chargeTop" style="margin-top:3%;">
					    		<div id="chargeTitle" style="color:purple; font-size:28px;margin-top:3%;">
					    			포인트 충전내역
				    			</div>
					    		<div class="select" style="display:inline-block;float:right;margin-bottom:1%;">
						            <select name="chargeSelect" id="chargeSelect">
										<option value="defaultOption" selected>--월--</option>
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
						        	<a class="button is-danger" href="toPayView.po">충전하러 가기</a>
						        </div>
					    	</div>
					    	<div id="chargeTB">
					    		<table class="table is-narrow" align="center" style="width:100%;">
								    <thead>
										<tr style="background:skyblue;">
											<th width="10px"> No </th>
											<th> 충전액 </th>
											<th> 충전일 </th>
										</tr>
								    </thead>
								    <tbody id="chargeTBody">
										<c:forEach var="ch" items="${ chPayList }">
											<tr>
												<td>
													<c:out value="${ ch.paymentId }"/>
												</td>
												<td>
													<span><fmt:formatNumber value="${ ch.payAmount }" groupingUsed="true"/>P</span>
												</td>
												<td>
													<fmt:formatDate value="${ ch.paymentDate }" pattern="yy/MM/dd HH:mm" />
												</td>
											</tr>
										</c:forEach>
								    </tbody>
							  </table>
					    	</div>
				    		<!-- paging -->
							<div class="field" >
								<nav class="pagination">
							  	<ul class="pagination-list chargePagingArea" style="justify-content: center;">
									<!-- 이전 -->
									<c:if test="${ chPi.currentPage <= 1 }"> 
										<li><button class="pagingBtn" style="border-color: gray;"> < </button></li>
									</c:if>
									<c:if test="${ chPi.currentPage > 1 }">
										<c:url var="mListBack" value="paymentMain.po">
											<c:param name="currentPage" value="${ chPi.currentPage - 1 }"/>
										</c:url>
										<li><button class="pagingBtn" onclick="location.href='${ mListBack }'"> < </button></li>
									</c:if><!-- end 이전 -->
									<!-- page number -->
									<c:forEach var="p" begin="${ chPi.startPage }" end="${ chPi.endPage }">
										<c:if test="${ p eq chPi.currentPage }">
											<li><button class="pagingBtn" style="border-color: gray;"> ${ p } </button></li>
										</c:if>
										<c:if test="${ p ne chPi.currentPage }">
											<c:url var="mListCheck" value="paymentMain.po">
												<c:param name="currentPage" value="${ p }"/>
											</c:url>
											<li><button class="pagingBtn" onclick="location.href='${ mListCheck }'"> ${ p } </button></li>
										</c:if>
									</c:forEach> <!-- end page number -->
									<!-- 다음 -->
									<c:if test="${ chPi.currentPage >= chPi.maxPage }">
										<li><button class="pagingBtn" style="border-color: gray;"> > </button></li>
									</c:if>
									<c:if test="${ chPi.currentPage < chPi.maxPage }">
										<c:url var="mListEnd" value="paymentMain.po">
											<c:param name="currentPage" value="${ chPi.currentPage + 1 }"/>
										</c:url>
										<li><button class="pagingBtn" onclick="location.href='${ mListEnd }'"> > </button></li>
									</c:if> <!-- end 다음 -->
							  	</ul>
							  </nav>
							</div> <!-- end paging -->	
					    	<a style="height:20px;color:purple;margin-left:90%;" href="#pt"><i class='fas fa-chevron-circle-up' style='font-size:36px'></i></a>
				    	</div>
				    	<div id="receiveArea" style="margin-top:3%; border-top:1px solid lightgray;">
				    		<div id="receiveTop">
				    			<div id="receiveTitle" style="color:purple; font-size:28px;margin-top:3%;">
					    			포인트 지급내역
				    			</div>
					    		<div class="select" style="display:inline-block;float:right;margin-bottom:1%;">
					    			<select name="receiveSelect" id="receiveSelect">
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
				    		</div>
							<div id="receiveTB">
								<table class="table is-narrow" align="center" style="width:100%;">
								    <thead>
										<tr style="background:skyblue;">
											<th width="10px"> No </th>
											<th> 지급포인트 </th>
											<th> 지급일 </th>
											<th> 지급게시글 </th>
										</tr>
								    </thead>
								    <tbody id="receiveTBody">
										<c:forEach var="re" items="${ rePayList }">
											<tr>
												<td>
													<c:out value="${ re.pointId }"/>
												</td>
												<td>
													<span><fmt:formatNumber value="${ re.reservePoint }" groupingUsed="true"/>P</span>
												</td>
												<td>
													<fmt:formatDate value="${ re.reserveDate }" pattern="yy/MM/dd HH:mm" />
												</td>
												<td>
												<!-- ----------------------함수로 보낼 수 없나? -->
													<c:if test="${ re.reserveType eq 10}">
														<input type="text" value="${ re.trvId }" style="display:none;">
														<a class="button is-primary" style="height:20px;" data-tooltip="해당글 보러가기" target="_blank" href="oneBoardRPoint.po?mid=${re.memberId}&bid=${ re.trvId }">일정작성</a>
													</c:if>
													<c:if test="${ re.reserveType eq 20}">
														<input type="text" value="${ re.reviewId }" style="display:none;">
														<a class="button is-primary" style="height:20px;" data-tooltip="해당글 보러가기" target="_blank" href="oneBoardRPoint.po?mid=${re.memberId}&bid=${ re.reviewId }">일정리뷰</a>
													</c:if>
													<c:if test="${ re.reserveType eq 30}">
														<input type="text" value="${ re.spotReviewId }" style="display:none;">
														<a class="button is-primary" style="height:20px;" data-tooltip="해당글 보러가기" target="_blank" href="oneBoardRPoint.po?mid=${re.memberId}&bid=${ re.spotReviewId }">명소리뷰</a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
								    </tbody>
							  </table>
							</div>
							<!-- paging -->
							<div class="field" >
								<nav class="pagination">
							  	<ul class="pagination-list receivePagingArea" style="justify-content: center;">
									<!-- 이전 -->
									<c:if test="${ rePi.currentPage <= 1 }"> 
										<li><button class="pagingBtn" style="border-color: gray;"> < </button></li>
									</c:if>
									<c:if test="${ rePi.currentPage > 1 }">
										<c:url var="reListBack" value="reserveMain.po">
											<c:param name="currentPage" value="${ rePi.currentPage - 1 }"/>
										</c:url>
										<li><button class="pagingBtn" onclick="location.href='${ reListBack }'"> < </button></li>
									</c:if><!-- end 이전 -->
									<!-- page number -->
									<c:forEach var="p" begin="${ rePi.startPage }" end="${ rePi.endPage }">
										<c:if test="${ p eq rePi.currentPage }">
											<li><button class="pagingBtn" style="border-color: gray;"> ${ p } </button></li>
										</c:if>
										<c:if test="${ p ne rePi.currentPage }">
											<c:url var="reListCheck" value="reserveMain.po">
												<c:param name="currentPage" value="${ p }"/>
											</c:url>
											<li><button class="pagingBtn" onclick="location.href='${ reListCheck }'"> ${ p } </button></li>
										</c:if>
									</c:forEach> <!-- end page number -->
									<!-- 다음 -->
									<c:if test="${ rePi.currentPage >= rePi.maxPage }">
										<li><button class="pagingBtn" style="border-color: gray;"> > </button></li>
									</c:if>
									<c:if test="${ rePi.currentPage < rePi.maxPage }">
										<c:url var="reListEnd" value="reserveMain.po">
											<c:param name="currentPage" value="${ rePi.currentPage + 1 }"/>
										</c:url>
										<li><button class="pagingBtn" onclick="location.href='${ reListEnd }'"> > </button></li>
									</c:if> <!-- end 다음 -->
							  	</ul>
							  </nav>
							</div> <!-- end paging -->	
				    		<a style="height:20px;color:purple;margin-left:90%;" href="#pt"><i class='fas fa-chevron-circle-up' style='font-size:36px'></i></a>
				    	</div>
				    	<div id="useArea"  style="margin-top:3%; border-top:1px solid lightgray;">
				    		<div id="useTop">
				    			<div id="useTitle" style="color:purple; font-size:28px;margin-top:3%;">
					    			포인트 사용내역
				    			</div>
				    			<div class="select" style="display:inline-block;float:right;margin-bottom:1%;">
					    			<select name="useSelect" id="useSelect">
					    				<option id="defaultOption">--월--</option>
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
				    		</div>
				    		<div id="useTB">
								<table class="table is-narrow" align="center" style="width:100%;">
								    <thead>
								      <tr style="background:skyblue">
								        <th width="10px"> No </th>
								        <th> 사용포인트 </th>
								        <th> 사용일 </th>
								        <th> 사용게시글 </th>
								        <th> 환불신청상태 </th>
								      </tr>
								    </thead>
								    <tbody id="useTBody">
								    	<c:forEach var="us" items="${ usPayList }">
											<tr>
												<td><c:out value="${ us.pointId }"/></td>
												<td>
													<span><fmt:formatNumber value="${ us.usePoint }" groupingUsed="true"/>P</span>
												</td>
												<td><fmt:formatDate value="${ us.useDate }" pattern="yy/MM/dd HH:mm" /></td>
												<td>
													<c:if test="${ us.useType eq 10}">
														<!-- 일정구매 -->
														<input type="text" value="${ us.trvId }" style="display:none;">
														<a class="button is-primary" style="height:20px;" data-tooltip="해당글 보러가기" target="_blank" href="oneBoardRPoint.po?mid=${us.memberId}&bid=${ us.trvId }">일정구매</a>
													</c:if>
													<c:if test="${ us.useType eq 20}">
														<input type="text" value="${ us.requestId }" style="display:none;">
														<a class="button is-primary" style="height:20px;" data-tooltip="해당글 보러가기" target="_blank" href="oneBoardRPoint.po?mid=${us.memberId}&bid=${ us.requestId }">의뢰채택</a>
													</c:if>
												</td>
												<td>
													<a class="button is-primary" id="toRefund" data-target="#myModal"style="height:20px;" data-tooltip="환불 신청하기">  환불신청 </a>
												</td>
											</tr>
										</c:forEach>
								    </tbody>
							  </table>
							</div>
							<div align="center" class="receivePagingArea" style="margin-top:3%;">
					    		<button class="pagingBtn"> << </button>
					    		<button class="pagingBtn"> < </button>
					    		<button class="pagingBtn"> 1 </button>
					    		<button class="pagingBtn"> 2 </button>
					    		<button class="pagingBtn"> > </button>
					    		<button class="pagingBtn"> >> </button>
				    		</div>
				    		<a style="height:20px;color:purple;margin-left:90%;" href="#pt"><i class='fas fa-chevron-circle-up' style='font-size:36px'></i></a>
				    		<br>
				    	</div>
				   	</div>
			    </section>
			    <section class="section" id="modal">
					<div class="modal" id="myModal">
						<div class="modal-background" id="back1"></div>
						<div class="modal-card">
							<header class="modal-card-head">
								<p class="modal-card-title" id="modalHeader"></p>
								<button class="delete" id="del1"></button>
								<input type="hidden" id="refundPointId">
							</header>
							<section class="modal-card-body">
								<textarea cols="85" rows="15" style="resize:none;" id="modalContent"></textarea>
							</section>
							<footer class="modal-card-foot">
								<div style="margin-left:auto;margin-right:auto;">
									<a class="button is-success" id="refundYes" style="border-radius:5px; height:25px;width:60px;"> 예 </a>
									<a class="button is-danger" style="border-radius:5px; height:25px;" onclick="no()"> 아니요 </a>
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
	</c:if>
	
	<script type="text/javascript">
		$(function() {
			$(".myPoint").parent().addClass('is-active');
			
			//환불 신청 모달
			$("#modalHeader").text('환불을 신청하시겠습니까?');
			$("#modalContent").attr('placeholder','환불사유를 입력해주세요');
			
			$('.modal-background, .modal-close').click(function() {
				$(this).parent().removeClass('is-active');
				$("#modalContent").val("");
				$("#modalHeader2").text('환불을 취소하셨습니다.');
				$('#myModal2').toggleClass('is-active');
				$('#back2, #del2').click(function() {
					$(this).parent().removeClass('is-active');
				});
				$("#okay").click(function(){
					$("#myModal2").removeClass('is-active');
				});
			});
			$("#del").click(function(){
				$(".myModal").removeClass('is-active');
				$("#modalContent").val("");
			});
			//포인트 충전 월검색 시
			$("#chargeSelect").change(function(){
				var month = $(this).children('option:selected').val();
				if(month!='defaultOption'){
					//console.log("month : " + month );
					var currentPage = 1;
					$.ajax({
						url:"oneMonthPay.po",
						type:"post",
						data:{month:month, currentPage:currentPage},
						success:function(data){
							//console.log(data);
							makeChargeTable(data.hmap.chPayList, data.hmap.chPi, month);
							chargePaging(data.hmap.chPi, month);
						},
						error:function(data){
							console.log('error');
						}
					});
				}
			});
			//포인트 지급 월 검색시
			$("#receiveSelect").change(function(){
				var month = $(this).children('option:selected').val();
				if(month!='defaultOption'){
					//console.log("month : " + month );
					$.ajax({
						url:"oneMonthRPoint.po",
						type:"post",
						data:{month:month},
						success:function(data){
							makeReserveTable(data);
						},
						error:function(data){
							console.log('error');
						}
					});
				}
			});
			//포인트 사용 월 검색시
			$("#useSelect").change(function(){
				var month = $(this).children('option:selected').val();
				if(month!='defaultOption'){
					//console.log("month : " + month );
					$.ajax({
						url:"oneMonthUPoint.po",
						type:"post",
						data:{month:month},
						success:function(data){
							makeUseTable(data);
						},
						error:function(data){
							console.log('error');
						}
					});
				}
			});
		});
		//포인트 충전 테이블
		function makeChargeTable(chPayList, chPi, month){
			//console.log(data);
			$("#chargeTBody").empty();
			var len = chPayList.length;
			for(var i=0 ; i<len ; i++){
				var list = chPayList[i];
				//console.log(list);
				var pi = chPi;
				//console.log(pi);
				
				var $listTr = $("<tr>");
				
				var $noTd = $("<td width='10px'>").text(i+1);
				
				var $paymentIdIn = $("<input type='hidden' class='paymentId' name='paymentId'>");
				$paymentIdIn.val(list.paymentId);
				$noTd.append($paymentIdIn);
				
				var pay = comma(list.payAmount);
				var $payAmountTd = $("<td>").text(pay+"P");
				//console.log(list.paymentDate);
				var date = new Date(list.paymentDate);
				date = getFormatDate(date);
				
				var $paymentDate = $("<td>").text(date);
				
				$listTr.append($noTd);
				$listTr.append($payAmountTd);
				$listTr.append($paymentDate);
				
				$("#chargeTBody").append($listTr);
			}
			chargePaging(chPi, month);
		};
		//포인트 충전 테이블 페이징
		function chargePaging(chPi, month){
			var $page = $(".chargePagingArea");
			
			var pi = chPi;
			var currentPage = pi.currentPage;
			var limit = pi.limit;
			var maxPage = pi.maxPage;
			var startPage = pi.startPage;
			var endPage = pi.endPage;
			//console.log(pi);
			
			var startRow = (currentPage - 1) * limit + 1;
			var endRow = startRow + limit - 1;	
			var str;
			$page.empty();
			//console.log(chPayList);
			if(currentPage <= 1){
				$page.append($("<li>")).append($("<button>").attr("class", "pagingBtn").css({"border-color":"gray"}).text("<"));
			}else{
				var cp = currentPage-1;
				str = "location.href=oneMonthPayPaging.po?currentPage="+cp+"&month="+month;
				$page.append($("<li>")).append($("<button onclick="+str+">").attr("class", "pagingBtn").text("<"));
			}
			for(var p = startPage ; p<endPage ; p++){
				if(p == currentPage){
					$page.append($("<li>")).append($("<button>").attr("class", "pagingBtn").css({"border-color":"gray"}).text(p));
				}else{
					str = "location.href=oneMonthPayPaging.po?currentPage="+p+"&month="+month;
					$page.append($("<li>")).append($("<button onclick="+str+">").attr("class", "pagingBtn").css({"border-color":"gray"}).text(p));
				}
			} 
			if(currentPage >= maxPage){
				$page.append($("<li>")).append($("<button>").attr("class", "pagingBtn").css({"border-color":"gray"}).text(">"));
			}else{
				var cp = currentPage+1;
				str = "location.href=oneMonthPayPaging.po?currentPage="+cp+"&month="+month;
				$page.append($("<li>")).append($("<button onclick="+str+">").attr("class", "pagingBtn").css({"border-color":"gray"}).text(">"));
			}
			
		};
		//포인트 지급 테이블 만들기
		function makeReserveTable(data){
			$("#receiveTBody").empty();			
			var len = data.hmap.rePayList.length;
			for(var i=0 ; i<len ; i++){
				var list = data.hmap.rePayList[i];
				//console.log(list);
				var pi = data.hmap.rePi;
				//console.log(pi);
				
				var $listTr = $("<tr>");
				
				var $noTd = $("<td width='10px'>").text(i+1);
				
				var $reserveIdIn = $("<input type='hidden' class='reserveId' name='reserveId'>");
				$reserveIdIn.val(list.pointId);
				$noTd.append($reserveIdIn);
				
				var point = comma(list.reservePoint);
				var $reservePointTd = $("<td>").text(point+"P");
				
				var date = new Date(list.reserveDate);
				date = getFormatDate(date);				
				
				var $reserveDate = $("<td>").text(date);
				
				var $reserveTypeTd = $("<td>");
				var reserveType = list.reserveType;	//10:일정작성, 20:일정리뷰, 30:여행지리뷰
				var $reserveTypeIn, $reserveTypeA, mid, bid;
				
				if(reserveType==10){
					//일정작성
					mid = list.memberId;
					bid = list.trvId;
					//console.log("mid"+mid);
					//console.log("bid"+bid);
					$reserveTypeIn = $('<input type="text" style="display:none;">');
					$reserveTypeIn.val(list.trvId);
					
					$reserveTypeA = $('<button id="reserveLink" class="button is-primary" data-mid='+mid+' data-bid='+bid+' style="height:20px;" data-tooltip="해당글 보러가기" target="_blank">일정작성</button>');
					$reserveMidIn = $('<input type="text" style="display:none;">');
					$reserveMidIn.val(mid);
					
					$reserveBidIn = $('<input type="text" style="display:none;">');
					$reserveBidIn.val(bid);
					
					$reserveTypeA.append($reserveMidIn);
					$reserveTypeA.append($reserveBidIn);
					
					$reserveTypeTd.append($reserveTypeIn);
					$reserveTypeTd.append($reserveTypeA);
				}else if(reserveType==20){
					//일정리뷰
					mid = list.memberId;
					bid = list.reviewId;
					//console.log("mid"+mid);
					//console.log("bid"+bid);
					$reserveTypeIn = $('<input type="text" style="display:none;">');
					$reserveTypeIn.val(list.reviewId);
					
					$reserveTypeA = $('<button id="reserveLink" class="button is-primary" data-mid='+mid+' data-bid='+bid+' style="height:20px;" data-tooltip="해당글 보러가기" target="_blank">일정리뷰</button>');
					$reserveMidIn = $('<input type="text" style="display:none;">');
					$reserveMidIn.val(mid);
					
					$reserveBidIn = $('<input type="text" style="display:none;">');
					$reserveBidIn.val(bid);
					
					$reserveTypeA.append($reserveMidIn);
					$reserveTypeA.append($reserveBidIn);
					
					$reserveTypeTd.append($reserveTypeIn);
					$reserveTypeTd.append($reserveTypeA);
				}else if(reserveType==30){
					//명소리뷰
					mid = list.memberId;
					bid = list.spotReviewId;
					//console.log("mid"+mid);
					//console.log("bid"+bid);
					$reserveTypeIn = $('<input type="text" style="display:none;">');
					$reserveTypeIn.val(list.spotReviewId);
					
					$reserveTypeA = $('<button id="reserveLink" class="button is-primary" data-mid='+mid+' data-bid='+bid+' style="height:20px;" data-tooltip="해당글 보러가기" target="_blank">명소리뷰</button>');
					$reserveMidIn = $('<input type="text" style="display:none;">');
					$reserveMidIn.val(mid);
					
					$reserveBidIn = $('<input type="text" style="display:none;">');
					$reserveBidIn.val(bid);
					
					$reserveTypeA.append($reserveMidIn);
					$reserveTypeA.append($reserveBidIn);
					
					$reserveTypeTd.append($reserveTypeIn);
					$reserveTypeTd.append($reserveTypeA);
				}
				$listTr.append($noTd);
				$listTr.append($reservePointTd);
				$listTr.append($reserveDate);
				$listTr.append($reserveTypeTd);
				$("#receiveTBody").append($listTr);
			}
		};
		//포인트 사용 테이블 만들기
		function makeUseTable(data){
			$("#useTBody").empty();	
			//console.log(data);
			var len = data.hmap.usPayList.length;
			for(var i=0 ; i<len ; i++){
				var list = data.hmap.usPayList[i];
				var pi = data.hmap.usPi;
				
				var $listTr = $("<tr>");
				
				var $noTd = $("<td width='10px'>").text(i+1);
				
				var $useIdIn = $("<input type='hidden' class='useId' name='useId'>");
				$useIdIn.val(list.pointId);
				$noTd.append($useIdIn);
				
				var point = comma(list.usePoint);
				var $usePointTd = $("<td>").text(point+"P");
				
				var date = new Date(list.useDate);
				date = getFormatDate(date);				
				
				var $useDate = $("<td>").text(date);
				
				var $useTypeTd = $("<td>");
				var useType = list.useType;	//10:일정작성, 20:일정리뷰, 30:여행지리뷰
				var $useTypeIn, $useTypeA, mid, bid;
				
				if(useType==10){
					//일정구매
					mid = list.memberId;
					bid = list.trvId;
					//console.log("mid"+mid);
					//console.log("bid"+bid);
					$useTypeIn = $('<input type="text" style="display:none;">');
					$useTypeIn.val(list.trvId);
					
					$useTypeA = $('<button id="useLink" class="button is-primary" data-mid='+mid+' data-bid='+bid+' style="height:20px;" data-tooltip="해당글 보러가기" target="_blank">일정구매</button>');
					$useMidIn = $('<input type="text" style="display:none;">');
					$useMidIn.val(mid);
					
					$useBidIn = $('<input type="text" style="display:none;">');
					$useBidIn.val(bid);
					
					$useTypeA.append($useMidIn);
					$useTypeA.append($useBidIn);
					
					$useTypeTd.append($useTypeIn);
					$useTypeTd.append($useTypeA);
				}else if(useType==20){
					//설계구매
					mid = list.memberId;
					bid = list.requestId;
					//console.log("mid"+mid);
					//console.log("bid"+bid);
					$useTypeIn = $('<input type="text" style="display:none;">');
					$useTypeIn.val(list.requestId);
					
					$useTypeA = $('<button id="useLink" class="button is-primary" data-mid='+mid+' data-bid='+bid+' style="height:20px;" data-tooltip="해당글 보러가기" target="_blank">설계구매</button>');
					$useMidIn = $('<input type="text" style="display:none;">');
					$useMidIn.val(mid);
					
					$useBidIn = $('<input type="text" style="display:none;">');
					$useBidIn.val(bid);
					
					$useTypeA.append($useMidIn);
					$useTypeA.append($useBidIn);
					
					$useTypeTd.append($useTypeIn);
					$useTypeTd.append($useTypeA);
				}
				var $refundStatusTd = $("<td>");
				var $refundStatusA = $('<button class="button is-primary" id="refundStatus" data-target="#myModal" style="height:20px;" data-tooltip="환불 신청하기">  환불신청 </button>');
				$refundStatusTd.append($refundStatusA);
				
				$listTr.append($noTd);
				$listTr.append($usePointTd);
				$listTr.append($useDate);
				$listTr.append($useTypeTd);
				$listTr.append($refundStatusTd);
				
				$("#useTBody").append($listTr);
			}
		};
		//생성된 지급 테이블의 이벤트 걸기
		$("body").on("click", "#reserveLink, #useLink",function(){
			var mid = $(this).children().eq(0).val();
			var bid = $(this).children().eq(1).val();
			var url = "oneBoardRPoint.po?mid="+mid+"&bid="+bid;
			
			console.log("mid : " + mid);
			console.log("bid : " + bid);

			window.open(url, "oneBoard", "width=1000,height=700");

			
		});
		//기존 사용 테이블의 이벤트 걸기
		$("body").on("click","#toRefund", function(){
			var usePointId = $(this).parent().parent().children().eq(0).text();
			var useDate = $(this).parent().parent().children().eq(2).text();
			
			//console.log(useDate);
			var year = useDate.substring(0,2);
			var month = useDate.substring(3,5);
			var day = useDate.substring(6,8);
			var index1 = useDate.lastIndexOf(" ");
			var hour = useDate.substring(index1+1,index1+3);
			var index2 = useDate.lastIndexOf(":");
			var minute = useDate.substring(index2+1,index2+3);
			var date = "20"+year+"/"+month+"/"+day+" "+hour+":"+minute;
			console.log(date);
			useDate = new Date(date);	
			//포인트 사용일 밀리세컨단위
			var milis = useDate.getTime();
			milisFuture = Number(milis)+86400000;			
			//var dateFuture = new Date(milisFuture);				
			//dateFuture = getFormatDate(dateFuture);
			//console.log(milisFuture);
			//console.log(useDate);
			
			//클릭시 밀리세컨단위
			var dateNow = new Date();
			var milisNow = dateNow.getTime();
			//console.log(milisNow);
			//var time = getFormatDate(dateNow);
			//console.log(time);
			var sub = Number(milisFuture) - Number(milisNow);
			if(sub<=0){
				console.log('24시간 지남');
				$("#modalHeader2").text('24시간이 지나 환불신청이 불가능합니다.');
				$('#myModal2').toggleClass('is-active');
				$('#back2, #del2').click(function() {
					$(this).parent().removeClass('is-active');
				});
				$("#okay").click(function(){
					$("#myModal2").removeClass('is-active');
				});
				
			}else{
				console.log('24시간 안지남');
				$("#refundPointId").val(usePointId);
				$("#modalHeader").text('환불을 신청하시겠습니까?');
				$("#modalContent").attr('placeholder','환불사유를 입력해주세요');
				$('#myModal').toggleClass('is-active');
			}
			
			
		});
		//생성된 사용 테이블의 이벤트 걸기
		$("body").on("click","#refundStatus", function(){
			var usePointId = $(this).parent().parent().children().eq(0).children().eq(0).val();
			$("#refundPointId").val(usePointId);
			$('#myModal').toggleClass('is-active');
		});
		
		$("body").on("click","#refundYes", function(){
			var refundId = $(this).parent().parent().parent().children().eq(0).children().eq(2).val();
			var refundReason = $(this).parent().parent().parent().children().eq(1).children().eq(0).val();
			
			console.log(refundReason);
			if(refundReason == ""){
				$("#myModal").removeClass('is-active');
				$("#modalContent").val("");
				$("#modalHeader2").text('환불사유를 입력해주세요');
				$('#myModal2').toggleClass('is-active');
				$('#back2, #del2').click(function() {
					$(this).parent().removeClass('is-active');
					//location.href="환불메소드로";
				});
				$("#okay").click(function(){
					$("#myModal2").removeClass('is-active');
					//location.href="환불메소드로";
				});
			}else{
				$.ajax({
					url:"refundUPoint.po",
					data:{refundId:refundId, refundReason:refundReason},
					type:"post",
					success:function(data){
						console.log('success');
						
						$("#myModal").removeClass('is-active');
						$("#modalContent").val("");
						$("#modalHeader2").text('환불신청한 내역이 관리자에게 전달 되었습니다.').append("<p>빠른 시일 내에 처리하도록 하겠습니다.</p>");
						$('#myModal2').toggleClass('is-active');
						$('#back2, #del2').click(function() {
							$(this).parent().removeClass('is-active');
							//location.href="환불메소드로";
						});
						$("#okay").click(function(){
							$("#myModal2").removeClass('is-active');
							//location.href="환불메소드로";
						});
					},
					error:function(data){
						console.log('error');
					}
				});
				
			}
		});
		//ajax 천단위마다 콤마찍기
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
		//long형 날짜를 yy/mm/dd hh:MM으로 변환
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
		function no(){
			//환불신청취소
			$("#myModal").removeClass('is-active');
			$("#modalHeader2").text('환불을 취소하셨습니다.');
			$('#myModal2').toggleClass('is-active');
			$('#back2, #del2').click(function() {
				$(this).parent().removeClass('is-active');
			});
			$("#okay").click(function(){
				$("#myModal2").removeClass('is-active');
			});
		}
	</script>
</body>
</html>