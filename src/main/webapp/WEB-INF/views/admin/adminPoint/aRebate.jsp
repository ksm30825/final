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
					<div style="width:100%;font-size:25px;color:#209cee;">환급 내역</div>
			        <a class="button is-primary" style="width:70px;height:20px;float:right;margin-left:2px;" data-tooltip="다운로드를 받으실 수 있습니다.">다운로드</a>
			        <a class="button is-success" style="width:70px;height:20px;float:right;" data-tooltip="선택항목들 지급하기">지급하기</a>	
					<br>
			         <div style="width:100%;height:100%;">
			         	<div>
			         		<div class="field has-addons" style="width:475px;float:right;margin-top:1%;">
								<p class="control" data-tooltip="검색">
									<a class="button is-primary" style="width:40px;height:20px;">
										<i class='fas fa-search' style='font-size:15px'></i>
									</a>
								</p>
								<p class="control">
									<input class="input is-primary" type="text" placeholder="회원ID를 검색하세요" style="width:150px;height:20px;">
								</p>
								<div class="select is-small is-primary" style="display:inline-block;float:right;text-align:center;">
						            <select name="chargeSelect" style="height:20px;">
						              <option>--환급지급상태--</option>
						              <option>미지급</option>
						              <option>지급완료</option>
						            </select>
					        	</div>
						        <input type="date" class="input is-primary" style="width:140px;height:20px;margin-left:2px;" data-tooltip="검색시작날짜">
								<i class='far fa-calendar-alt' style='font-size:20px;color:purple;margin-right:2px;'></i>~
								<input type="date" class="input is-primary" style="width:140px;height:20px;margin-left:2px;" data-tooltip="검색종료날짜">
								<i class='far fa-calendar-alt' style='font-size:20px;color:purple;'></i>
							</div>
						</div>
			         	<div style="width:100%;height:25px;"></div>
			         </div>
			         <div style="width:100%;height:100%;" id="aPointArea">
						<table id="aPointTB" class="table is-narrow"align="center"style="width:100%;height:100%;" >
							<thead>
								<tr style="background:#ccccff;">
									<th width="2%"> 
										<input type="checkbox" name="rebateCheck">
									</th>
									<th width="3%"> No. </th>
									<th width="5%"> 아이디 </th>
									<th width="5%"> 총수익금 </th>
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
									<td> 320,000 </td>
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
									<td> 290,000 </td>
									<td> 10,000 </td>
									<td> 19.04.10 </td>
									<td>
										<a class="button is-danger" style="width:70px;height:20px;"> 지급완료 </a>
									</td>
								</tr>
							</tbody>
						</table>
			         </div>
					
					<div align="center" class="pagingBtn" style="margin-top:3%;">
		    		<button class="pageingBtn"> << </button>
		    		<button class="pageingBtn"> < </button>
		    		<button class="pageingBtn"> 1 </button>
		    		<button class="pageingBtn"> 2 </button>
		    		<button class="pageingBtn"> > </button>
		    		<button class="pageingBtn"> >> </button>
				</div>
				</div>
			</section>
			<section class="section" id="modal">
				<div class="modal" id="myModal">
					<div class="modal-background"></div>
					<div class="modal-card">
						<header class="modal-card-head">
							<p class="modal-card-title">환불 하시겠습니까?</p>
							<button class="delete" id="del"></button>
						</header>
						<section class="modal-card-body">
							<textarea placeholder="환불사유를 입력해주세요" cols="85" rows="15" style="resize:none;"></textarea>
						</section>
						
						<footer class="modal-card-foot">
							<div style="margin-left:auto;margin-right:auto;">
								<a class="button is-success" style="border-radius:5px; height:25px;width:60px;"> 예 </a>
								<a class="button is-danger" style="border-radius:5px; height:25px;"> 아니요 </a>
							</div>
						</footer>
					</div>
				</div>
			</section>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('.modal-background, .modal-close').click(function() {
				$(this).parent().removeClass('is-active');
			});
			$("#del").click(function(){
				$(this).parent().parent().parent().removeClass('is-active');
			});
			$(".apointReb").parent().addClass('is-active');
			$(".apointReb").children().css({"color":"#209cee"});
		});
	</script>
</body>
</html>