package mul.cam.food.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.MemberDto;
import mul.cam.food.service.BbsService;



@Controller
public class BbsController {

	@Autowired
	BbsService service;

	@GetMapping(value = "bbslist.do")
	public String bbslist(Model model) {
		
		List<BbsDto> list = service.testlist();
		model.addAttribute("testlist", list); // 게시판 리스트
		
		return "testlist";
	}
	
	
	
	@GetMapping(value = "bbswrite.do")
	public String bbswrite() {
		return "bbswrite";
	}
	
	@GetMapping(value = "bbswriteAF.do")
	public String bbswriteAf(Model model, BbsDto dto) {
		System.out.println("wrtier : " + dto.getWriter());
		System.out.println("content : " + dto.getContent());
		System.out.println("thumbnail : " + dto.getThumbnail());
		
		boolean b =  service.bbswrite(dto);
		String bbswrite = "";
		if (b) {
			bbswrite = "writeOK";
		}else {
			bbswrite = "writeNO";
		}
		model.addAttribute("bbswrite", bbswrite);
		
		return "message"; // controller 에서 controller로 이동 redirect:/bbslist.do, forward
	}
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		
		
		return "login";
	}
	
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(HttpServletRequest req, MemberDto dto, Model model) {
		
		MemberDto mem = service.loginAf(dto);
		
		String loginOK = "";
		if (mem != null) {
			 req.getSession().setAttribute("login", mem);
			// req.getSession().setMaxInactiveInterval(60 * 60 * 60 * 60);
			 
			 loginOK = "BBS_ADD_OK"; // 로그인 성공
			
		}else {
			 loginOK = "BBS_ADD_NO";
			
		}
		model.addAttribute("loginOK", loginOK);
		
		model.addAttribute("mem", mem);
		
		return "message";
	}
	
	
	
	@RequestMapping(value="SummerNoteImageFile.do" , method = RequestMethod.POST)
	public @ResponseBody JsonObject SummerNoteImageFile(@RequestParam("file") MultipartFile file) {
		JsonObject jsonObject = service.SummerNoteImageFile(file);
		 System.out.println(jsonObject);
		return jsonObject;
	}
	
	
	
	
	
}
