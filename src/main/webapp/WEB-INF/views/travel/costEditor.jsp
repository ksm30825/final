<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.budgetInput {
		width:80% !important;
	}
	.table td, .table th {
		text-align:center;
	}
	.panelTr>td {
		padding:0;
	}
</style>
</head>
<body>
	<div class="columns">
		<div class="column">
			<section class="section">
				<nav class="level">
					<div class="level-item has-text-centered">
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
								<input class="input is-primary budgetInput" placeholder="원화 총액">
							</p>
						</div>
					</div>
					<div class="level-item has-text-centered"><div><p class="title is-1">=</p></div></div>
					<div class="level-item has-text-centered">
						<div>
							<p class="heading">TOTAL</p>
							<p class="title is-5">
								<span class="icon is-medium">
									<i class="fas fa-dollar-sign"></i>
								</span>
								<input class="input is-primary budgetInput" placeholder="현지화 총액">
							</p>
						</div>
					</div>
					<div class="level-item has-text-centered"><div></div></div>
				</nav>
			</section>
			<section class="section" style="padding-top:0">
				<table class="table is-bordered is-fullwidth is-striped" align="center">
					<thead>
						<tr class="is-selected" style="background:skyblue">
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
								<i class="fas fa-3x fa-ellipsis-h"></i>
								<span>기타</span>
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
			<section class="section">
				<div class="columns is-multiline">
					<% for(int i = 0; i < 10; i++) { %>
					<div class="column is-one-fifth" style="padding:10.5px 0">
						<nav class="panel">
							<div class="panel-heading" align="center"
								style="background: whitesmoke; color: black; height: 30px">
								<p class="help">2019-07-01</p>
							</div>
							<div class="panel-heading" align="center" style="margin:0;">
								DAY 1
							</div>
							<!-- <label class="panel-block"><input type="checkbox">시간 보이기</label> -->
							<ul class="connectedSortable menu-list">
								<li class="ui-state-default panel-block">
									<div class="media-left">
										<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
										</span>
									</div>
									<div class="media-content">
										<p>Item 1</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-left">
										<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
										</span>
									</div>
									<div class="media-content">
										<p>Item 2</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-left">
										<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
										</span>
									</div>
									<div class="media-content">
										<p>Item 3</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-left">
										<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
										</span>
									</div>
									<div class="media-content">
										<p>Item 4</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>
									</div>
								</li>
								<li class="ui-state-default panel-block">
									<div class="media-left">
										<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
										</span>
									</div>
									<div class="media-content">
										<p>Item 5</p>
									</div>
									<div class="media-right">
										<button class="delete" aria-label="close"></button>
									</div>
								</li>
							</ul>
							<div class="panel-block">
								<button class="button is-link is-outlined is-fullwidth"
									onclick="$('#costModal').toggleClass('is-active')">
									가계부 항목 추가</button>
							</div>
						</nav>
					</div>
					<% } %>
				</div>
				<%-- <table class="table is-bordered is-fullwidth is-striped allSchTable" align="center">
					<thead>
						<tr class="is-selected">
							<th width="200px">DAY1</th>
							<th width="200px">DAY2</th>
							<th width="200px">DAY3</th>
							<th width="200px">DAY4</th>
							<th width="200px">DAY5</th>
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
						<tr class="panelTr">
							<td height="300px">
								<div class="panel">
									<ul class="connectedSortable menu-list">
										<% for(int i = 0; i < 7; i++) { %>
										<li class="ui-state-default panel-block">
											<div class="media-left">
												<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
												</span>
											</div>
											<div class="media-content">
												<p>Item <%= i+1 %></p>
											</div>
											<div class="media-right">
												<button class="delete" aria-label="close"></button>
											</div>
										</li>
										<% } %>
									</ul>
									<div class="panel-block">
										<button class="button is-link is-outlined is-fullwidth"
											onclick="$('#costModal').toggleClass('is-active')">
											가계부 항목 추가
										</button>
									</div>
								</div>
							</td>
							<td height="300px">
								<div class="panel">
									<ul class="connectedSortable menu-list">
										<% for(int i = 0; i < 7; i++) { %>
										<li class="ui-state-default panel-block">
											<div class="media-left">
												<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
												</span>
											</div>
											<div class="media-content">
												<p>Item <%= i+1 %></p>
											</div>
											<div class="media-right">
												<button class="delete" aria-label="close"></button>
											</div>
										</li>
										<% } %>
									</ul>
									<div class="panel-block">
										<button class="button is-link is-outlined is-fullwidth"
											onclick="$('#costModal').toggleClass('is-active')">
											가계부 항목 추가
										</button>
									</div>
								</div>	
							</td>
							<td height="300px">
								<div class="panel">
									<ul class="connectedSortable menu-list">
										<% for(int i = 0; i < 7; i++) { %>
										<li class="ui-state-default panel-block">
											<div class="media-left">
												<span class="icon schInfoBtn"> <i class="fas fa-edit"></i>
												</span>
											</div>
											<div class="media-content">
												<p>Item <%= i+1 %></p>
											</div>
											<div class="media-right">
												<button class="delete" aria-label="close"></button>
											</div>
										</li>
										<% } %>
									</ul>
									<div class="panel-block">
										<button class="button is-link is-outlined is-fullwidth"
											onclick="$('#costModal').toggleClass('is-active')">
											가계부 항목 추가
										</button>
									</div>
								</div>
							</td>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
						</tr>
						<tr class="is-selected">
							<td>DAY6</td>
							<td>DAY7</td>
							<td>DAY8</td>
							<td>DAY9</td>
							<td>DAY10</td>
						</tr>
						<tr style="background:whitesmoke;">
							<td>2019-07-01</td>
							<td>2019-07-01</td>
							<td>2019-07-01</td>
							<td>2019-07-01</td>
							<td>2019-07-01</td>
						</tr>
						<tr class="panelTr">
							<td height="300px">Three</td>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
							<td height="300px">Three</td>
						</tr>
					</tbody>
				</table> --%>
			</section>
		</div>
	</div>	
	<jsp:include page="costModal.jsp" />
</body>
</html>