<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Interface</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
					<h3 class="subtitle is-3" style="color:#209cee;"> 여행지관리 </h3>
				</div>
				
				<!-- spot condition search -->
				<div class="field is-horizontal">
					<div class="field-body">
						<!-- condition button area 1 -->
						<div class="field buttons">
								<a class="button is-primary"> 전체 여행지 </a>
								<a class="button is-primary"> 등록 여행지 </a>
								<a class="button is-primary"> 삭제 여행지 </a>
						</div> <!-- end condition button area 1 -->
						
						<!-- condition keyword -->
						<div class="field has-addons" style="justify-content: flex-end;">
					      <p class="control">
					        <span class="select">
					          <select>
					            <option>국가명</option>
					            <option>도시명</option>
					            <option>명소명</option>
					          </select>
					       </span>
					      </p>
					      <p class="control">
					        <input class="input" type="text" placeholder="Search Spot">
					      </p>
					      <p class="control">
					        <a class="button"><i class="fas fa-search"></i></a>
					      </p>
					    </div>
					</div><!-- end condition keyword -->
				</div> <!-- end spot condition search -->
				
				<!-- page forward btn -->
				<div class="field is-horizontal">
					<div class="field-body">
						<div class="field is-grouped" style="justify-content: flex-end;">
							<div class="field-label is-normal">
					          <label class="label">여행지</label>
					        </div>
					        <div class="buttons">
					        	<div class="navbar-item has-dropdown is-hoverable">
					               <a class="navbar-link button is-rounded" href="#" style="background-color:#ffcc00; border-color:#ffcc00;"> <strong>여행지 추가</strong> </a>
					               <div class="navbar-dropdown" style="background-color:#ffcc00; border-color:#ffcc00;">
					                  <a class="navbar-item subnav" onclick="$('#modalAddExcelSpot').toggleClass('is-active')"> 엑셀로 추가 </a> 
					                  <a class="navbar-item subnav" href="showInserOneSpot.sp"> 입력폼으로 추가 </a>
					               </div>
					            </div>
					        	<a class="button is-danger is-rounded">여행지 삭제</a>
					        	<a class="button is-link is-rounded">여행지 복구</a>
					        </div>
				        </div>
					</div>
				</div><!-- end page forward brn -->
				
				<!-- spot list -->
				<div class="field">
					<table id="memberListTB" class="table is-narrow"style="width:100%;height:100%; margin:0 auto;" >
						<thead>
							<tr style="background:#ccccff;">
								<th width="5%"><input type="checkbox"></th>
								<th width="10%"> 국가/도시 </th>
								<th width="10%"> 명소명 </th>
								<th width="10%"> 상세주소 </th>
								<th width="10%"> 등록일 </th>
								<th width="10%"> 수정일 </th>
								<th width="10%"> 삭제일 </th>
								<th width="10%"> 복구일 </th>
								<th width="10%"> 명소유형 </th>
							</tr>
						</thead>
						<tbody>
							<tr onclick="location.href='selectSpotInfoAdmin.sp'">
								<td><input type="checkbox"></td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
								<td>test</td>
							</tr>
						</tbody>
					</table>
				</div> <!-- end spot list -->
				
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
	
	<jsp:include page="adminAddExcelSpotModal.jsp"/>
	
</body>
</html>