package mul.cam.food.dao;

import java.util.List;

import mul.cam.food.dto.BbsComment;
import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.BbsParam;
import mul.cam.food.dto.MemberDto;

public interface BbsDao {

	int bbswrite(BbsDto dto);

	List<BbsDto> mainHomegetBbs(); // 메인홈페이지 평점순 
	List<BbsDto> getlist(BbsParam param);
	List<BbsDto> getFirstList();

	int getAllBbsLen(BbsParam param);
	
	// searchList
	List<BbsDto> getSearchlist(BbsParam param);
	List<BbsDto> recentBbs();
	
	BbsDto getBbs(int seq);
	
	// 상세보기
		BbsDto detailBbs(int seq);	
		
		// 게시판 수정
		int updateBbs(BbsDto dto);
		
		// 게시판 삭제
		int deleteBbs(int seq);
		
		// 댓글 쓰기
		int commentWrite(BbsComment bbs);	

		// 댓글 목록
		List<BbsComment> commentList(int seq);
		
		// 댓글 수정
		int updateComment(BbsComment bbs);
		
		// 댓글 삭제
		int deleteComment(BbsComment bbs);
}
