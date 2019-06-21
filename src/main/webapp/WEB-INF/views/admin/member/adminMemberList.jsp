<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Interface</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
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
				<div class="field is-horizontal">
					<div class="field-body">
						<!-- condition button area 1 -->
						<div class="field buttons">
								<a class="button is-primary"> 전체회원 </a>
								<a class="button is-primary"> 가입회원 </a>
								<a class="button is-primary"> 탈퇴회원 </a>
						</div> <!-- end condition button area 1 -->
						
						<!-- condition keyword -->
						<div class="field has-addons" style="justify-content: flex-end;">
					      <p class="control">
					        <span class="select">
					          <select>
					            <option>이름</option>
					            <option>이메일</option>
					            <option>연락처</option>
					          </select>
					       </span>
					      </p>
					      <p class="control">
					        <input class="input" type="text" placeholder="Search Member">
					      </p>
					      <p class="control">
					        <a class="button"><i class="fas fa-search"></i></a>
					      </p>
					    </div>
					</div><!-- end condition keyword -->
				</div> <!-- end member condition search -->
				
				<!-- page forward btn -->
				<div class="field is-horizontal">
					<div class="field-body">
						<label class="label">전체회원 수 : 100명</label>
						<div class="field is-grouped" style="justify-content: flex-end;">
							<div class="field-label is-normal">
					          <label class="label">상세보기</label>
					        </div>
					        <div class="buttons">
					        	<a class="button is-rounded" style="background-color:yellow; border-color:yellow;">게시글 내역</a>
					        	<a class="button is-info is-rounded">결제 내역</a>
					        	<a class="button is-danger is-rounded">신고 내역</a>
					        	<a class="button is-link is-rounded">문의 내역</a>
					        </div>
				        </div>
					</div>
				</div><!-- end page forward brn -->
				
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
				  	<ul class="pagination-list" style="justify-content: center;">
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