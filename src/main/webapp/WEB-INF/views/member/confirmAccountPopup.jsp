<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
	  <div class="modal" id="modalConfirmAcc">
	    <div class="modal-background"></div>
	    <div class="modal-card">
	      <header class="modal-card-head">
	        <p class="modal-card-title" style="padding-top:20px;">비밀번호 재설정</p>
	        <button class="delete is-large" onclick="closeModal();"></button>
	      </header>
	      <section class="modal-card-body">
	        <div class="columns">
	        	<div class="column">
	        	
	        		<!-- now password -->
	        		<div class="field is-horizontal">
	        			<div class="field-body">
	        				<div class="field">
				          		<label class="label">실명</label>
					            <p class="control has-icons-left has-icons-right">
						          <input class="input is-success" type="password" placeholder="Text input" style="border-color:gray;">
						        </p>
	        				</div>
	        				<div class="field">
	        					<label class="label">은행명</label>
					            <div class="select is-fullwidth">
					                <select>
					                  <option>기업은행</option>
					                  <option>우리은행</option>
					                  <option>신한은행</option>
					                </select>
					              </div>
	        				</div>
	        			</div>
				     </div> <!-- end now password -->
				     
				     <!-- change password 1 -->
				     <div class="field is-horizontal">
				     	<div class="field-label is-normal">
			          		<label class="label">변경 비밀번호</label>
			          	</div>
			          	<div class="field is-grouped">
				            <p class="control has-icons-left has-icons-right">
					          <input class="input is-success" type="password" placeholder="Text input" style="border-color:gray;">
					          <span class="icon is-small is-left">
					            <i class="fa fa-lock"></i>
					          </span>
					        </p>
			          	</div> 
				     </div> <!-- change password 1 -->
				     
				     <!-- change password 2 -->
				     <div class="field is-horizontal">
				     	<div class="field-label is-normal">
			          		<label class="label">비밀번호 확인</label>
			          	</div>
			          	<div class="field is-grouped">
				            <p class="control has-icons-left has-icons-right">
					          <input class="input is-success" type="password" placeholder="Text input" style="border-color:gray;">
					          <span class="icon is-small is-left">
					            <i class="fa fa-lock"></i>
					          </span>
					        </p>
					         <p class="help is-success" style="margin-left:10px; padding-top:6px;">일치합니다.</p>
			          	</div> 
				     </div> <!-- change password 2 -->
				     
	        	</div> <!-- end column -->
	        </div> <!-- end columns -->
	      </section>
	      <footer class="modal-card-foot" style="justify-content:flex-end;">
	        <a class="button is-primary">비밀번호 변경하기</a>
	        <a class="button" onclick="closeModal();">취소</a>
	      </footer>
	    </div>
	  </div>
	  
	  <script>
	  	//모달 닫기용 함수
	  	function closeModal() {
	  		$("#modalConfirmAcc").toggleClass('is-active');
	  	}
	  </script>
</body>