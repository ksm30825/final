<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Interface</title>
<style>
	.field-label {
		margin-right:1.0rem !important;
	}
	#form {
		width:80% !important;
		margin:0 auto;
	}
</style>
</head>
<body>
	<jsp:include page="../common/mainNav.jsp"/>
	<div class="columns is-mobile">
		<div class="column">
			<section class="section" id="headerSection">
				<jsp:include page="../common/myPageHeader.jsp" />
			</section>	
			<section class="section" id="form">
				  <h3 class="title"> 계정 정보 수정 </h3>
			      <div class="field is-horizontal">
			        <div class="field-body">
				        <div class="field-label is-normal">
				          <label class="label">이름</label>
				        </div>
			          <div class="field is-grouped">
			            <p class="control is-expanded has-icons-left">
			              <input class="input" type="text" placeholder="Name">
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
			        <div class="field-label is-normal">
			          <label class="label">Department</label>
			        </div>
			        <div class="field-body">
			          <div class="field is-narrow">
			            <div class="control">
			              <div class="select is-fullwidth">
			                <select>
			                  <option>Business development</option>
			                  <option>Marketing</option>
			                  <option>Sales</option>
			                </select>
			              </div>
			            </div>
			          </div>
			        </div>
			      </div>
			      <div class="field is-horizontal">
			        <div class="field-label">
			          <label class="label">Already a member?</label>
			        </div>
			        <div class="field-body">
			          <div class="field is-narrow">
			            <div class="control">
			              <label class="radio">
			                <input type="radio" name="member"> Yes
			              </label>
              <label class="radio">
                <input type="radio" name="member"> No
              </label>
            </div>
          </div>
        </div>
      </div>
      <div class="field is-horizontal">
        <div class="field-label is-normal">
          <label class="label">Subject</label>
        </div>
        <div class="field-body">
          <div class="field">
            <div class="control">
              <input class="input is-danger" type="text" placeholder="e.g. Partnership opportunity">
            </div>
            <p class="help is-danger">
              This field is required
            </p>
          </div>
        </div>
      </div>
      <div class="field is-horizontal">
        <div class="field-label is-normal">
          <label class="label">Question</label>
        </div>
        <div class="field-body">
          <div class="field">
            <div class="control">
              <textarea class="textarea" placeholder="Explain how we can help you"></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="field is-horizontal">
        <div class="field-label">
          <!-- Left empty for spacing -->
        </div>
        <div class="field-body">
          <div class="field">
            <div class="control">
              <button class="button is-primary">
                Send message
              </button>
            </div>
          </div>
        </div>
      </div>
			</section>	
		</div>
	</div>
</body>
</html>