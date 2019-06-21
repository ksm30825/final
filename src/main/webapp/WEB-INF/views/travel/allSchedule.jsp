<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.allSchTable {
		overflow-x:auto !important;
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
				<div style="border:1px solid gray; height:400px">
					<div id="mapWide" style="height:100%"></div>
				</div>
			</section>
			<section class="section">
				<table class="table is-bordered is-fullwidth is-striped allSchTable" align="center">
					<thead>
						<tr class="is-selected">
							<th width="200px">
								DAY1 &nbsp;&nbsp;
								<input class="input dayInput" type="text" placeholder="MEMO">
							</th>
							<th width="200px">
								DAY2&nbsp;&nbsp;
								<input class="input dayInput" type="text" placeholder="MEMO">
							</th>
							<th width="200px">
								DAY3&nbsp;&nbsp;
								<input class="input dayInput" type="text" placeholder="MEMO">
							</th>
							<th width="200px">
								DAY4&nbsp;&nbsp;
								<input class="input dayInput" type="text" placeholder="MEMO">
							</th>
							<th width="200px">
								DAY5&nbsp;&nbsp;
								<input class="input dayInput" type="text" placeholder="MEMO">
							</th>
						</tr>
					</thead>
					<tbody>
						<tr style="background:whitesmoke;">
							<td>2019-07-01</td>
							<td>2019-07-01</td>
							<td>2019-07-01</td>
							<td>2019-07-01</td>
							<td>2019-07-01</td>
						</tr>
						<tr>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
						</tr>
						<tr class="is-selected">
							<td>
								DAY6&nbsp;&nbsp;
								<input class="input dayInput" type="text" placeholder="MEMO">
							</td>
							<td>
								DAY7&nbsp;&nbsp;
								<input class="input dayInput" type="text" placeholder="MEMO">
							</td>
							<td>
								DAY8&nbsp;&nbsp;
								<input class="input dayInput" type="text" placeholder="MEMO">
							</td>
							<td>
								DAY9&nbsp;&nbsp;
								<input class="input dayInput" type="text" placeholder="MEMO">
							</td>
							<td>
								DAY10&nbsp;&nbsp;
								<input class="input dayInput" type="text" placeholder="MEMO">
							</td>
						</tr>
						<tr style="background:whitesmoke;">
							<td>2019-07-01</td>
							<td>2019-07-01</td>
							<td>2019-07-01</td>
							<td>2019-07-01</td>
							<td>2019-07-01</td>
						</tr>
						<tr>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
						</tr>
					</tbody>
				</table>
			</section>
		</div>
	</div>
</body>
</html>