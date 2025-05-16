package com.example.mbboard.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mbboard.dto.ConnectCount;
import com.example.mbboard.mapper.ConnectCountMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class RootService implements IRootService {
	@Autowired ConnectCountMapper connectCountMapper;
	
	@Override
	public Map<String, Integer> getCounnectCountAll() {

		return connectCountMapper.selectConnectCountAll();
	}

	@Override
	public Map<String, Integer> getCounnectCountToday() {
		return connectCountMapper.selectConnectCountToday();
	}

	@Override
	public int addConnectCount(ConnectCount cc) {
		return connectCountMapper.insertConnectCount(cc);
	}

	@Override
	public int modifyConnectCount(ConnectCount cc) {
		return connectCountMapper.updateConnectCount(cc);
	}

	
	// MEMBER, AMDIN -> login 성공시
	// ANONYMOUS -> 클라이언트 세션이 서버에 생성될 때(특정 브라우저에 처음 접속했을때)
	@Override
	public String getConnectDateByKey(ConnectCount cc) {
		return connectCountMapper.selectConnectDateByKey(cc);
	}
	
}
