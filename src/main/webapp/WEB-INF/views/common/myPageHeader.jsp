<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>myPageHeader</title>
<style>
	.tabs.is-toggle li.is-active a {
    	background-color: skyblue;
    	border-color: skyblue;
    	color: #fff;
    	z-index: 1;
	}
	.tabs li.is-active a {
    	border-bottom-color: skyblue;
    	background:skyblue;
    	color: black;
	}
	.tabs {
		padding:0;
	}
	.myHead {
		font-size:15px;
	}
	@media screen and (max-width: 788px) {
	.tabs span {
		font-size:8px;
	}
	.myHead {
		font-size:8px;
	}}
	.tabs {
		white-space:normal !important;
	}
	.tabs li.is-active a {
		background:skyblue !important;
		color:white !important;
		border-color:skyblue !important;
		border-radious:5px !important;
	}
	#userEditBtn:hover {
		cursor:pointer;
	}
</style>

</head>
<body>
	<div class="columns is-multiline is-mobile is-vcentered" >
		<div class="column is-full-mobile" >
			<span class="icon is-large has-text-info" id="userEditBtn" data-tooltip="회원정보 수정" onclick="location.href='updateMemberForm.me'">
				<i class="fas fa-3x fa-user-edit"></i>
			</span>&nbsp;&nbsp;
			<span class="title is-3">홍길동</span>
			<span class="icon has-text-danger">
				<i class="fab fa-product-hunt"></i>
			</span>
			<span style="color:red">3000</span>
			<span class="icon" style="margin-left:135px;">
            	<i class='fab fa-maxcdn' style="color:green;"></i>
         	</span>
         	<span style="color:green">319,600</span><br>			
		</div>
		<div class="column is-one-third-mobile" >
			<span class="icon is-medium has-text-primary">
				<i class="fas fa-2x fa-plane"></i>
			</span>
			<span class="subtitle myHead">등록한 여행일정</span>
			<span class="title myHead">0</span>
		</div>
		<div class="column is-one-third-mobile" >
			<span class="icon is-medium has-text-primary">
				<i class="fab fa-2x fa-gratipay"></i>
			</span>
			<span class="subtitle myHead">좋아요 받은 수</span>
			<span class="title myHead">0</span>
		</div>
		<div class="column is-one-third-mobile" >
			<span class="icon is-medium has-text-primary">
				<i class="fas fa-2x fa-crown"></i>
			</span>
			<span class="subtitle myHead">내 글 구매 수</span>
			<span class="title myHead">0</span>
		</div>
	</div>
	<br>
	<div class="tabs is-boxed column" >
	    <ul>
	      <li class="is-active">
	        <a href="#">
	          <span class="icon"><i class="fas fa-plane"></i></span>
	          <span>나의 일정</span>
	        </a>
	      </li>
	      <li>
	        <a href="#">
	          <span class="icon"><i class="fas fa-shopping-basket"></i></span>
	          <span>구매한 일정</span>
	        </a>
	      </li>
	      <li>
	        <a href="#">
	          <span class="icon"><i class="far fa-heart"></i></span>
	          <span>좋아요 목록</span>
	        </a>
	      </li>
	      <li>
	        <a href="requestList.mp;">
	          <span class="icon"><i class="fas fa-award"></i></span>
	          <span>여행 의뢰</span>
	        </a>
	      </li>
	      <li>
	        <a>
	          <span class="icon"><i class="fas fa-coins"></i></span>
	          <span>포인트/수익금</span>
	        </a>
	      </li>
	      <li>
	        <a href="paneltyList.pe">
	          <span class="icon"><i class="far fa-question-circle"></i></span>
	          <span>나의 문의</span>
	        </a>
	      </li>
	    </ul>
 	</div>
</body>
</html>