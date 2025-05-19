package com.example.mbboard.service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.mbboard.dto.Member;
import com.example.mbboard.mapper.LoginMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LoginService implements ILoginService{

	@Autowired JavaMailSender javaMailSender;
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

	@Override
	public void updateMemberPwByAdmin(Member member) {
		// 새로운 패스워드를 생성
		String randomPw = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
		member.setMemberPw(randomPw);
		int row = loginMapper.updateMemberPwByAdmin(member);
		if(row == 1) {
			// 메일로 변경된 비밀번호를 전송
			log.info("변경된 비밀번호 : "+randomPw);
			SimpleMailMessage msg = new SimpleMailMessage();
			msg.setFrom("admin@localhost.com");
			msg.setTo(member.getEmail());
			msg.setSubject("변경된 비밀번호 입니다.");
			msg.setText("변경된 비밀번호는 " + randomPw + " 입니다."
					+" 10분안에 로그인하여 수정하셔야 합니다.");
			
			javaMailSender.send(msg);
		}
	}

	@Override
	public int updateMemberEmailPw(Member member) {
		// TODO Auto-generated method stub
		return loginMapper.updateMemberEmailPw(member);
	}
	
}
