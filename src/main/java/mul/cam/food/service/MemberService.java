package mul.cam.food.service;

import java.util.List;

import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.BbsParam;
import mul.cam.food.dto.MemberDto;

public interface MemberService {

	List<MemberDto> allMember();
	
	boolean idCheck(String id);
	boolean addMember(MemberDto dto);
	MemberDto login(MemberDto dto);
	String find_id(String email);
	String find_pwd(String email);
	
	
	// 230320 추가 
	MemberDto getMydata(MemberDto dto);
	
	List<BbsDto> getMyrecipe(MemberDto dto);
	
	// 230320 추가 2
	
	int getMyBbsLen(BbsParam param);
	
	List<BbsDto> getMyrecipePage(BbsParam param);
}
