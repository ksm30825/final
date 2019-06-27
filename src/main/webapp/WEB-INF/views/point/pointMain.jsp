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
										<option id="defaultOption" selected>--월--</option>
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
											<th> No </th>
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
					    	<div align="center" class="chargePagingArea" style="margin-top:3%;">
					    		<button class="pageingBtn"> << </button>
					    		<button class="pageingBtn"> < </button>
					    		<button class="pageingBtn"> 1 </button>
					    		<button class="pageingBtn"> 2 </button>
					    		<button class="pageingBtn"> > </button>
					    		<button class="pageingBtn"> >> </button>
					    	</div>
					    	<a style="height:20px;color:purple;margin-left:90%;" href="#pt"><i class='fas fa-chevron-circle-up' style='font-size:36px'></i></a>
				    	</div>
				    	<div id="receiveArea" style="margin-top:3%; border-top:1px solid lightgray;">
				    		<div id="receiveTop">
				    			<div id="receiveTitle" style="color:purple; font-size:28px;margin-top:3%;">
					    			포인트 지급내역
				    			</div>
					    		<div class="select" style="display:inline-block;float:right;margin-bottom:1%;">
					    			<select name="receiveSelect" id="receiveSelect">
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
							<div id="receiveTB">
								<table class="table is-narrow" align="center" style="width:100%;">
								    <thead>
										<tr style="background:skyblue;">
											<th> No </th>
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
													<c:if test="${ re.reserveType eq 10}">
														<input type="text" value="${ re.trvId }" style="display:none;">
														<a class="button is-primary" style="height:20px;" data-tooltip="해당글 보러가기">일정작성</a>
													</c:if>
													<c:if test="${ re.reserveType eq 20}">
														<input type="text" value="${ re.reviewId }" style="display:none;">
														<a class="button is-primary" style="height:20px;" data-tooltip="해당글 보러가기">일정리뷰</a>
													</c:if>
													<c:if test="${ re.reserveType eq 30}">
														<input type="text" value="${ re.spotReviewId }" style="display:none;">
														<a class="button is-primary" style="height:20px;" data-tooltip="해당글 보러가기">명소리뷰</a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
								    </tbody>
							  </table>
							</div>
							<div align="center" class="receivePagingArea" style="margin-top:3%;">
					    		<button class="pageingBtn"> << </button>
					    		<button class="pageingBtn"> < </button>
					    		<button class="pageingBtn"> 1 </button>
					    		<button class="pageingBtn"> 2 </button>
					    		<button class="pageingBtn"> > </button>
					    		<button class="pageingBtn"> >> </button>
				    		</div>
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
								        <th> No </th>
								        <th> 사용포인트 </th>
								        <th> 사용일 </th>
								        <th> 사용게시글 </th>
								        <th> 환불신청상태 </th>
								      </tr>
								    </thead>
								    <tbody id="useTBody">
								    	<c:forEach var="us" items="${ usPayList }">
											<tr>
												<td>
													<c:out value="${ us.pointId }"/>
												</td>
												<td>
													<span><fmt:formatNumber value="${ us.usePoint }" groupingUsed="true"/>P</span>
												</td>
												<td>
													<fmt:formatDate value="${ us.useDate }" pattern="yy/MM/dd HH:mm" />
												</td>
												<td>
													<c:if test="${ us.useType eq 10}">
														<!-- 일정구매 -->
														<input type="text" value="${ us.trvId }" style="display:none;">
														<a class="button is-primary" style="height:20px;" data-tooltip="해당글 보러가기">일정구매</a>
													</c:if>
													<c:if test="${ us.useType eq 20}">
														<input type="text" value="${ us.requestId }" style="display:none;">
														<a class="button is-primary" style="height:20px;" data-tooltip="해당글 보러가기">의뢰채택</a>
													</c:if>
												</td>
												<td>
													<a class="button is-primary" data-target="#myModal" onclick="$('#myModal').toggleClass('is-active')"style="height:20px;" data-tooltip="환불 신청하기">  환불신청 </a>
												</td>
											</tr>
										</c:forEach>
								    </tbody>
							  </table>
							</div>
							<div align="center" class="receivePagingArea" style="margin-top:3%;">
					    		<button class="pageingBtn"> << </button>
					    		<button class="pageingBtn"> < </button>
					    		<button class="pageingBtn"> 1 </button>
					    		<button class="pageingBtn"> 2 </button>
					    		<button class="pageingBtn"> > </button>
					    		<button class="pageingBtn"> >> </button>
				    		</div>
				    		<a style="height:20px;color:purple;margin-left:90%;" href="#pt"><i class='fas fa-chevron-circle-up' style='font-size:36px'></i></a>
				    		<br>
				    	</div>
				   	</div>
			    </section>
			    <section class="section" id="modal">
					<div class="modal" id="myModal">
						<div class="modal-background"></div>
						<div class="modal-card">
							<header class="modal-card-head">
								<p class="modal-card-title" id="modalHeader"></p>
								<button class="delete" id="del"></button>
							</header>
							<section class="modal-card-body">
								<textarea cols="85" rows="15" style="resize:none;" id="modalContent"></textarea>
							</section>
							<footer class="modal-card-foot">
								<div style="margin-left:auto;margin-right:auto;">
									<a class="button is-success" style="border-radius:5px; height:25px;width:60px;" onclick="yes()"> 예 </a>
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
			$("#modalHeader").text('환불은 신청하시겠습니까?');
			$("#modalContent").attr('placeholder','환불사유를 입력해주세요');
			
			$('.modal-background, .modal-close').click(function() {
				$(this).parent().removeClass('is-active');
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
				$(this).parent().parent().parent().removeClass('is-active');
			});
			
			$("#chargeSelect").change(function(){
				console.log($(this).children('option:selected').val());
				//->ajax처리
			})
			
		});
		function yes(){
			//환불신청확인
			$("#myModal").removeClass('is-active');
			$("#modalHeader2").text('환불신청한 내역이 관리자에게 전달 되었습니다.').append("<p>빠른 시일 내에 처리하도록 하겠습니다.</p>");
			$('#myModal2').toggleClass('is-active');
			$('#back2, #del2').click(function() {
				$(this).parent().removeClass('is-active');
			});
			$("#okay").click(function(){
				$("#myModal2").removeClass('is-active');
			});
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