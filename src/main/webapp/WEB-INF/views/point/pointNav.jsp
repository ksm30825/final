<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#pointTB thead *{
		font-size:25px;
	}
	#pointTB tbody tr td:first-child{
		color:red;
	}
	#pointTB tbody tr td:last-child{
		color:green;
	}
</style>
</head>
<body>
	<%-- <jsp:include page="../common/mainNav.jsp"/>
	<jsp:include page="../common/myPageHeader.jsp"/> --%>
	<section class="tableSection">
	    <div class="container">
	    	<div class="pointHeader">
	    		<table id="pointTB"style="width:30%;margin-left:100px;">
				    <thead>
				    	<tr style="height:30px;">
					        <th style="border-right:1px solid lightgray;"> 포인트관리 </th>
					        <th colspan="2"> <a href="allRebate.po">&nbsp;&nbsp;&nbsp;수익금관리</a> </th>
					    </tr>
				    </thead>
				    <tbody>
				    	<tr>
				        	<td style="border-right:1px solid lightgray;"> 포인트 : 3,000P </td>
				        	<td colspan="2"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수익금 : 319,600</td>
				        </tr>
				    </tbody>
		  		</table>		  		
	    	</div>
	   	</div>
    </section>
    
</body>
</html>