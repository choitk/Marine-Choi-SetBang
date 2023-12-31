package com.setbang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.setbang.domain.PubOfficeVO;
import com.setbang.service.PubOfficeService;
import com.setbang.service.SupportService;


@Controller
public class PubOfficeController {
	
	private static final Logger logger = LoggerFactory.getLogger(PubOfficeController.class);

	@Autowired
	private PubOfficeService pubOfficeService;
	
	@Autowired
	private SupportService supportService;
	
	/** 공유 오피스 예약 페이지 접근 **/
	@GetMapping("/pubOfficeBooking.do")
	public ModelAndView viewPubOffice(HttpSession session,PubOfficeVO vo,Model model) {
		logger.info("pubOffice.do 경로의 viewPubOffice controller 탔음");
		
		
		//공용 오피스 방 선택하는 콤보상자
		List<PubOfficeVO> pubUnits = pubOfficeService.selectPubOfficeCombo(vo);
		
		if(pubUnits != null) {
			model.addAttribute("pubUnits",pubUnits);
		}
		
		//대상 view(jsp)파일
		return new ModelAndView("pubOffice/pubOffice");
	}
	
	/** 
	 *  공용 오피스 방 선택시 ajax이용해서 라디오 상자와 상호작용
	 *  이부분은 공용 오피스 코드와 pubTime, bookStart 가 일치하는 경우엔 라디오 상자 사용 불가능하게 하는 기능
	 *  **/
	@PostMapping("/compareTimes.do")
	@ResponseBody
	public ResponseEntity<Map<String, String>> compareTimes(@RequestParam String selectValue, @RequestParam String bookDate, PubOfficeVO vo, Model model){
		logger.info("pubOffice.compareTimes");
		Map<String, String> response = new HashMap<>();
		int pubCode = Integer.parseInt(selectValue);
		vo.setPubCode(pubCode);

		PubOfficeVO compare = pubOfficeService.selectCompareTimes(vo);
		if(compare == null) {
			// return ResponseEntity.ok("no-data"); // 데이터가 없는 경우 
			response.put("result", "no-data");
		}else {
	        String dbBookDate = compare.getBookDate(); // 데이터베이스에서 가져온 예약일자 값
	        String dbBookStart = compare.getBookStart(); // 데이터베이스에서 가져온 시작 시간 값
			if(dbBookDate.equals(bookDate)) {  // 예약일자와 클라이언트에서 보낸 예약일자 비교
				response.put("result", "match");// 일치하는 경우 return ResponseEntity.ok("match"); 
			}else {
				response.put("result", "not-match"); //return ResponseEntity.ok("not-match"); 불일치하는 경우
			}
			response.put("time", dbBookStart); //	model.addAttribute("time", time);
		}
		
		return ResponseEntity.ok(response);

		
	}
	
	
	/** 공유 오피스 예약  insert 처리 **/
	@PostMapping("/insertpubOfficeBooking.do")
	public ModelAndView insertPubBooking(PubOfficeVO vo,HttpSession session,Model model, HttpServletRequest request) {
		
		logger.info("PubOfficeController의 insertPubOfficeBooking method");
		
		String selectedValueStr = request.getParameter("selectedValue");
		if(selectedValueStr != null) {
			try {
				Integer selectedValue = Integer.valueOf(selectedValueStr);
				vo.setPubCode(selectedValue);
			} catch (NumberFormatException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}

	String id = (String) session.getAttribute("sessionId");
	
	// ID로 Mem_code 가져오기
	int memcode = supportService.findMemcode(id);
	
	if(memcode != 0) {
		vo.setMemCode(memcode);
	}
	
	/**  MemCode를 직접 가져올 경우 그러나 성민이가 구현해둔 것을 공통으로 사용하고 있어서 이 코드는 사용 안하고 주석 처리 **/
	
	vo.setPubTime(vo.getBookStart());
	
	pubOfficeService.updatePubOfficeY(vo);
	
	pubOfficeService.insertPubOffice(vo);
	return new ModelAndView("redirect:/pubbookinglist.do");
	
	}//insertbooking 메소드 끝나는 위치 
	
}
