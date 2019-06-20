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
			    <div class="container" style="width:80%;height:100%;border:1px solid #ccccff">
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
				  			<div class="select" style="display:inline-block;float:right;">
					            <select name="rebateSelect">
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
					        <div id="rebateTB">
				    		<table class="table is-narrow" align="center" style="width:100%;">
							    <thead>
							      <tr>
							        <th> No </th>
							        <th> 환급신청일 </th>
							        <th> 환급신청액 </th>
							        <th> 환급지급상태 </th>
							      </tr>
							    </thead>
							    <tbody id="ps">
							    
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
				    		<a style="height:20px;color:purple;font-size:40px;margin-left:80%;" href="#pt">△Top</a>
				  		</div>
				  	</div>
				  	
				  	
				  	
				  	
				 	<div id="proceedsArea" style="border-top:1px solid lightgray">
				 		<div id="proceedsTop">
				 			<div id="proceedsTitle" style="color:purple; font-size:28px;margin-top:3%;">
				    			수익금 달성 내역
			    			</div>
				 			<div class="select" style="display:inline-block;float:right;">
					            <select name="rebateSelect">
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
					        	<a class="button is-danger is-outlined" onclick="$('#myModal').toggleClass('is-active')">환급신청 하기</a>
					        </div>
				 		</div>
				 		<div id="proceedsTB">
				 			<table class="table is-narrow" align="center" style="width:100%;">
							    <thead>
							      <tr>
							        <th> No </th>
							        <th> 달성일 </th>
							        <th> 달성 수익금 </th>
							        <th> 달성 게시글 </th>
							      </tr>
							    </thead>
							    <tbody id="pb">
							      <tr>
							        <td> 1 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">내 일정 보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 2 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">내 일정 보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 3 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">내 일정 보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 4 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">내 일정 보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 5 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">내 일정 보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 6 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">내 일정 보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 7 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">내 일정 보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 8 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">내 일정 보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 9 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">내 일정 보러가기</a>
							        </td>
							      </tr>
							      <tr>
							        <td> 10 </td>
							        <td> 19.06.03 </td>
							        <td> 32,000P </td>
							        <td>
							        	<a class="button is-primary " style="height:20px;">내 일정 보러가기</a>
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
			    		<a style="height:20px;color:purple;font-size:40px;margin-left:80%;" href="#pt">△Top</a>
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
							금액 입력 : <input type="number" style="width:80%;" min="0" step="1000">
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
			$(".myPoint").parent().addClass('is-active');
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