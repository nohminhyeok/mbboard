package com.example.mbboard.service;

import java.util.Map;

import com.example.mbboard.dto.ConnectCount;

public interface IRootService {
	// 오늘 && memberRole의 데이터(행)이 있는지 없는지
	String getConnectDateByKey(ConnectCount cc);
	// 오늘 && memberRole의 데이터(행)이 없을때 -> insert count = 1
	int addConnectCount(ConnectCount cc);
	// 오늘 && memberRole의 데이터(행)이 있을때 -> update count = count + 1
	int modifyConnectCount(ConnectCount cc);
	
	// Map<String, Integer> 반환
	
	// 모든ROLE의 전체 접속 카운트(누적)
	// 멤버 접속 카운트(누적)
	// 관리자 접속 카운트(누적)
	Map<String, Integer> getCounnectCountAll();
	// 오늘 전체 접속 카운트
	// 오늘 멤버 접속 카운트
	// 오늘 관리자 접속 카운트
	Map<String, Integer> getCounnectCountToday();
}
