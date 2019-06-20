<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Travel Interface</title>
<link rel="stylesheet" href="resources/css/bulmaswatch.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/semantic.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.theme.min.css">
<link rel="stylesheet" href="resources/css/jquery-ui.structure.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/semantic.min.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
<style>
	.navbar-item img {
    	max-height: 100% !important;
   	}
   	.select:not(.is-multiple):not(.is-loading)::after {
   		border-color:purple;
   	}
   	#cityPlusBtn:hover {
   		cursor:pointer;
   	}
   
</style>
</head>
<body>
	<c:set var = "contextPath" value = "${pageContext.servletContext.contextPath }" scope = "application"/>
	<nav class="navbar is-white is-fixed-top" style="border-bottom:1px solid skyblue;">
    	<div class="navbar-brand">
        	<a class="navbar-item" href="index.jsp"> 
            	<img src="resources/images/logoWide.png" width="120px">
         	</a>
         	<div class="navbar-item is-hidden-tablet">
         		<div class="field is-grouped">
         			<p class="control">
         				<a id="chatBtn" class="button is-rounded" onclick="showPopup()"> 
                        	<i class="fas fa-comments"></i>
                        	<span>동행찾기</span>
                     	</a>
            		</p>
            		<p class="control">
                     	<a class="button is-info is-rounded" href="loginForm.me"> 
                        	<span class="icon"><i class="fa fa-user"></i></span> 
                        	<span>LOG IN</span>
                    	</a>
                  	</p> 
            	</div>
         	</div>
            <div class="navbar-burger burger is-hidden-tablet" data-target="mainNav">

               	<span></span> <span></span> <span></span>
           	</div>
		</div>
      	<div id="mainNav" class="navbar-menu">
         	<div class="navbar-start">
            	<a class="navbar-item" href="#" 
            		data-target="#newTravelModal" onclick="$('#travelInfoModal').toggleClass('is-active')"> 
            		<strong>일정만들기</strong> 
            	</a>
            	<a class="navbar-item" href="travelList.tb"> <strong>여행일정</strong> </a>
            	<div class="navbar-item has-dropdown is-hoverable">
               		<a class="navbar-link " href="#"> <strong>여행지</strong> </a>
               		<div class="navbar-dropdown ">
                  		<a class="navbar-item " href="#"> 주요도시 </a> 
                  		<a class="navbar-item " href="#"> 아시아 </a> 
                  		<a class="navbar-item " href="#"> 유럽 </a> 
                  		<a class="navbar-item " href="#"> 남태평양 </a> 
                  		<a class="navbar-item " href="#"> 북미 </a> 
                  		<a class="navbar-item " href="#"> 중남미 </a> 
                  	<!-- <hr class="navbar-divider">
                  	<div class="navbar-item">
                     	<div>
                        	이건모지
                        	<p class="has-text-info is-size-6-desktop">???</p>
                     	</div>
                  	</div> -->
              		</div>
				</div>
            	<a class="navbar-item" href="travelRequest.tr"> <strong>여행의뢰</strong> </a>
            	<a class="navbar-item " href="noticeList.cc"> <strong>고객센터</strong> </a>
              <!--임시-->
              <a class="navbar-item " href="myPageMain.me"> <strong>임시 마이페이지</strong> </a>
              <a class="navbar-item " href="aPayment.ad"> <strong>임시 관리자페이지</strong> </a>
			</div>
        	<div class="navbar-end is-hidden-mobile">
            	<div class="navbar-item">
            		<div class="field is-grouped">
                  		<p class="control">
                     		<a id="chatBtn" class="button is-rounded" onclick="showPopup()"> 
                        		<i class="fas fa-comments"></i>
                        		<span>동행찾기</span>
                     		</a>
                  		</p>
                  		<p class="control">
                     		<a class="button is-info is-rounded" href="loginForm.me"> 
                        		<span class="icon"><i class="fa fa-user"></i></span> 
                        		<span>LOG IN</span>
                    		</a>
                  		</p>
            		</div>
				</div>
			</div>
		</div>
	</nav>

   	<br><br>

  
   	<jsp:include page="../travel/travelInfoModal.jsp" />
	

	<script>
        $(function() {
			var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
	        if ($navbarBurgers.length > 0) {
				$navbarBurgers.forEach(function ($el) {
	            	$el.addEventListener('click', function() {
	                 	var target = $el.dataset.target;
	                 	var $target = document.getElementById(target);
	                 	$el.classList.toggle('is-active');
	                 	$target.classList.toggle('is-active');
					});
	          	});
	        }
        });
		function showPopup(){
       		window.open("${contextPath}/openCompanion.ch", "a", "width=400, height=700, left=100, top=50");        	
        }
   </script>
</body>
</html>