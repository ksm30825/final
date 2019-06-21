<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.column .columns {
		margin:0 !important;
	}
	.statisticsArea {
		width: 100%;
		height: 100%;
		background: lightgray;
	}
</style>
<body>
	<jsp:include page="../../common/adminMainNav.jsp"/>
	
	<div class="columns is-mobile">
		<div class="column">
			<section class="section" id="headerSection">
				<jsp:include page="adminStatisticsNav.jsp" />
			</section>
			<section class="section" id="bredcrumbSection" style="padding-top:0; padding-bottom:0">
				<p class="title is-3">통계 - 회원</p>
			</section>
			<section class="section" id="cardSection">
				<div class="columns">
					
					
					<div class="statisticsArea" >
						<p>그래프</p>		
						<p>넣을</p>	
						<p>예</p>	
						<p>정</p>				
					</div>
					
				</div>
			</section>
		
		</div>
	</div>
	
</body>
</html>