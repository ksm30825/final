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
	#aPayTB *{
		text-align:center;
	}
</style>
</head>
<body>
	<jsp:include page="../common/adminMainNav.jsp"/>
	<section class="section">
      <div class="container" style="width:90%;height:100%;">
         <div style="width:100%;font-size:25px;color:#209cee;">결제내역</div>
         <div style="width:100%;height:100%;">
         	<div>
         		<div class="field has-addons" style="width:550px;float:right;">
					<p class="control">
						<a class="button is-primary" style="width:40px;height:20px;">
							<i class='fas fa-search' style='font-size:15px'></i>
						</a>
					</p>
					<p class="control">
						<input class="input" type="text" placeholder="회원ID를 검색하세요" style="width:150px;height:20px;">
					</p>
					<input type="date" class="input is-primary" style="width:140px;height:20px;margin-left:1%;">
					<i class='far fa-calendar-alt' style='font-size:20px;color:purple;margin-right:1%;'></i>~
					<input type="date" class="input is-primary" style="width:140px;height:20px;margin-left:1%;">
					<i class='far fa-calendar-alt' style='font-size:20px;color:purple;'></i>
				</div>
			</div>
         	<div style="width:100%;height:25px;"> </div>
         </div>
         <div style="width:100%;height:100%;" id="aPayArea">
			<table id="aPayTB" class="table is-narrow" align="center"style="width:100%;height:100%;" >
				<thead>
					<tr style="background:#ccccff;">
						<th width="10%"> No. </th>
						<th width="30%"> 닉네임 </th>
						<th width="30%"> 결제일 </th>
						<th width="30%"> 결제액 </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> 1 </td>
						<td> user01 </td>
						<td> 19.06.13 </td>
						<td> 4,000 </td>
					</tr>
					<tr>
						<td> 2 </td>
						<td> user01 </td>
						<td> 19.06.03 </td>
						<td> 50,000 </td>
					</tr>
					<tr>
						<td> 3 </td>
						<td> user01 </td>
						<td> 19.05.03 </td>
						<td> 5,000 </td>
					</tr>
					<tr>
						<td> 4 </td>
						<td> user02 </td>
						<td> 19.05.03 </td>
						<td> 3,000 </td>
					</tr>
					<tr>
						<td> 5 </td>
						<td> user03 </td>
						<td> 19.04.03 </td>
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
</body>
</html>