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
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp"/> <br><br>
	<div class="columns">
		<div class="column">
			<section class="section" id="headerSection">
				<jsp:include page="../common/myPageHeader.jsp" />
			</section>	
			<section class="section" id="form">
				  <h3 class="title"> 계정 정보 수정 </h3>
			      <hr style="border:1px solid gray;">
			      <div class="field is-horizontal">
			        <div class="field-body">
				        <div class="field-label is-normal">
				          <label class="label">이름</label>
				        </div>
			          <div class="field is-grouped">
			            <p class="control is-expanded has-icons-left">
			              <input class="input" type="text" placeholder="Name" value="홍길동" style="border:1px solid gray">
			              <span class="icon is-small is-left">
			                <i class="fa fa-user"></i>
			              </span>
			            </p>
			          </div>
			          	<div class="field-label is-normal">
			          		<label class="label">이메일</label>
			          	</div>
			          	<div class="field is-grouped">
				            <p class="control is-expanded has-icons-left has-icons-right">
				              <input class="input is-success" type="email" placeholder="Email" value="alex@smith.com">
				              <span class="icon is-small is-left">
				                <i class="fa fa-envelope"></i>
				              </span>
				              <span class="icon is-small is-right">
				                <i class="fa fa-check"></i>
				              </span>
				            </p>
			          	</div>
			        </div>
			      </div>
			      <div class="field is-horizontal">
			        <div class="field-body">
				        <div class="field-label is-normal">
				          <label class="label">비밀번호</label>
				        </div>
			          <div class="field is-grouped">
			            <p class="control is-expanded has-icons-left has-icons-right">
			              <a class="button is-primary is-outlined" style="width:100%;"> 비밀번호 재설정 </a>
			               <span class="icon is-small is-left">
				              <i class="fas fa-mobile-alt"></i>
				           </span>
			            </p>
			          </div>
			          	<div class="field-label is-normal">
			          		<label class="label">계좌번호</label>
			          	</div>
			          	<div class="field is-grouped">
				            <p class="control is-expanded has-icons-left has-icons-right">
				              <a class="button is-primary is-outlined" style="width:100%;"> 사용자 계좌 재인증 </a>
					          <span class="icon is-small is-left">
					            <i class="fas fa-dollar-sign"></i>
					          </span>
				            </p>
			          	</div>
			        </div>
			      </div>
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
			          </div>
			        </div>
			      </div>	     
			</section>	
		</div>
	</div>
</body>
</html>