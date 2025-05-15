package com.example.mbboard.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.mbboard.dto.Member;

@Mapper
public interface LoginMapper {
	Member login(Member paramMember);

	int insertMember(Member member);

	String findById(String id);

	List<Map<String, Object>> memberList(Member member);

	int updateMember(Member member);

	int updateMemberPw(Member member);
}
