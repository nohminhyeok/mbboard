package com.example.mbboard.service;

import java.util.List;
import java.util.Map;

import com.example.mbboard.dto.Member;

public interface ILoginService {
	Member login(Member paramMember);

	int insertMember(Member member);

	String findById(String id);
	
	List<Map<String,Object>> memberList(Member member);

	int updateMember(Member member);
	
	int updateMemberPw(Member member);
}
