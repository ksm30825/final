<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	#chargeArea tbody *:hover,#receiveArea tbody *:hover,#useArea tbody *:hover{
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
				    		<div class="select" style="display:inline-block;float:right;">
					            <select name="chargeSelect">
					              <option>--월--</option>
					              <option>1</option>
					              <option>2</option>
					              <option>3</option>
					              <option>4</option>
					              <option>5</option>
					              <option>6</option>
					              <option>7</option>
					              <option>8</option>
					              <option>9</option>
					              <option>10</option>
					              <option>11</option>
					              <option>12</option>
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
							        <th> 충전일 </th>
							        <th> 충전액 </th>
							      </tr>
							    </thead>
							    <tbody id="ps">
							    
							      <tr>
							        <td> 1 </td>
							        <td> 19.06.03 </td>
							        <td> 3,000 </td>
							      </tr>
							      <tr>
							        <td> 2 </td>
							        <td> 19.06.03 </td>
							        <td> 3,000 </td>
							      </tr>
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
				    			<select name="receiveSelect">
				    				<option>--월--</option>
						            <option>1</option>
						            <option>2</option>
						            <option>3</option>
						            <option>4</option>
						            <option>5</option>
						            <option>6</option>
						            <option>7</option>
						            <option>8</option>
						            <option>9</option>
						            <option>10</option>
						            <option>11</option>
						            <option>12</option>
								</select>
							</div>
			    		</div>
						<div id="receiveTB">
							<table class="table is-narrow" align="center" style="width:100%;">
							    <thead>
							      <tr style="background:skyblue;">
							        <th> No </th>
							        <th> 지급일 </th>
							        <th> 지급포인트 </th>
							        <th> 지급게시글 </th>
							      </tr>
							    </thead>
							    <tbody id="pb">
							      <tr>
							        <td> 1 </td>
							        <td> 19.06.03 </td>
							        <td> 50P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">후기작성</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 2 </td>
							        <td> 19.06.03 </td>
							        <td> 50P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">후기작성</a>
							        </td>
							      </tr>
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
				    			<select name="useSelect">
				    				<option>--월--</option>
						            <option>1</option>
						            <option>2</option>
						            <option>3</option>
						            <option>4</option>
						            <option>5</option>
						            <option>6</option>
						            <option>7</option>
						            <option>8</option>
						            <option>9</option>
						            <option>10</option>
						            <option>11</option>
						            <option>12</option>
								</select>
							</div>
			    		</div>
			    		<div id="useTB">
							<table class="table is-narrow" align="center" style="width:100%;">
							    <thead>
							      <tr style="background:skyblue">
							        <th> No </th>
							        <th> 사용일 </th>
							        <th> 사용포인트 </th>
							        <th> 사용게시글 </th>
							        <th> 환불신청상태 </th>
							      </tr>
							    </thead>
							    <tbody>
							      <tr>
							        <td> 1 </td>
							        <td> 19.06.03 </td>
							        <td> 50P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;" id="apply">후기작성</a>
							        </td>
							        <td>
							        	<a class="button is-primary" data-target="#myModal" onclick="$('#myModal').toggleClass('is-active')"> 환불신청 </a>
							        </td>
							      </tr>
							      <tr>
							        <td> 2 </td>
							        <td> 19.06.03 </td>
							        <td> 50P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;" id="apply">후기작성</a>
							        </td>
							        <td>
							        	<a class="button is-warning"> 처리대기 </a>
							        </td>
							      </tr>
							      <tr>
							        <td> 3 </td>
							        <td> 19.06.03 </td>
							        <td> 50P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;" id="apply">후기작성</a>
							        </td>
							        <td>
							        	<a class="button is-success"> 환불승인 </a>
							        </td>
							      </tr>
							      <tr>
							        <td> 4 </td>
							        <td> 19.06.03 </td>
							        <td> 50P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;" id="apply">후기작성</a>
							        </td>
							        <td>
							        	<a class="button is-danger"> 환불거절 </a>
							        </td>
							      </tr>
							      <tr>
							        <td> 5 </td>
							        <td> 19.06.03 </td>
							        <td> 50P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;" id="apply">후기작성</a>
							        </td>
							        <td>
							        	<a class="button is-warning"> 처리대기 </a>
							        </td>
							      </tr>
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
	<script type="text/javascript">
		$(function() {
			$(".myPoint").parent().addClass('is-active');
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
		});
		function yes(){
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