package mul.cam.food.member;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.BbsParam;
import mul.cam.food.dto.MemberDto;
import mul.cam.food.service.MemberService;

@Controller
public class MemberController {

	// service 접근(생성)
	@Autowired
	MemberService service;

	// 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	// 아이디/비번 찾기
	@RequestMapping(value = "find.do", method = RequestMethod.GET)
	public String find() {
		return "find";
	}

	// 아이디 찾기
	@RequestMapping(value = "find_id.do", method = RequestMethod.GET)
	public String findid() {
		return "find_id";
	}

	@RequestMapping(value = "find_id_result.do", method = RequestMethod.GET)
	public String findid_result() {
		return "find_id_result";
	}

	@RequestMapping(value = "find_pwd.do", method = RequestMethod.GET)
	public String findpwd() {
		return "find_pwd";
	}

	@ResponseBody // HTTP 응답의 body에 객체를 직렬화하여 넣어주는 역할
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public String idcheck(String id) {

		boolean ok = service.idCheck(id);
		if (ok == true) { // id 있음
			return "NO";
		}

		return "YES"; // id 없음
	}

	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(Model model, MemberDto dto) {

		boolean isS = service.addMember(dto);
		String message = "";
		if (isS) {
			message = "MEMBER_ADD_YES";
		} else {
			message = "MEMBER_ADD_NO";
		}
		model.addAttribute("message", message);

		return "message";
	}

	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String login(HttpServletRequest req, Model model, MemberDto dto) {
		MemberDto mem = service.login(dto);
		String msg = "";
		if(mem != null && !mem.getDelflg().equals("0")) { // 김건우 수정 --------------------------
			req.getSession().setAttribute("login", mem);	// 
			
			msg = "LOGIN_OK";
			
		}else if(mem != null && mem.getDelflg().equals("0")) {
			
			 msg = "Withdrawal member";
		
		}else {
			
			msg = "LOGIN_FAIL";
			
		}
		model.addAttribute("login", msg); // model에 로그인 결과 전달
		model.addAttribute("mem", mem);//------------------------------------
		return "message";	// message View로 반환
	}

	// 아이디 찾기
	@RequestMapping(value = "find_id_Af.do", method = RequestMethod.POST)
	public String find_id(HttpServletResponse resp, Model model, String email) {
		System.out.println("MemberController find_id_Af.do " + new Date());
		System.out.println("email:" + email);

		String id = service.find_id(email);

		if (id == null) {
			model.addAttribute("id", "가입된 정보가 없습니다.");
		} else {
			model.addAttribute("id", "회원님의 아이디는 " + "\"" + id + "\" 입니다.");
		}

		return "find_id_result";
	}

	// 패스워드 찾기
	@RequestMapping(value = "find_pwd_Af.do", method = RequestMethod.POST)
	public String find_pwd(Model model, String email) {
		System.out.println("MemberController find_pwd_Af.do " + new Date());
		System.out.println("email:" + email);

		String pwd = service.find_pwd(email);

		if (pwd == null) {
			model.addAttribute("pwd", "가입된 정보가 없습니다.");
		} else {
			model.addAttribute("pwd", "회원님의 패스워드는 " + "\"" + pwd + "\" 입니다.");
		}

		return "find_pwd_result";
	}

	// 세션 만료 시,(기본 30분)
	@RequestMapping(value = "sessionOut.do", method = RequestMethod.GET)
	public String sessionOut(Model model) {
		String sessionOut = "logout";

		model.addAttribute("sessionOut", sessionOut);
		return "message";
	}
	
	///////////////////////////////////////////////////
	// 230321 추가 => 나의 정보, 내가 쓴글  가져오기 
		@RequestMapping(value = "setting.do", method= RequestMethod.GET)
		public String setting(Model model, HttpServletRequest req, BbsParam param) {
			System.out.println("MemberController setting " + new Date());
			
//			System.out.println("getPageNumber" +param.getPageNumber()); 
			
			MemberDto login = (MemberDto) req.getSession().getAttribute("login");
			
			int pn = param.getPageNumber();  // 0 1 2 3 4
			int start = 1 + (pn * 10);	// 1  11
			int end = (pn + 1) * 10;
			System.out.println("start "+start);
			System.out.println("end "+end);
			System.out.println("login "+login.getUserId());
			
			param.setStart(start);
			param.setEnd(end);		
			param.setWriter(login.getUserId());			
			
			MemberDto myData = service.getMydata(login);
//			List<BbsDto> myRecipe = service.getMyrecipe(login);
			List<BbsDto> myRecipe = service.getMyrecipePage(param);
			
			int len = service.getMyBbsLen(param);
			
			System.out.println("len "+ len);
			System.out.println(myRecipe.toString());
			
			int pageBbs = len / 10;		// 25 / 10 -> 2
			if((len % 10) > 0) {
				pageBbs = pageBbs + 1;
			}
			
			if(param.getChoice() == null 
					   || param.getChoice().equals("")
					   || param.getSearch().equals("")
					  ) {
						param.setChoice("검색");
						param.setSearch("");
					}
			
						
			model.addAttribute("myData", myData);	 // 나의 정보		
			model.addAttribute("myRecipe", myRecipe); // 내가 쓴 게시판 정보
			model.addAttribute("pageBbs", pageBbs); // 총페이지수 
			model.addAttribute("pageNumber", param.getPageNumber()); // 현재 페이지
			model.addAttribute("choice", param.getChoice());
			model.addAttribute("search", param.getSearch());
			
			return "setting";
		}

}
