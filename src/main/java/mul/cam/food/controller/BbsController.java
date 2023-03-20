package mul.cam.food.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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


import mul.cam.food.dto.BbsComment;
import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.BbsParam;
import mul.cam.food.dto.MemberDto;
import mul.cam.food.service.BbsService;



@Controller
public class BbsController {

	@Autowired
	BbsService service;

	@GetMapping(value = "mainhome.do")
	public String mainhome(Model model, HttpServletRequest req) {
//		System.out.println("MemberController mainhome() " + new Date());	

//		System.out.println(req.getSession().getAttribute("login")); 

		List<BbsDto> food = service.mainHomegetBbs();
		List<BbsDto> recent = service.recentBbs();

		model.addAttribute("food", food);
		model.addAttribute("recent", recent);

		return "mainhome";
	}
	
	
	@GetMapping(value = "bbslist.do")
	public String bbslist(Model model,HttpServletRequest req, BbsParam param) {
		// 글의 시작과 끝
		int pn = param.getPageNumber(); // 0 1 2 3 4
		int start = 1 + (pn * 12); // 1
		int end = (pn+1) * 12;     // 10
		
		param.setStart(start);
		param.setEnd(end);

		
		List<BbsDto> list = service.getlist(param);
		int len = service.getAllBbsLen(param);
		
		int pageBbs = len / 12; // 25 / 10 -> 2
		
		
		if((len%12) > 0) {
			pageBbs += 1;
		}
		
		if(param.getChoice() == null 
		   || param.getChoice().equals("")
		   || param.getSearch().equals("")
		   || param.getSearch().equals("")
		  ) {
			param.setChoice("검색");
			param.setSearch("");
		}
		
		System.out.println(len);
		
		model.addAttribute("bbslist", list);
		model.addAttribute("pageBbs", pageBbs);
		model.addAttribute("pageNumber", param.getPageNumber());
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());


		return "bbslist";
	}
	
	
	
	@GetMapping(value = "bbswrite.do")
	public String bbswrite() {
		return "bbswrite";
	}
	
	/*
	 * @PostMapping(value = "bbsTest.do") public String bbsTest() {
	 * System.out.println("here"); return "bbswrite"; }
	 */
	
	/*
	 * @PostMapping(value = "bbswriteAF.do") public String bbswriteAf(Model model,
	 * BbsDto dto) { System.out.println("wrtier : " + dto.getWriter());
	 * System.out.println("content : " + dto.getContent());
	 * System.out.println("thumbnail : " + dto.getThumbnail());
	 * 
	 * boolean b = service.bbswrite(dto); String bbswrite = ""; if (b) { bbswrite =
	 * "writeOK"; }else { bbswrite = "writeNO"; } model.addAttribute("bbswrite",
	 * bbswrite);
	 * 
	 * return "message"; // controller 에서 controller로 이동 redirect:/bbslist.do,
	 * forward }
	 */

	

	
	  @PostMapping(value = "bbswriteAFs.do") public String bbswriteAf(Model model, BbsDto dto) { 
		System.out.println(dto.toString());

		 boolean b = service.bbswrite(dto); 
		 String bbswrite = ""; 
		 if (b) { bbswrite = "writeOK"; } 
		 else { bbswrite = "writeNO"; } 
		 
		 model.addAttribute("bbswrite", bbswrite);
	  
		 return "message"; // controller 에서 controller로 이동 redirect:/bbslist.do,
	   }
	 

	@RequestMapping(value="search.do" , method = RequestMethod.POST)
	public String searchBbslist(String search, String choice, Model model) {
	
		BbsParam param = new BbsParam();
		
		param.setChoice(choice);
		param.setSearch(search);
		
		List<BbsDto> list = service.getSearchList(param);
		int len = list.size();
		int pageBbs = (len/12);
		
		if((len%10) > 0) {
			pageBbs += 1;
		}
		
		if(param.getChoice() == null 
		   || param.getChoice().equals("")
		   || param.getSearch().equals("")
		   || param.getSearch().equals("")
		  ) {
			param.setChoice("검색");
			param.setSearch("");
		}
		
		model.addAttribute("bbslist", list);
		model.addAttribute("pageBbs", pageBbs);
		model.addAttribute("pageNumber", param.getPageNumber());
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());

		
		
		return "bbslist";
	}
	

	
	@RequestMapping(value = "searchMove.do", method = RequestMethod.POST)
	public String searchMove(String search, String choice, Model model) {
		System.out.println(search);
		System.out.println(choice);

		BbsParam param = new BbsParam();

		param.setChoice(choice);
		param.setSearch(search);

		List<BbsDto> list = service.getSearchList(param);
		System.out.println(list.size());

		model.addAttribute("bbslist", list);

		return "bbslist";
	}
	
	
	

	// 게시물 상세보기
	@GetMapping(value = "bbsdetail.do")
	public String bbsdetail(Model model, int seq) {
		System.out.println("BbsController bbsdetail " + new Date());
		BbsDto dto = service.detailBbs(seq);
		model.addAttribute("bbsdto", dto);
		
		return "bbsdetail";
	}		
	
	// 게시글 수정
	@RequestMapping(value = "bbsupdate.do", method = RequestMethod.POST)
	public String bbsupdate(Model model, BbsDto dto, int seq) {
		model.addAttribute("dto", dto);
		
		return "bbsupdate";
	}
	
	// 게시글 수정 이후
	@RequestMapping(value = "bbsupdateAf.do", method = RequestMethod.POST)
	public String bbsupdateAf(Model model, BbsDto dto) {
		System.out.println(dto.toString());
		boolean isS = service.updateBbs(dto);
		
		String bbsupdate = "BBS_UPDATE_OK";
		if(!isS) {			
			bbsupdate = "BBS_UPDATE_NG";
			System.out.println("게시물 수정에 실패했습니다");
		}
		model.addAttribute("bbsupdate", bbsupdate);
		model.addAttribute("seq", dto.getSeq());
		
		return "message";
	}
	
	// 썸머노트 이미지 파일
	@RequestMapping(value="SummerNoteImageFile" , method = RequestMethod.POST)
	public @ResponseBody JsonObject SummerNoteImageFile(@RequestParam("file") MultipartFile file) {

		JsonObject jsonObject = service.SummerNoteImageFile(file);
		 System.out.println(jsonObject);
		return jsonObject;
	}

	

	// 게시물 삭제
	@PostMapping(value = "bbsdelete.do")
	public String bbsdelete(Model model, int seq) {
		System.out.println("BbsController BbsDelete " + new Date());
		boolean isS = service.deleteBbs(seq);
		if(isS) {
			System.out.println("게시물 삭제에 성공했습니다");
		}else {
			System.out.println("게시물 삭제에 실패했습니다");
		}
		model.addAttribute("result", "delete success");
		
		return "message";
		
	}
	
	// 댓글 목록 
		@ResponseBody
		@GetMapping(value = "commentList.do")
		public List<BbsComment> commentList(int seq) {
			List<BbsComment> list = service.commentList(seq);
			return list;
		}
	
		
		// 댓글 작성
		@PostMapping(value = "commentWriteAf.do")
		public String commentWriteAf(BbsComment bbs) {
			System.out.println("BbsController BbsComment " + new Date());
			System.out.println(bbs.toString());
			boolean isS = service.commentWrite(bbs);
			if(isS) {
				System.out.println("댓글작성에 성공했습니다");
			}else {
				System.out.println("댓글작성에 실패했습니다");
			}
			
			return "redirect:/bbsdetail.do?seq=" + bbs.getSeq();
		}
	
}
