package mul.cam.food.service.impl;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mul.cam.food.dao.MemberDao;
import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.BbsParam;
import mul.cam.food.dto.MemberDto;
import mul.cam.food.service.MemberService;


@Service // dao와 controller사이에 교두보 역할 
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao dao;
	
	@Override
	public List<MemberDto> allMember() {		
		return dao.allMember();
	}

	@Override
	public boolean idCheck(String id) {
		int count = dao.idCheck(id);
		return count>0?true:false;
	}
	
	@Override
	public boolean addMember(MemberDto dto) {
		int count = dao.addMember(dto);
		return count>0?true:false;
	}
	
	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}
	
	@Override
	public String find_id(String email) {
		System.out.println("dao.find_id(email):" + dao.find_id(email));
		return dao.find_id(email);
	}
	
	@Override
	public String find_pwd(String email) {
		System.out.println("dao.find_id(email):" + dao.find_id(email));
		return dao.find_pwd(email);
	}

	@Override
	public MemberDto getMydata(MemberDto dto) {
		return dao.getMydata(dto);
	}

	@Override
	public List<BbsDto> getMyrecipe(MemberDto dto) {
		return dao.getMyrecipe(dto);
	}

	@Override
	public int getMyBbsLen(BbsParam param) {
		return dao.getMyBbsLen(param);
	}

	@Override
	public List<BbsDto> getMyrecipePage(BbsParam param) {
		return dao.getMyrecipePage(param);
	}
	
	@Override
	public List<BbsDto> getMyrecipePage(BbsParam param) {
		return dao.getMyrecipePage(param);
	}
	
	
}
