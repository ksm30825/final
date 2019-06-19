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
	<section class="section">
		<div class="container" style="width:90%;height:100%;">
			<div style="width:100%;font-size:25px;color:#209cee;">환불 내역</div>
         <div style="width:100%;height:100%;">
         	<div>
         		<div class="field has-addons" style="width:320px;float:right;">
					<p class="control">
						<a class="button is-primary" style="width:40px;height:20px;">
							<i class='fas fa-search' style='font-size:15px'></i>
						</a>
					</p>
					<p class="control">
						<input class="input is-primary" type="text" placeholder="회원ID를 검색하세요" style="width:150px;height:20px;">
					</p>
					<div class="select is-small is-primary" style="display:inline-block;float:right;">
			            <select name="chargeSelect" style="height:20px;">
			              <option>--환불승인상태--</option>
			              <option>대기중</option>
			              <option>승인</option>
			              <option>거절</option>
			            </select>
			        </div>
				</div>
			</div>
         	<div style="width:100%;height:25px;"></div>
         </div>
         <div style="width:100%;height:100%;" id="aPointArea">
			<table id="aPointTB" class="table is-narrow"align="center"style="width:100%;height:100%;" >
				<thead>
					<tr style="background:#ccccff;">
						<th width="3%"> No. </th>
						<th width="5%"> 아이디 </th>
						<th width="5%"> 닉네임 </th>
						<th width="5%"> 구매일 </th>
						<th width="10%"> 구매한 게시글 </th>
						<th width="10%"> 사용한 포인트 </th>
						<th width="8%"> 환불 사유 </th>
						<th width="16%"> 환불 승인 </th>
						<th width="10%"> 환불 승인 상태 </th>
					</tr>
				</thead>
				<tbody id="aPointTBody">
					<tr>
						<td> 1 </td>
						<td> user01 </td>
						<td> skdafj </td>
						<td> 19.06.10 </td>
						<td> 18 </td>
						<td> 400P </td>
						<td> 이 사람이.. </td>
						<td>
							<a class="button is-success" style="width:70px;height:20px;"> 승인 </a>
							<a class="button is-danger" style="width:70px;height:20px;"> 환불거절 </a>
						</td>
						<td>
							<a class="button is-primary" style="width:70px;height:20px;"> 대기중 </a>
						</td>
					</tr>
					<tr>
						<td> 2 </td>
						<td> user02 </td>
						<td> sknnn </td>
						<td> 19.06.05 </td>
						<td> 18 </td>
						<td> 400P </td>
						<td> 이 사람이.. </td>
						<td>
							<a class="button is-success" style="width:70px;height:20px;"> 승인 </a>
							<a class="button is-danger" style="width:70px;height:20px;"> 환불거절 </a>
						</td>
						<td>
							<a class="button is-primary" style="width:70px;height:20px;"> 대기중 </a>
						</td>
					</tr>
					<tr>
						<td> 3 </td>
						<td> user02 </td>
						<td> sknnn </td>
						<td> 19.06.03 </td>
						<td> 3 </td>
						<td> 300P </td>
						<td> 이 사람이.. </td>
						<td>
							<a class="button is-success" style="width:70px;height:20px;"> 승인 </a>
							<a class="button is-danger" style="width:70px;height:20px;"> 환불거절 </a>
						</td>
						<td>
							<a class="button is-success" style="width:70px;height:20px;"> 승인 </a>
						</td>
					</tr>
					<tr>
						<td> 4 </td>
						<td> user01 </td>
						<td> skdafj </td>
						<td> 19.04.10 </td>
						<td> 18 </td>
						<td> 400P </td>
						<td> 이 사람이.. </td>
						<td>
							<a class="button is-success" style="width:70px;height:20px;"> 승인 </a>
							<a class="button is-danger" style="width:70px;height:20px;"> 환불거절 </a>
						</td>
						<td>
							<a class="button is-danger" style="width:70px;height:20px;"> 거절 </a>
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
	<script type="text/javascript">
		$(function() {
			$('.modal-background, .modal-close').click(function() {
				$(this).parent().removeClass('is-active');
			});
			$("#del").click(function(){
				$(this).parent().parent().parent().removeClass('is-active');
			});
		});
	</script>
</body>
</html>