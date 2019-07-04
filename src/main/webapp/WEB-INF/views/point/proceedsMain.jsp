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
							      <tr>
							        <td> 1 </td>
							        <td> 19.06.03 </td>
							        <td> 3,000 </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">환급신청</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 2 </td>
							        <td> 19.06.03 </td>
							        <td> 3,000 </td>
							        <td>
							        	<a class="button is-success " style="height:20px;">환급승인</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 3 </td>
							        <td> 19.06.03 </td>
							        <td> 3,000 </td>
							        <td>
							        	<a class="button is-warning " style="height:20px;">환급대기</a>
							        </td>
							      </tr>
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
					        	<a class="button is-danger is-outlined" onclick="$('#myModal').toggleClass('is-active')">환급신청 하기</a>
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
							      <tr>
							        <td> 1 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>	
							        	<a class="button is-primary " style="height:20px;">보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 2 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 3 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 4 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 5 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 6 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">보러가기</a>
							        </td>
							      </tr>
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
							금액 입력 : <input type="number" style="width:80%;" min="10000" step="10000" placeholder="10000원 단위로 신청가능합니다.">
						</section>
						<footer class="modal-card-foot">
							<div style="margin-left:auto;margin-right:auto;">
								<a class="button is-success yes" style="border-radius:5px; height:25px;width:60px;"> 예 </a>
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
			$(".myPoint").parent().addClass('is-active');
			$('.modal-background, .modal-close').click(function() {
				$(this).parent().removeClass('is-active');
			});
			$("#del").click(function(){
				$(this).parent().parent().parent().removeClass('is-active');
			});
			$(".yes").click(function(){
				$('#myModal').removeClass('is-active');
				$('#modalHeader2').text('환급 신청한 내역이 관리자에게 전달 되었습니다.').append('<p>정산은 매월 15일에 이뤄집니다.</p>');
				$("#myModal2").toggleClass('is-active');
				$("#okay").click(function(){
					$('#myModal2').removeClass('is-active');
				});
			});
			$(".no").click(function(){
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