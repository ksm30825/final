<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
	  <div class="modal" id="modalPassword">
	    <div class="modal-background"></div>
	    <div class="modal-card" align="right">
	    	<header class="is-right">
		        <button class="delete is-large is-right" onclick="closeModal();"></button>
	    	</header>
	      <section class="modal-card-body">
	        <div class="columns">
	        	<div class="column">
	        		<div class="field">
				        <label class="label">이메일</label>
				        <p class="control has-icons-left has-icons-right">
				          <input class="input is-danger" type="text" placeholder="Email input" value="hello@" name="email">
				          <span class="icon is-small is-left">
				            <i class="fa fa-envelope"></i>
				          </span>
				          <span class="icon is-small is-right">
				            <i class="fa fa-warning"></i>
				          </span>
				        </p>
				         <p>비밀번호 확인을 위한 이메일이 발송됩니다.</p>
				      </div>
	        	</div>
	        </div>
	      </section>
	      <footer class="modal-card-foot">
	        <a class="button is-primary">이메일 발송</a>
	        <a class="button" onclick="closeModal();">취소</a>
	      </footer>
	    </div>
	  </div>
	  
	  <script>
	  	//모달 닫기용 함수
	  	function closeModal() {
	  		$("#modalPassword").toggleClass('is-active');
	  	}
	  </script>
</body>