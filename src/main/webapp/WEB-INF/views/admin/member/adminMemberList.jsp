<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Interface</title>
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
	#memberListTB *{
		text-align:center;
	}
	.section {
		width:90% !important;
		margin:0 auto;
		min-height:768px;
	}
</style>
</head>
<body>
	<jsp:include page="../../common/adminMainNav.jsp"/>
	<div class="columns">
		<div class="column">
			<section class="section">
				<div class="field">
					<h3 class="subtitle is-3" style="color:#209cee;"> 회원관리 </h3>
				</div>
				
				<!-- member condition search -->
				<div class="field">
				
				</div> <!-- end member condition search -->
				
				<!-- member list -->
				<div class="field">
					<table id="memberListTB" class="table is-narrow"style="width:100%;height:100%; margin:0 auto;" >
						<thead>
							<tr style="background:#ccccff;">
								<th width="5%"> No. </th>
								<th width="10%"> 이름 </th>
								<th width="10%"> 이메일 </th>
								<th width="10%"> 연락처 </th>
								<th width="10%"> 생년월일 </th>
								<th width="10%"> 성별 </th>
								<th width="10%"> 가입일 </th>
								<th width="10%"> 탈퇴일 </th>
								<th width="10%"> 가입여부 </th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div> <!-- end member list -->
				
				<!-- paging -->
				<div class="field" >
					<nav class="pagination">
				  	<ul class="pagination-list">
				  		<li><button class="pageingBtn"> << </button></li>
				  		<li><button class="pageingBtn"> < </button></li>
				  		<li><button class="pageingBtn"> 1 </button></li>
				  		<li><button class="pageingBtn"> 2 </button></li>
				  		<li><button class="pageingBtn"> > </button></li>
				  		<li<button class="pageingBtn"> >> </button>></li>
				  	</ul>
				  </nav>
				</div> <!-- end paging -->
			</section> <!-- end section -->
		</div> <!-- end column -->
	</div> <!-- end columns -->
</body>
</html>