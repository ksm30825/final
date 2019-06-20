<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Interface</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<style>
	#form {
		width:80% !important;
		margin:0 auto;
	}
	.field-label {
	    flex-basis: 0;
	    flex-grow: 0 !important;
	    flex-shrink: 0;
	    margin-right: 1.5rem;
	    text-align: right;
	}
	.label {
		width:100px;
		text-align:left;
	}
	.readonlyBg {
		background-color: #d9d9d9 !important;
	}
</style>
</head>
<body>
	<!-- main nav -->
	<jsp:include page="../common/mainNav.jsp"/>
	
	<div class="columns is-mobile">
		<div class="column">
			<!-- myPage nav -->
			<section class="section" id="headerSection">
				<jsp:include page="../common/myPageHeader.jsp" />
			</section>
			
			<!-- update member information form -->
			<section class="section" id="form"  style="border:1px solid gray;">
				  <h3 class="title"> 계정 정보 수정 </h3>
			      <hr style="border:1px solid gray; background-color:gray;">
			      
			      <!-- member name -->
			      <div class="field is-horizontal">
			        <div class="field-body">
				        <div class="field-label is-normal">
				          <label class="label">이름</label>
				        </div>
			          <div class="field is-grouped">
			            <p class="control is-expanded has-icons-left">
			              <input class="input" type="text" placeholder="Name" value="홍길동" style="border:1px solid gray;">
			              <span class="icon is-small is-left">
			                <i class="fa fa-user"></i>
			              </span>
			            </p>
			          </div>
			        </div>
			      </div> <!-- end member name -->
			      
			      <!-- member email -->
			      <div class="field is-horizontal">
			      	<div class="field-body">
			      		<div class="field-label is-normal">
			          		<label class="label">이메일</label>
			          	</div>
			          	<div class="field is-grouped">
				            <p class="control is-expanded has-icons-left has-icons-right">
				              <input class="input is-success" type="email" placeholder="Email" value="alex@smith.com" style="border-color:gray;">
				              <span class="icon is-small is-left">
				                <i class="fa fa-envelope"></i>
				              </span>
				            </p>
			          	</div>
			      	</div>
			      </div> <!-- end member email -->
			      
			      <!-- change member password btn -->
			      <div class="field is-horizontal">
			        <div class="field-body">
				        <div class="field-label is-normal">
				          <label class="label">비밀번호</label>
				        </div>
			          <div class="field is-grouped" style="flex-grow:1;">
			            <p class="control is-expanded has-icons-left has-icons-right">
			              <button class="button is-primary is-outlined" style="width:50%;"> 비밀번호 재설정 </button>
			               <span class="icon is-small is-left">
				              <i class="fas fa-mobile-alt"></i>
				           </span>
			            </p>
			          </div>
			        </div>
			      </div> <!-- end change member password btn -->
			      
			      <!-- member phone -->
			      <div class="field is-horizontal">
			        <div class="field-body">
				        <div class="field-label is-normal">
				          <label class="label">연락처</label>
				        </div>
			          <div class="field is-grouped">
			            <div class="field has-addons">
					        <p class="control">
					          <input class="input" type="text" placeholder="phone Number" value="010-1234-5678">
					        </p>
					        <p class="control">
					          <a class="button is-info">휴대폰 재인증</a>
					        </p>
					      </div>
				          <p class="help is-success" style="margin-left:10px; padding-top:6px;">인증 완료</p>
			          </div>
			        </div>
			      </div> <!-- end member phone -->
			      
			      <!-- member gender -->
			      <div class="field is-horizontal">
			        <div class="field-body">
			        	<div class="field-label is-normal">
				          <label class="label">성별</label>
				        </div>
				        <p class="control">
				          <label class="radio">
				            <input type="radio" name="question"> 여자
				          </label>
				          <label class="radio">
				            <input type="radio" name="question"> 남자
				          </label>
				        </p>
			        </div>
			      </div> <!-- end member gender -->
			      
			      <!-- member birthday -->
			      <div class="field is-horizontal">
			        <div class="field-body">
			        	<div class="field-label is-normal">
				          <label class="label">생년월일</label>
				        </div>
				        <p class="control">
				          <input class="input is-danger" type="date" placeholder="birthday" style="width:100%; border-color:gray;" value="1997-09-22">
				        </p>
			        </div>
			      </div> <!-- end member birthday -->
			      
			      <!-- change member account btn-->
			      <div class="field is-horizontal">
			      	<div class="field-body">
			      		<div class="field-label is-normal">
			          		<label class="label">계좌번호</label>
			          	</div>
			          	<div class="field is-grouped">
				            <p class="control is-expanded has-icons-left has-icons-right">
				              <a class="button is-primary is-outlined" style="width:50%;"> 사용자 계좌 재인증 </a>
					          <span class="icon is-small is-left">
					            <i class="fas fa-dollar-sign"></i>
					          </span>
				            </p>
			          	</div>
			      	</div>
			      </div>  <!-- end change member account btn -->
			     
			     <!-- member account -->
			      <div class="field is-horizontal">
			      	<div class="field-body">
			      		<div class="field">
					       <label class="label">예금주명</label>
					       <p class="control">
					         <input class="input readonlyBg" type="text" placeholder="Text input" value="홍길동" readonly>
					       </p>
					     </div>
					     <div class="field">
					       <label class="label">은행명</label>
					       <p class="control">
					         <input class="input readonlyBg" type="text" placeholder="Text input" value="기업은행" readonly>
					       </p>
					     </div>
					     <div class="field">
					       <label class="label">계좌번호</label>
					       <p class="control">
					         <input class="input readonlyBg" type="text" placeholder="Text input" value="110-****-1245" readonly>
					       </p>
					     </div>
			      	</div>
			      </div>
			      <!-- end member account -->
			      
			      <!-- drop out member and update member btn -->
			      <hr style="border:1px solid gray; background-color:gray;">
			      <div class="field is-horizontal">
			      	<div class="field-body">
			      		<a>회원 탈퇴 하시겠습니까? </a>
			      		<div class="field">
			    			<button class="button is-primary is-outlined" style="float:right;"> 변경 정보 저장 </button>
			      		</div>
			      	</div>
			      </div> <!-- end drop out member and update member btn -->
			      
			</section><!-- end update member information form -->	
		</div> <!-- end column -->
	</div> <!-- end columns -->
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>