package mul.cam.food.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mul.cam.food.dao.BbsDao;
import mul.cam.food.dto.BbsComment;
import mul.cam.food.dto.BbsDto;
import mul.cam.food.dto.BbsParam;
import mul.cam.food.dto.MemberDto;


@Repository // 저장소
public class BbsDaoImpl implements BbsDao {

	@Autowired
	SqlSession session;
	
	String ns = "Bbs.";
	
	@Override
	public List<BbsDto> mainHomegetBbs() {
		return session.selectList(ns + "mainHomegetBbs");
	}
	@Override
	public int bbswrite(BbsDto dto) {
		
		return session.insert(ns + "bbswrite", dto);
	}
	@Override
	public List<BbsDto> getlist(BbsParam param) {
		
		return session.selectList(ns + "getlist", param);
	}


	@Override
	public List<BbsDto> recentBbs() {
		return session.selectList(ns + "recentBbs");
	}

	@Override
	public BbsDto getBbs(int seq) {		
		return session.selectOne(ns + "getBbs", seq);
	}
	
	@Override
	public int commentWrite(BbsComment bbs) {		
		return session.insert(ns + "commentWrite", bbs);
	}
	@Override
	public List<BbsDto> getSearchlist(BbsParam param) {		
		return session.selectList(ns+"getSearchList", param);
	}
	@Override
	public int getAllBbsLen(BbsParam param) {
		
		return session.selectOne(ns+"getAllBbsLen", param);
	}
	@Override
	public List<BbsDto> getFirstList() {
		
		return session.selectList(ns+"getFirstlist");
	}


	@Override
	public BbsDto detailBbs(int seq) {		// 상세보기
		return session.selectOne(ns + "detailBbs", seq);
	}
	
	@Override
	public int updateBbs(BbsDto dto) {		// 게시판 수정
		return session.update(ns + "updateBbs", dto);
	}
	
	@Override
	public int deleteBbs(int seq) {			// 게시판 삭제
		return session.delete(ns + "deleteBbs", seq);
	}


	@Override
	public List<BbsComment> commentList(int seq) {	// 댓글 목록
		return session.selectList(ns + "commentList", seq);
	}
	
	@Override
	public int updateComment(BbsComment bbs) {		// 댓글 수정
		return session.update(ns + "updateComment", bbs);
	}
	
	@Override
	public int deleteComment(BbsComment bbs) {		// 댓글 삭제
		return session.delete(ns + "deleteComment", bbs);
	}
	

}
