<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
	<form action="mailSend.me" method="post">	
	  <div class="modal" id="modalPassword">
	    <div class="modal-background"></div>
	    <div class="modal-card">
	      <header class="modal-card-head">
	        <p class="modal-card-title" style="padding-top:20px;">비밀번호 찾기</p>
	        <button class="delete is-large" onclick="return closeModal();"></button>
	      </header>
	      <section class="modal-card-body">
	        <div class="columns">
	        	<div class="column">
	        	
	        		<!-- now password -->
	        		<div class="field is-horizontal">
		          		<label class="label is-normal" style="width: 100px;">이메일</label>
			          	<div class="field is-grouped" style="width: 100%;">
				            <p class="control has-icons-left has-icons-right" style="width: 100%;">
					          <input class="input is-success" type="text" name="email"
					          		 placeholder="user email" style="border-color:gray; width: 100%;">
					          <span class="icon is-small is-left">
					            <i class="fa fa-lock"></i>
					          </span>
					        </p>
					        
			          	</div> 
				     </div> <!-- end now password -->
				     
				     <p style="color: green;">비밀번호 변경을 위한 이메일이 발송됩니다.</p>
	        	</div> <!-- end column -->
	        </div> <!-- end columns -->
	      </section>
	      <footer class="modal-card-foot" style="justify-content:flex-end;">
	        <button class="button is-primary" type="submit">이메일 전송</button>
	        <a class="button" onclick="return closeModal();">취소</a>
	      </footer>
	    </div>
	  </div>
	</form>
	  
	  <script>
	  	//모달 닫기용 함수
	  	function closeModal() {
	  		$("#modalPassword").toggleClass('is-active');
	  		return false;
	  	}
	  </script>
</body>