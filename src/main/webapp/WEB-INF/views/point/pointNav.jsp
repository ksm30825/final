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
	<div class="tabs is-boxed"style="width:33%;margin-left:10px;">
		<ul style="border:none !important;">
			<li>
				<a href="pointMainView.po" class="pointNav">
					<span style="color:red;">&nbsp;<strong style="font-size:25px;">포인트관리</strong><br> 포인트 : 3,000P </span>
				</a>
			</li>
			<li>
				<a href="allRebate.po" class="rebateNav">
					<span style="color:green;">&nbsp;<strong style="font-size:25px;">수익금관리</strong><br>수익금 : 319,600</span>
				</a>
			</li>
		</ul>
    </div>
</body>
</html>