<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Interface</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
	.bg {
	  background-image: url(resources/images/loginBackgroundImgLarge.jpg);
	  background-position: center;
	  background-repeat: no-repeat;
	  background-size: cover;
	  min-height:700px;
	}
	#tabs {
		width:80%;
		margin:0 auto;
	}
	#form {
		width:50%;
		margin:0 auto;
		background-color: rgba( 0, 0, 0, 0.5 );
	}
	.colWhite {
		color:white !important;
	}
	.button.is-primary, .button.is-link{
	    width:100%;
	}
	.button.is-primary {
		background-color:#0066ff !important;
	}
	.button.is-link {
		background-color:#e6b800 !important;
	}
	.tabs.is-toggle li.is-active a {
		background-color: #9966ff !important;
		border-color: #9966ff !important;
	}
	#tabs > div > ul > li > a {
		color:#e0e0eb;
	}
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp" />
	<br><br>
	<div class="container bg">
		<section class="section" id="tabs">
			<div class="tabs is-toggle is-fullwidth is-large">
				<ul>
					<li class="is-active"><a onclick="showSignIn(this);">SIGN IN</a></li>
					<li><a onclick="showSignUp(this);">SIGN UP</a></li>
				</ul>
			</div> <!-- end tabs -->
		</section> <!-- end tabs section -->
		<section class="section" id="form">
		  <div class="columns">
		  <!-- signInArea -->
		    <div class="column" id="signInArea">
			      <div class="field">
			        <label class="label colWhite">이메일</label>
			        <p class="control has-icons-left has-icons-right">
			          <input class="input is-danger" type="text" placeholder="Email input" value="hello@" name="email" id="email">
			          <span class="icon is-small is-left">
			            <i class="fa fa-envelope"></i>
			          </span>
			          <span class="icon is-small is-right">
			            <i class="fa fa-warning"></i>
			          </span>
			        </p>
			      </div>
			      <div class="field">
			        <label class="label colWhite">비밀번호</label>
			        <p class="control has-icons-left has-icons-right">
			          <input class="input is-success" type="password" placeholder="Text input" value="bulma" name="userPwd" id="userPwd">
			          <span class="icon is-small is-left">
			            <i class="fa fa-lock"></i>
			          </span>
			          <span class="icon is-small is-right">
			            <i class="fa fa-check"></i>
			          </span>
			        </p>
			      </div>
			      <div class="field">
			      	<p class="control">
			      		<a style="color:white;" onclick="$('#modalPassword').toggleClass('is-active')">비밀번호를 잊어버리셨습니까?</a>
			      	</p>
			      </div>
		      
			      <div class="field">
			        <p class="control">
			          <button class="button is-primary"><b>SIGN IN</b></button>
			        </p>
			      </div>
			      <div class="field">
			        <p class="control">
			          <button class="button is-link"><b>카카오 계정으로 로그인</b></button>
			        </p>
			      </div>
		      </div>
		      <!-- end SignInArea -->
		      <!-- signUpArea -->
		      <div class="column" id="signUpArea">
			      <div class="field">
			        <label class="label colWhite">* 사용자 이름</label>
			        <p class="control has-icons-left has-icons-right">
			          <input class="input is-success" type="text" placeholder="Text input" value="bulma">
			          <span class="icon is-small is-left">
			            <i class="fa fa-user"></i>
			          </span>
			          <span class="icon is-small is-right">
			            <i class="fa fa-check"></i>
			          </span>
			        </p>
			      </div>
			      <div class="field">
			        <label class="label colWhite">* 이메일</label>
			        <p class="control has-icons-left has-icons-right">
			          <input class="input is-danger" type="text" placeholder="Email input" value="hello@">
			          <span class="icon is-small is-left">
			            <i class="fa fa-envelope"></i>
			          </span>
			          <span class="icon is-small is-right">
			            <i class="fa fa-check"></i>
			          </span>
			        </p>
			      </div>
			      <div class="field">
			        <label class="label colWhite">* 비밀번호</label>
			        <p class="control has-icons-left has-icons-right">
			          <input class="input is-success" type="password" placeholder="Text input" value="bulma" name="userPwd1">
			          <span class="icon is-small is-left">
			            <i class="fa fa-lock"></i>
			          </span>
			          <span class="icon is-small is-right">
			            <i class="fa fa-lock"></i>
			          </span>
			        </p>
			      </div>
			      <div class="field">
			        <label class="label colWhite">* 비밀번호 확인</label>
			        <p class="control has-icons-left has-icons-right">
			          <input class="input is-success" type="password" placeholder="Text input" value="bulma" name="userPwd2">
			          <span class="icon is-small is-left">
			            <i class="fa fa-lock"></i>
			          </span>
			          <span class="icon is-small is-right">
			            <i class="fa fa-lock"></i>
			          </span>
			        </p>
			        <p class="help is-success">비밀번호가 일치합니다.</p>
			      </div>
			      <div class="field">
			      	<label class="label colWhite">* 휴대폰 인증</label>
			      	<div class="field has-addons" style="width:100%;">
				          <input class="input" type="tel" placeholder="phone number">
				          <a class="button">본인 인증</a>
			      	</div>
			      </div>
			      <div class="field is-horizontal">
			      	<div class="field" style="margin-right:20px;">
				        <label class="label colWhite"> 성별 </label>
				          <span class="select">
				            <select>
				              <option>남자</option>
				              <option>여자</option>
				            </select>
				          </span>
			      	</div>
			      	<div class="field">			      	
				        <label class="label colWhite"> 생년월일 </label>
				        <input class="input is-danger" type="date" placeholder="birthday">
			      	</div>
			      </div>
			      <div class="field">
			        <p class="control">
			          <label class="checkbox">
			            <input type="checkbox" style="color:white;">
						<a>개인정보 처리 방침</a> 및 <a>구매 약관</a>, <a>홈페이지 약관</a>에 대해 동의합니다.
			          </label>
			        </p>
			      </div>
			      
			      <div class="field">
			        <p class="control">
			          <button class="button is-primary"><b>SIGN UP</b></button>
			        </p>
			      </div>
			  </div>
			  <!-- end signUpArea -->
		  </div>
      </section>
	</div> <!-- end container -->
	
	<jsp:include page="../common/footer.jsp"/>
	<jsp:include page="findPasswordModal.jsp"/>
	
	<!-- script -->
	<script>
		$(function(){
			$("#email").click(function(){
				$(this).select();
			});
			$("#userPwd").click(function(){
				$(this).select();
			});
			$("#signUpArea").css({
				"display":"none"
			});
		});
		//로그인 화면 보여주기용 함수
		function showSignIn(obj){
			$(obj).parent().attr("class", "is-active");
			$(obj).parent().parent().children().eq(1).removeClass();
			$("#signInArea").css({
				"display":"block"
			});
			$("#signUpArea").css({
				"display":"none"
			});
		}
		//회원가입 화면 보여주기용 함수
		function showSignUp(obj) {
			$(obj).parent().attr("class", "is-active");
			$(obj).parent().parent().children().eq(0).removeClass();
			$("#signInArea").css({
				"display":"none"
			});
			$("#signUpArea").css({
				"display":"block"
			});
		}
	</script>
	<!-- end script -->
</body>
</html>