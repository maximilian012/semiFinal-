package mul.cam.food.dao;

import java.util.List;

import mul.cam.food.dto.BbsComment;
import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.MemberDto;

public interface BbsDao {

	int bbswrite(BbsDto dto);

	List<BbsDto> getlist();

	
	BbsDto getBbs(int seq);

	int commentWrite(BbsComment bbs);	
}
