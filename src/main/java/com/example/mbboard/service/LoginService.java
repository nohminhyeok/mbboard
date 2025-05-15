package com.example.mbboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mbboard.dto.Member;
import com.example.mbboard.mapper.LoginMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LoginService implements ILoginService{
	@Autowired LoginMapper loginMapper;
	
	@Override
	public Member login(Member paramMember) {

		return loginMapper.login(paramMember);
	}

	@Override
	public int insertMember(Member member) {
		// TODO Auto-generated method stub
		return loginMapper.insertMember(member);
	}
	
	@Override
	public String findById(String id) {
		// TODO Auto-generated method stub
		return loginMapper.findById(id);
	}

	@Override
	public List<Map<String, Object>> memberList(Member member) {
		// TODO Auto-generated method stub
		return loginMapper.memberList(member);
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return loginMapper.updateMember(member);
	}

	@Override
	public int updateMemberPw(Member member) {
		// TODO Auto-generated method stub
		return loginMapper.updateMemberPw(member);
	}
	
}
