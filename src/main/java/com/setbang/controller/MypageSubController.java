package com.setbang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.setbang.domain.AdminVO;
import com.setbang.domain.MypageSubVO;
import com.setbang.service.MypageSubService;

@Controller
public class MypageSubController {
	private static final Logger logger = LoggerFactory.getLogger(MypageSubController.class);

	@Autowired
	private MypageSubService mypagesubservice;
	
	// 업무지원 서비스 신청현황
	@RequestMapping(value="supportlist.do")
	public String supportlist(MypageSubVO vo, Model model, HttpSession session) {
		
		// Session에서 Mem_code 가져오기
		String sessionId = (String) session.getAttribute("sessionId");
		int mem_code = mypagesubservice.findmemcode(sessionId);
		
		// Mem_code로 자신의 업무지원서비스 신청현황 가져오기
		List<MypageSubVO> supportlist = mypagesubservice.supportlist(mem_code);
			System.out.println("supportlist : " + supportlist);
			model.addAttribute("supportlist", supportlist);
		
		
		return "/mypage_sub/myPageSupportlist";
	}
	
}
