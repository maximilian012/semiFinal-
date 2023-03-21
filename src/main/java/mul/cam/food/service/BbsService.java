package mul.cam.food.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import mul.cam.food.dto.BbsComment;
import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.BbsParam;
import mul.cam.food.dto.MemberDto;

public interface BbsService {

	boolean bbswrite(BbsDto dto);

	List<BbsDto> getlist(BbsParam param);
	List<BbsDto> getFirstlist();
	List<BbsDto> mainHomegetBbs();

	List<BbsDto> recentBbs();
	
	int getAllBbsLen(BbsParam param);
	// searchResult
	List<BbsDto> getSearchList(BbsParam param);

	JsonObject SummerNoteImageFile(MultipartFile file);


	BbsDto getBbs(int seq);
	
	boolean commentWrite(BbsComment bbs);

	
	// 게시글 상세보기
	BbsDto detailBbs(int seq);	
	
	// 게시글 수정
	boolean updateBbs(BbsDto dto);			
	
	// 게시글 삭제
	boolean deleteBbs(int seq);			

	
	// 댓글 목록
	List<BbsComment> commentList(int seq);	
	
	// 댓글 수정
	boolean updateComment(BbsComment bbs);
	
	// 댓글 삭제
	boolean deleteComment(BbsComment bbs);

}
