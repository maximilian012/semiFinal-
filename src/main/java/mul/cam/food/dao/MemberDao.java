package mul.cam.food.dao;

import java.util.List;

import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.MemberDto;

public interface MemberDao {

	List<MemberDto> allMember();
	
	int idCheck(String id);
	int addMember(MemberDto dto);
	
	MemberDto login(MemberDto dto);
	String find_id(String email);
	String find_pwd(String email);
	
	// 19 추가 
	
	MemberDto getMydata(MemberDto dto);
	
	List<BbsDto> getMyrecipe(MemberDto dto);
}
