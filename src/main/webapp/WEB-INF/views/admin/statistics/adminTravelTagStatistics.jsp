<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<style>
	.column .columns {
		margin:0 !important;
	}
	.statisticsArea {
		width: 100%;
		height: 100%;
	}
	#myChart {
		width: 100%;
		height: 100%;
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
				<div class="column">
					<div class="tabs is-boxed">
						<ul class="travelStaNav">
							<li>
								<a href="travelCountryStatisticsView.sta">
									<span style="color:#ccccff;"><i class="fas fa-venus-mars"></i>&nbsp;나라별</span>
								</a>
							</li>
							<li>
								<a href="travelTagStatisticsView.sta">
									<span style="color:#ccccff;"><i class="fas fa-user-clock"></i>&nbsp;여행스타일별</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</section>
			<section class="section" id="cardSection">
				<div class="columns">
					
					<div class="statisticsArea">
						<div class="field has-addons" style="justify-content: flex-end; margin-top: 1em;" align="right">
							<p class="control">
								<span class="select">
									<select id="monthSelect">
										<option value="1">1월</option>
										<option value="2">2월</option>
										<option value="3">3월</option>
										<option value="4">4월</option>
										<option value="5">5월</option>
										<option value="6">6월</option>
										<option value="7">7월</option>
										<option value="8">8월</option>
										<option value="9">9월</option>
										<option value="10">10월</option>
										<option value="11">11월</option>
										<option value="12">12월</option>
									</select>
								</span>
							</p>
						</div>
						
						<canvas id="tagStatistics" width="1000">
						</canvas>	
					</div>
					
				</div>
			</section>
		</div>
	</div>
	
<script>
var ctx;
var myChart;
var today;
var year;
var month;

$(function(){
	
	var menu = $(".statisticsNav li").eq(1);
    menu.addClass('is-active');
    menu.siblings().removeClass('is-active');
    
    var sub = $(".travelStaNav li").eq(1);
    sub.addClass('is-active');
    sub.find('span').css("color", "#209cee");
    sub.siblings().removeClass('is-active');
    
  	//현재 월 기준 인기 태그 10위 조회
    today = new Date();
    year = today.getFullYear();
    month = today.getMonth() + 1;
    
    $("#monthSelect option").each(function() {
    	if($(this).val() == month) {
    		$(this).attr("selected", "selected");
    	}
    });
    
    var day = "";
    if(month < 10) {
    	month = '0' + month;
    }
    
    day = year + '-' + month;
    
    /* 차트 초기화 */
	ctx = document.getElementById('tagStatistics').getContext('2d');
    myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: [],
            datasets: [{
                label: '태그 인기순위',
                data: [],
                backgroundColor: [
                	'#FFA7A7',
                    '#FFC19E',
                    '#FFE08C',
                    '#CEF279',
                    '#B7F0B1',
                    '#B2EBF4',
                    '#B2CCFF',
                    '#B5B2FF',
                    '#D1B2FF',
                    '#FFB2F5'
                ],
                borderWidth: 2
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            },
            title: {
            	display: true,
            	text: '월별 인기 여행태그 10',
            	fontSize: 25
            }
        }
    });
    
    $.ajax({
    	url : "travelTagStatistics.sta",
    	data : {month : day},
    	type : "post",
    	success : function(data) {
    		console.log(data);
    		
    		for(var i in data) {
    			
    			myChart.data.labels.push(data[i].rownum + "위 : " + data[i].tagName);
    			myChart.data.datasets[0].data.push(data[i].tagCount);
    			
    			myChart.update();
    		}
    	},
    	error : function(data) {
    		alert("접속에러");
    	}
    });
});

$("#monthSelect").change(function() {
	month = $(this).val();
	if(month < 10) {
    	month = '0' + month;
    }
	day = year + '-' + month;
	
	console.log(day);
	
	$.ajax({
    	url : "travelTagStatistics.sta",
    	data : {month : day},
    	type : "post",
    	success : function(data) {
    		console.log(data);
    		
    		if(data.length <= 0) {
    			myChart.reset();
    		}
    		
    		for(var i in data) {
    			myChart.data.labels.pop();
    			myChart.data.datasets[0].data.pop();
    			
    			myChart.data.labels.push(data[i].tagName);
    			myChart.data.datasets[0].data.push(data[i].tagCount);
    			
    			myChart.update();
    		}
    	},
    	error : function(data) {
    		alert("접속에러");
    	}
    });
});


</script>
	
</body>
</html>