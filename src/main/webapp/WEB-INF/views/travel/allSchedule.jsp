<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.allSchTable {
		overflow-x:scroll !important;
	}
	.allSchTable td, .allSchTable th{
		text-align:center;
	}
	.dayInput {
		width:70%;
	}
	
</style>
</head>
<body>
	<div class="columns">
		<div class="column">
			<section class="section">
				<div style="border:1px solid gray; height:500px">
					<div id="mapWide" style="height:100%"></div>
				</div>
			</section>
			<section class="section">
				<div class="columns is-multiline">
					<c:forEach var="trvDay" items="${ trvDayList }" varStatus="st">
						<div class="column is-one-fifth" style="padding: 10.5px 0">
							<nav class="panel">
								<div class="panel-heading" align="center"
									style="background: whitesmoke; color: black; height: 30px">
									<p class="help">${ trvDay.dayDate }</p>
								</div>
								<div class="panel-heading" align="center" style="margin: 0">
									<span>DAY ${ trvDay.dayNumber }</span>&nbsp; 
									<input class="input dayMemo is-small" type="text" placeholder="MEMO"
										value="${ trvDay.dayMemo }">
								</div>
								<!-- <label class="panel-block"><input type="checkbox">시간 보이기</label> -->
								<ul class="connectedSortable menu-list"
									style="background: white">
									<% for (int i = 1; i <= 5; i++) { %>
									<li class="ui-state-default panel-block">
										<div class="media-left">
											<span class="icon schInfoBtn"><i class="fas fa-edit"></i></span>
										</div>
										<div class="media-content">
											<p>Item<%=i%></p>
										</div>
										<div class="media-right">
											<button class="delete" aria-label="close"></button>
										</div>
									</li>
									<% } %>
								</ul>
							</nav>
						</div>
					</c:forEach>
				</div>

			</section>
		</div>
	</div>
</body>
</html>