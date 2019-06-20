<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.input {
		width:80% !important;
	}
	.table td, .table th {
		text-align:center;
	}
</style>
</head>
<body>
	<div class="columns">
		<div class="column">
			<section class="section">
				<nav class="level">
					<div class="level-right has-text-centered">
						<div>
							<p class="subtitle is-4"><strong>전체 예산</strong></p>
						</div>
					</div>
					<div class="level-item has-text-centered">
						<div>
							<p class="heading">TOTAL</p>
							<p class="title is-5">
								<span class="icon is-medium">
									<i class="fas fa-won-sign"></i>
								</span>
								<input class="input is-primary" placeholder="원화 총액">
							</p>
						</div>
					</div>
					<div class="level-item has-text-centered">
						<div>
							<p class="heading">TOTAL</p>
							<p class="title is-5">
								<span class="icon is-medium">
									<i class="fas fa-dollar-sign"></i>
								</span>
								<input class="input is-primary" placeholder="현지화 총액">
							</p>
						</div>
					</div>
				</nav>
			</section>
			<section class="section" style="padding-top:0">
				<table class="table is-bordered is-fullwidth is-striped" align="center">
					<thead>
						<tr class="is-selected">
							<th width="12%">
								<i class="fas fa-3x fa-bed"></i>
								<span>숙박</span>
							</th>
							<th width="12%">
								<i class="fas fa-3x fa-taxi"></i>
								<span>교통</span>
							</th>
							<th width="12%">
								<i class="fas fa-3x fa-utensils"></i>
								<span>식비</span>
							</th>
							<th width="12%">
								<i class="fas fa-3x fa-shopping-bag"></i>
								<span>쇼핑</span>
							</th>
							<th width="12%">
								<i class="fab fa-3x fa-tripadvisor"></i>
								<span>관광</span>
							</th>
							<th width="12%">
								<span>. . .</span>
							</th>
							<th width="14%">
								<span>TOTAL</span>
							</th>
							<th width="14%">
								<span>BALANCE</span>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>50,000 원</td>
							<td>50,000 원</td>
							<td>50,000 원</td>
							<td>50,000 원</td>
							<td>50,000 원</td>
							<td>50,000 원</td>
							<td>300,000 원</td>
							<td>50,000 원</td>
						</tr>
						<tr>
							<td>50 AUD</td>
							<td>50 AUD</td>
							<td>50 AUD</td>
							<td>50 AUD</td>
							<td>50 AUD</td>
							<td>50 AUD</td>
							<td>300 AUD</td>
							<td>50 AUD</td>
						</tr>
					</tbody>
				</table>
			</section>
		</div>
	</div>	
</body>
</html>