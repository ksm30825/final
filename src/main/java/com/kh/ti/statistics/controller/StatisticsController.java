package com.kh.ti.statistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatisticsController {
	
	//통계 / 회원 / 성별 통계(연별)
	@RequestMapping("genderStatisticsYear.sta")
	public String genderStatisticsYear() {
		
		return "admin/statistics/adminGenderStatistics";
	}

}
