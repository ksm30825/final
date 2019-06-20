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
					<div style="width:100%;font-size:25px;color:#209cee;">포인트 내역</div>
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
							<a class="button is-primary is-outlined" style="width:120px;height:20px;margin-left:2%;" href="allAdRefund.po">환불내역 보러가기</a>
						</div>
					</div>
		         	<div style="width:100%;height:25px;"></div>
		         </div>
		         <div style="width:100%;height:100%;" id="aPointArea">
					<table id="aPointTB" class="table is-narrow" align="center"style="width:100%;height:100%;" >
						<thead>
							<tr style="background:#ccccff;">
								<th width="5%"> No. </th>
								<th width="15%"> 아이디 </th>
								<th width="15%"> 닉네임 </th>
								<th width="30%"> 총 포인트 </th>
								<th width="30%"> 총 수익금 </th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td> 1 </td>
								<td> user01 </td>
								<td> skdafj </td>
								<td> 4,000P </td>
								<td> 4,000 </td>
							</tr>
							<tr>
								<td> 2 </td>
								<td> user02 </td>
								<td> sknnn </td>
								<td> 3,000P </td>
								<td> 50,000 </td>
							</tr>
							<tr>
								<td> 3 </td>
								<td> user03 </td>
								<td> 123asdw </td>
								<td> 3,000P </td>
								<td> 5,000 </td>
							</tr>
							<tr>
								<td> 4 </td>
								<td> user04 </td>
								<td> dsdww </td>
								<td> 0P </td>
								<td> 3,000 </td>
							</tr>
							<tr>
								<td> 5 </td>
								<td> user05 </td>
								<td> ewwse </td>
								<td> 3,200P </td>
								<td> 10,000 </td>
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
		</div>
	</div>
	<script>
		$(function(){
			$(".apointPo").parent().addClass('is-active');
			$(".apointPo").children().css({"color":"#209cee"});
		})
	</script>
</body>
</html>