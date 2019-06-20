<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Travel Interface</title>
<link rel="stylesheet" href="resources/css/bulmaswatch.min.css">
<link rel="stylesheet" type="text/css" href="/ti/resources/css/semantic.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<style>
   .navbar-item img {
       max-height: 100% !important;
   }
   /* .navbar-menu>.navbar-start>.navbar-item {
   	display:inline-block !important;
   } */
   
</style>

</head>
<body>
   <nav class="navbar is-info is-fixed-top" style="border-bottom:1px solid skyblue">
      <div class="navbar-brand">
         <a class="navbar-item" href="index.jsp"> 
            <img src="resources/images/logo1.png" width="70px" height="70px">
         </a>
         <a class="navbar-item is-hidden-tablet button is-rounded" href="#" target="_blank"> 
            <span class="icon"> 
               <i class="fas fa-comments"></i>
            </span>
            <span>동행찾기</span>
         </a> 
            <a class="navbar-item is-hidden-tablet button is-info is-rounded" href="#" target="_blank"> 
               <span class="icon"> 
                  <i class="fa fa-user"></i>
               </span>
               <span>LOG IN</span>
            </a>
            <div class="navbar-burger burger is-hidden-tablet" data-target="mainNav">
               <span></span> <span></span> <span></span>
            </div>
      </div>
      <div id="mainNav" class="navbar-menu">
         <div class="navbar-start">
            <a class="navbar-item is-active" href="adminMemberListForm.me"> <strong>회원관리</strong> </a> <!-- href 경로수정(세령) -->
            <div class="navbar-item has-dropdown is-hoverable">
	            <a class="navbar-link" href="#"> <strong>고객센터관리</strong> </a>
	            <div class="navbar-dropdown ">
	                  <a class="navbar-item " href="adminNoticeList.ad"> 공지사항 </a> 
	                  <a class="navbar-item " href="adminMoreQuestionList.ad"> 자주묻는 질문 </a>
	                  <a class="navbar-item " href="oneToOneList.ad"> 1:1 문의 </a> 
	            </div>
	        </div>
            <div class="navbar-item has-dropdown is-hoverable">
               <a class="navbar-link " href="#"> <strong>게시판관리</strong> </a>
               <div class="navbar-dropdown ">
                  <a class="navbar-item " href="noticeControlList.ad"> 게시판 </a> 
                  <a class="navbar-item " href="#"> 여행지 </a> 
               </div>
            </div>
            <a class="navbar-item" href="reportControlList.ad"> <strong>신고관리</strong> </a>
            <div class="navbar-item has-dropdown is-hoverable">
           		<a class="navbar-link " href="#"> <strong>정산관리</strong> </a>
           		<div class="navbar-dropdown ">
                  <a class="navbar-item " href="aPayment.ad"> 결제 내역 관리 </a> 
                  <a class="navbar-item " href="allAdPoint.po"> 포인트 내역 관리 </a>
                  	<a class="navbar-item" href="allAdRefund.po" style="font-size:0.8em;margin-left:7%;" > 환불 관리</a>
                  <a class="navbar-item " href="allAdProceeds.po"> 수익금 내역 관리 </a>
                  	<a class="navbar-item" href="allAdRebate.po" style="font-size:0.8em;margin-left:7%;" > 환급 관리</a> 
                </div>
          	</div>
            <a class="navbar-item " href="#"> <strong>통계관리</strong> </a>
         </div>
         <div class="navbar-end">
            
            <div class="navbar-item">
               <div class="field is-grouped">
                  <p class="control">
                     <a class="button is-info is-rounded" href="#"> 
                        <span class="icon"><i class="fa fa-user"></i></span> 
                        <span>LOG OUT</span>
                     </a>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </nav>
   <br><br><br><br><br>
   
   <!-- 본문 -->
   <!-- <section class="section">
      <div class="container">
         <h1 class="title">안녕하세요</h1>
         <p class="subtitle">
             <strong>Travel Interface</strong>템플릿 테스트입니다.
         </p>
      </div>
   </section>
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> -->


   <script>
      // Get all "navbar-burger" elements
        var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

        // Check if there are any nav burgers
        if ($navbarBurgers.length > 0) {

          // Add a click event on each of them
          $navbarBurgers.forEach(function ($el) {
              $el.addEventListener('click', () => {

                 //Get the target from the "data-target" attribute
                 var target = $el.dataset.target;
                 var $target = document.getElementById(target);

                 // Toggle the class on both the "navbar-burger" and the "navbar-menu"
                 $el.classList.toggle('is-active');
                 $target.classList.toggle('is-active');

               });
          });
        }
   </script>
</body>
</html>