package mul.cam.food.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	
	// 수정 230320 req 삭제함
	@GetMapping(value = "bbslist.do")
	public String bbslist(Model model, BbsParam param, HttpServletRequest req) {
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
		// 처음 검색시 카테고리는 0으로 설정
		model.addAttribute("category", 0);
		model.addAttribute("boardName", "전체게시판");


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
		model.addAttribute("category", 0);
		if(param.getChoice() == null) {
			model.addAttribute("boardName", "전체게시판");
		} else {
			model.addAttribute("boardName", "검색결과");
		}

		
		return "bbslist";
	}
	@RequestMapping(value="categorysearch.do" , method = RequestMethod.GET)
	public String searchBbslist(Model model, int category, int pageNumber) {
	
		BbsParam param = new BbsParam();
		
		int pn = pageNumber; // 0 1 2 3 4
		int start = 1 + (pn * 12); // 1
		int end = (pn+1) * 12;     // 10
		param.setStart(start);
		param.setEnd(end);

		param.setCategoryNumber(category);
		
		
		List<BbsDto> list = service.getCategorySearchList(param);
		int len = service.getAllCategoryBbsLen(param);
		System.out.println(len+" is len");
		int pageBbs = (len/12);
		
		if((len%12) > 0) {
			pageBbs += 1;
		}

		
		model.addAttribute("bbslist", list);
		model.addAttribute("pageBbs", pageBbs);
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("category", category);
		switch (category) {
		case 1: {
			model.addAttribute("boardName", "#마음의 '양식'");
		}
		break;
		case 2: {
			model.addAttribute("boardName", "#오늘은 자장면이 땡긴다.");
		}
		break;
		case 3: {
			model.addAttribute("boardName", "#집에서 즐기는 오마카세");
		}
		break;
		case 4: {
			model.addAttribute("boardName", "#떡볶이가 맛없으면 울어도 괜찮아");
		}
		break;
		case 5: {
			model.addAttribute("boardName", "#양념치킨은 자랑스러운 한식입니다");
		}
		break;
		case 6: {
			model.addAttribute("boardName", "#디저트 배는 따로 있음");
		}
		break;

		}

		
		
		return "bbslist";
	}

	
//	//////////////////////////////////////////////////////////////////////////////
	// 수정 230320 
	@RequestMapping(value = "searchMove.do", method = RequestMethod.POST)
	public String searchMove(String search, String choice, Model model) {
		System.out.println(choice);
		System.out.println(search);

		BbsParam param = new BbsParam();

		param.setChoice(choice);
		param.setSearch(search);

//		List<BbsDto> list = service.getSearchList(param);
//		System.out.println(list.size());
		
		model.addAttribute("choice", choice);
		model.addAttribute("search", search);
//		model.addAttribute("bbslist", list);
		
		model.addAttribute("category", 0);
		model.addAttribute("boardName", "검색결과");

		return "forward:/mainSearchbbslist.do";
	}
	
//	//////////////////////////////////////////////////////////////////////////////
	// 추가 230320 
	@PostMapping(value = "mainSearchbbslist.do")
	public String mainSearchbbslist(Model model, BbsParam param) {
		
		// 글의 시작과 끝
		int pn = param.getPageNumber(); // 0 1 2 3 4
		int start = 1 + (pn * 12); // 1
		int end = (pn+1) * 12;     // 10
		
		System.out.println("pn "+pn);
		
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
		
		System.out.println("len "+len);
		
		model.addAttribute("bbslist", list);
		model.addAttribute("pageBbs", pageBbs);
		model.addAttribute("pageNumber", param.getPageNumber());
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("search", param.getSearch());

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
