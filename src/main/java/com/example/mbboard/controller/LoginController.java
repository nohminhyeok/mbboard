package com.example.mbboard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.mbboard.dto.ConnectCount;
import com.example.mbboard.dto.Member;
import com.example.mbboard.service.ILoginService;
import com.example.mbboard.service.IRootService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	@Autowired ILoginService loginService;
	@Autowired IRootService rootService;
	
	@GetMapping("/joinMember")
	public String joinMember() {
		return"joinMember";
	}
	
	@GetMapping("/isId/{id}")
	@ResponseBody
	public boolean isId(@PathVariable String id) {
		return loginService.findById(id) != null;
	}
	
	@ResponseBody
	@PostMapping("/joinMember")
	public String joinMember(@RequestParam String id
							,@RequestParam String pw) {
		Member member = new Member();
		member.setMemberId(id);
		member.setMemberPw(pw);
		
		int result = loginService.insertMember(member);
		if(result > 0) {
			return "success";
		}
		return "fail";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	@GetMapping("/login")
	public String login() {
		
		return "login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Member paramMember) {
	    Member loginMember = loginService.login(paramMember);
	    if (loginMember != null) {
	        // 세션에 로그인 정보 저장
	        session.setAttribute("loginMember", loginMember);
	        // 멤버(ADMIN, MEMBER) 카운트 +1
	        ConnectCount cc = new ConnectCount();
	        cc.setMemberRole(loginMember.getMemberRole());
	        if(rootService.getConnectDateByKey(cc) == null) {
	        	rootService.addConnectCount(cc); // 오늘 날짜 loginMember.getMemberRole()로 1행을 추가 카운트 = 1
	        } else {
	        	rootService.modifyConnectCount(cc); // 오늘 날짜 loginMember.getMemberRole()를 수정 카운트 +1
	        }
	    }
	    return "login";  // 로그인 실패 시 다시 로그인 페이지로
	}
	
	// 세션안의 상세정보를 보여주는 요청 -> 로그인 상태에서는 요청가능 -> 필터 1)
	@GetMapping("/member/info") 
	public String info() {
		
		return "/member/info";
	}
	
	// 관리자 페이지 요청 -> 로그인 상태이고 role이 'ADMIN' 요청가능 -> 필터 2)
	@GetMapping("/admin/adminHome")
	public String memberList(Model model) {
		List<Map<String, Object>> memberList = loginService.memberList(new Member());
		model.addAttribute("memberList", memberList);
		return"admin/adminHome";
	}


	@GetMapping("/member/memberHome") 
	public String memberHome() {
		
		return "/member/memberHome";
	}
	
	@PostMapping("/admin/adminHome")
	@ResponseBody
	public String updateMember(@RequestParam String memberId
							, @RequestParam String memberPw
							, @RequestParam String memberRole) {
	    Member member = new Member();
	    member.setMemberId(memberId);
	    member.setMemberPw(memberPw);
	    member.setMemberRole(memberRole);
	    
	    int result = loginService.updateMember(member);
	    return result > 0 ? "success" : "fail";
	}
	
	@PostMapping("/member/memberHome")
	@ResponseBody
	public String updateMemberPw(@RequestParam String memberPw
								,@RequestParam String memberId) {
		Member member = new Member();
		member.setMemberPw(memberPw);
		member.setMemberId(memberId);
		
	    int result = loginService.updateMemberPw(member);
	    return result > 0 ? "success" : "fail";
	}
}
